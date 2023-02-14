(function(){

	var com;

	var lang = document.cookie.split(';');

	var stripHtml = function(html){
		var tmp = document.createElement("DIV");
		tmp.innerHTML = html;
		var str = tmp.textContent || tmp.innerText || "";

		return $.trim(str);
	};

	var exportOptionsFormat = function(data, node){
		return $('.table-info-group-main',$(node))[0] ? $('.table-info-group-main',$(node)).text() : stripHtml(data);
	}
	
	var exportOptions = {

			pdf : {
	           extend          : 'pdfHtml5',
	           text            : '<i class="fa fa-file-pdf-o"></i> PDF',
	           titleAttr       : 'Exportar para PDF',
	           className 	   : 'btn btn-danger btn-xs',
	           exportOptions   : {
	               columns     : ':not(.igrp-table-ctx-th)',
				   format	   : {
						body : function ( data, row, column, node ) {
							return exportOptionsFormat(data,node);
						}
					}
	           },
	           customize: function (doc) {
	        	   var tcontent = doc.content[1] || doc.content[0];
	        	   
	        	   if(tcontent && tcontent.table)
	        		   tcontent.table.widths = Array(tcontent.table.body[0].length + 1).join('*').split('');
	           }
	       },

	       excel : {
	           extend          : 'excelHtml5',
	           text            : '<i class="fa fa-file-excel-o"></i> Excel',
	           titleAttr       : 'Exportar para Excel',
	           className 	   : 'btn btn-success btn-xs',
	           exportOptions   : {
	                columns    : ':not(.igrp-table-ctx-th)',
				    format	   : {
						body : function ( data, row, column, node ) {
							return exportOptionsFormat(data,node);
						}
					}
	           }
	       }

		};
	
	$.IGRP.component('tableCtrl',{
		ordertable : function(selector){

			selector = selector || '.ordertable';

			if ($(selector)[0] && $.fn.sortable) {

				var form = $.IGRP.utils.getForm();

				$(selector+' tbody').sortable({
					containment 	: "parent",
					scroll :false,
					forceHelperSize : true,
					distance 		: 5,
		            stop  			: function(e){

		            	var id 	 = $(e.target).parents('table').attr('id'),

		            		name = 'p_fwl_'+id+'_order';

		              	$('input[name="'+name+'"]').remove();

		              	$('tr',$(e.target)).each(function(){
		              		
		              		var obj = $('input[name="p_'+id+'_id"]',$(this));

		              		obj = obj[0] ? obj : $('input[name="p_'+id+'_id_fk"]',$(this));

		              		if (obj.val()) 
		              			form.append('<input type="hidden" class="submittable" name="'+name+'" value="'+obj.val()+'"/>');
		              	});
		            }
	           });
			}
		},
		
		configGroups : function(op){
			
			var o = $.extend({
				thSelector : 'th[group-in != ""]',
				parent : 'body'
			}, op);
			
			var rows = $('table.table[id] tbody tr', o.parent);
			
			if(!rows[0] && $('table.table[id] thead tr th[group-in]', o.parent)[0]){
				
				$('table.table[id] thead tr th[group-in]', o.parent).each(function(i, th){
					
					var thFoot = $('tfoot td[td-name="'+$(this).attr('td-name')+'"]',$(this).parents('table'));
					
					$(th).remove();
					
					if(thFoot[0])
						thFoot.remove();
					
				});
			}
			else{
				
				rows.each(function(trIndex, tr){
					
					var table = $(tr).parents('table');
					
					var tdContent;
	
					$(o.thSelector, table).each(function(i, th){
						
						var thName    = $(this).attr('td-name'),
						
							groupName = $(this).attr('group-in'),
							
							tdHolder = $('td[item-name="'+groupName+'"]', tr),
							
							tdInfo   = $('td[item-name="'+thName+'"]',tr);
						
						if(tdHolder[0] && tdInfo[0]){
							
							$(th).removeClass('is-grouped');
							
							var infoHolder = $('<div class="table-info-holder" item-name="'+thName+'">'+
													'<div class="table-info-th '+$(th).attr('class')+'">'+$(th).html()+'</div>'+
													'<div class="table-info-td '+tdInfo.attr('class')+'">'+tdInfo.html()+'</div>'+
											   '</div>'),
								tdMainHolder;
											   
						
							if(!tdHolder.find('.table-info-group-main')[0]){
								
								tdMainHolder = $('<div class="table-info-group-main"></div>');
								
								tdHolder.append( tdMainHolder );
								
								tdHolder.find('>*').appendTo( tdMainHolder );
							}
							
					
							tdHolder.append( infoHolder );
							
							$(th).addClass('is-grouped');
							
							tdInfo.addClass('is-grouped');

							$('tfoot td[td-name="'+thName+'"]',table).addClass('is-grouped');
							
							/*var thFoot = $('tfoot td[td-name="'+thName+'"]',table);
							
							if(thFoot[0])
								thFoot.remove();*/
							
						}
	
					});			
					
				});
				
				//rows.parents('table').find('.is-grouped').remove();
			}
		},

		dataTable : function(op){

			var o = $.extend({

				selector 		: '.igrp-data-table',
				language 		: getCookie("igrp_lang"),
				parent          : 'body'

			}, op);

			var tables = $(o.selector,o.parent);

			if(tables[0] && $.fn.DataTable){
				
				var PageInfo = $.IGRP.info;

				tables.each(function(i,t){
					
					var headerContents = $(t).parents('.box-table-contents').first().find('.table-contents-head'),

						tableTitle 	   = $(t).parents('.box').first().find('.box-title').text() || $('#gen-page-title').text(),

						exprts 		   = $(t).attr('exports'),
						
						getInfo        = function(instance){
							
							return 'IGRP-datatable-'+instance+'-'+PageInfo.app+'-'+PageInfo.page;
						
						},

						options 	   = {

							dom: 'lfrtip',

							language: {

					            url: path+'/core/igrp/table/datatable/language/'+o.language+'.json'	

					        },
					        stateSave   : true,
					        
					        stateSaveCallback: function(settings,data) {
					        	
					            localStorage.setItem( getInfo( settings.sInstance ) , JSON.stringify(data) )
					            
					        },
					        stateLoadCallback: function(settings) {
					        	
					          return JSON.parse( localStorage.getItem( getInfo( settings.sInstance ) ) )
					          
					        },

					        order  		: [],

							columnDefs	: [{

						      	targets   : 'no-sort',

						      	orderable : false

						    }],
						    lengthMenu: [[20, 50, -1], [20, 50, "All"]],
					        initComplete:function(){}

						};

					if(exprts){

						var expArr = exprts.split(',');

						options.buttons = [];

						expArr.forEach(function(e){

							var eOpts = exportOptions[e];

							if(eOpts){
								
								eOpts.title = tableTitle;

								options.buttons.push( eOpts );

							}
							
						});

						options.dom = 'lfBrtip';

					};

					var datatable = $(t).DataTable(options);

					$.IGRP.on('submit',function(o){
						
						if(o.valid && o.target == 'submit'){
							datatable.destroy();
						}
					
	            	});
					
					$.IGRP.events.on('submit-ajax',function(o){
						
						if(o.valid)
							
							datatable.destroy();
	            	});
					
					/*$.IGRP.events.on('before-element-transform',function(p){

						if( $(t).parents('.gen-container-item').first().attr('item-name') == p.itemName )
							
							datatable.destroy();
							
		        	});*/
					
					$.IGRP.events.on('element-transform',function(p){

	            	 	var table = $('.table:not(.IGRP_formlist)',p.content);

		        		if(table[0] && table.hasClass('igrp-data-table') && table.attr('id') == $(t).attr('id'))
		        			datatable.destroy();
		        	});
					
				});

			}

		},
		
		setTableStyle : function(wrapper){
			
			wrapper = wrapper || $('.box-table-contents');
			
			wrapper.each(function(i,t){
				
				var legend = $(t).find('.box-table-legend');
				
				if(legend[0]){
					
					var itemName = $(t).attr('item-name'),
						
						style= '<style id="'+itemName+'">';
						
					legend.find('.legend-holder').each(function(i,l){
						
						var color = $(l).attr('legend-color'),
						
							value = $(l).attr('value');
						
						style+='[item-name="'+itemName+'"] table td.tdcolor span.tdcolor-item[value="'+value+'"] { background-color: '+color+' }'
						
					});
					
					style+='</style>';
					
					if(!$('html>head #'+itemName)[0])
						
						$('html>head').append(style);
					else
						$('html>head #'+itemName).html(style);
						
				
				}

			});
			
		},
			
		checkdControl : function(p){
			
			var inp     = $('input[type="hidden"].'+p.rel,p.o),
				table   = p.o.parents('table'),
				hidden  = '<input type="hidden" class="'+p.rel+'" value="'+p.value+'" name="p_'+p.rel+'_fk"/>',
				inpcheck = p.o.find( '.'+p.rel+'_check');
	
			if(p.check){
	
				inpcheck.val( p.value );
	
	            if (inp[0])
	                inp.remove();
	        }
	        else{
	
	        	inpcheck.val( '' );
	
	        	if (!inp[0])
	                p.o.append(hidden);
	        }
	
	        if(p.type == 'radio'){
	    		$('tbody tr td input[check-rel="'+p.rel+'"]',table).each(function(){
	    			var td = $(this).parents('td:first');
	
	    			if(!$('input[type="hidden"].'+p.rel,td)[0] && !$(this).is(':checked')){
	    				td.append(hidden);
	    				td.find( '.'+p.rel+'_check').val('');
	    			}
	    		});
	    	}
			
		},
		
		contextTHWidth : function(){

			$('th.igrp-table-ctx-th').each(function(i,th){

				var table   = $(th).parents('table').first(),

					tds     = table.find('tbody>tr').first().find('td.igrp-table-ctx-td'),

					buttons = tds.find('.table-ctx-holder>li'),

					mr 		= 4;//margin-right

				if(buttons.length>=3)

					$(th).css('width',128 );//.css('min-width',128)

				else

					$(th).width( (buttons.width()+mr) * buttons.length + 2)

			});

		},
		
		exportRow : function(row, attrs){
			
			var response = {};

			if(row[0]){
				
				if(attrs){
					
					attrs = typeof attrs === 'string' ? attrs.split(',') : attrs;

					if(attrs[0]){
						
						attrs.forEach(function(a){
							
							var label =  row.find('td[item-name="'+a+'"]').attr('data-title') || a,
							
								value = row.find('td[item-name="'+a+'"]>span').text() || row.find('input[name="p_'+a+'"]').val();

							response[label] = value;
							
						})
						
					}
					
				}
				
			}
			
			return response;
			
		},
		
		resetTableConfigurations : function(contents){
			
			contents.each(function(i,tholder){
				
				var tableHolder = $(tholder);
				
				if($('.table:not(.IGRP_formlist)',tableHolder)[0]){
					
		        	
		            var table = tableHolder.find('table'),
		            
						id    = table.attr('id');

					if($.IGRP.components.contextMenu)

						$.IGRP.components.contextMenu.set( tableHolder );

					
					com.configGroups({
						
						parent : tableHolder
						
					});
					
					if(table.hasClass('igrp-data-table')){

						$.IGRP.components.tableCtrl.dataTable({

							selector : 'table#'+id+'.igrp-data-table'

						});
					}

					if ($.IGRP.components.tableCtrl.pagination)
						$.IGRP.components.tableCtrl.pagination('ul[filter-name="p_'+id+'_filter"]');
		        }
				
			})
			
			
		},
		
		setEvents : function(){
			
			var _self = this;

			//CheckAll
			$(document).on('change', 'table .IGRP_checkall', function() {
				var table    = $(this).parents('.table').first(),
					checkrel = $(this).attr('check-rel'),
					checkers = $('[check-rel="'+checkrel+'"]:not(.IGRP_checkall):not([disabled])',table),
					checkAll = $(this).is(':checked');
					
				
				checkers.each(function(i,e){
					var parent 	 = $(e).parents('div[item-name="'+checkrel+'"]')[0] ? $(e).parents('div[item-name="'+checkrel+'"]') : $(e).parents('td');
					
					com.checkdControl({
						rel 	: checkrel,
						o   	: parent,
						check 	: checkAll,
						value   : $(e).val(),
						name    : $(e).attr('name')
					});
				});

				checkers.prop('checked',checkAll).attr('checked',checkAll);
			});

			$(document).on('change','table [item-type="checkbox"] input[type="checkbox"][name], table .checkdcontrol',function(e){
				
                var o   = $(this),
                    rel = o.attr('check-rel'),
                    obj = $('td[item-name="'+rel+'"]',o.parents('tr:first'));

                com.checkdControl({
                    rel     : rel,
                    o       : obj,
                    check   : o.is(':checked'),
                    value   : o.val(),
                    name    : o.attr('name'),
                    type  	: o.attr('type')
                });
            });
			
			$.IGRP.on('windowResize',function(){

            	com.contextTHWidth();

            });
			
			/*$.IGRP.events.on('element-transform',function(p){
				
				_self.resetTableConfigurations(p.content);
				
		    });*/
			
			$.IGRP.events.on('submit-complete',function(p){
				
				var content = p && p.item && p.item[0] ? p.item : $('.gen-container-item.box-table-contents');
				
				_self.resetTableConfigurations(content);
				
			})

		},
		
		operation : {
			isNum : function(v){
                return isNaN(v) ? 0 : v*1;
            },
			sum : {
	            allrow : function(p){
	                p.obj.each(function(i,tr){

						var total = 0;
						
	                    $(p.field,tr).each(function(io,o){
	                        total += com.operation.isNum($(o).val());
						});

						if($(p.result,tr)[0]){

							total = $.IGRP.utils.numberFormat({
								obj : p.result,
								val : total
							});

							$(p.result,tr).val(val);
						}
						
	                });
	            },

	            row : function(p){

					var total = 0;
					
	                $(p.field,p.obj).each(function(io,o){
	                    total += com.operation.isNum($(o).val());
					});
					
	                if ($(p.result,p.obj)[0]){
						
						total = $.IGRP.utils.numberFormat({
							obj: $(p.result, p.obj).filter('[numberformat]'),
							val : total
						});

						$(p.result,p.obj).val(total).trigger('change');
					}

	                return total;
	            },
	            col : function(p){
					var total = 0,
						obj   = null;
					
	                p.obj.each(function(i,tr){
						if(i === 0)
							obj = $(p.field,$(tr));

	                    total += com.operation.isNum($(p.field,$(tr)).val());
					});
					
	                if (p.result[0]){

						total = $.IGRP.utils.numberFormat({
							obj : obj,
							val : total
						});

						$(':input',p.result).val(total);
	                    $('p',p.result).html(total);
	                    $('input[name="p_'+p.result.attr('id')+'"]').change();
	                }

	                return total;
	            },
	            allcol : function(p){
					
					var total = {};
					
	                p.obj.each(function(i,tr){
	                    total[i] = com.operation.sum.col({
	                        obj     : p.obj,
	                        field   : $(p.field,'td:eq('+i+')'),
	                        result  : p.result
	                    });
	                });

	                return total;
	            }
			}
		},

		init:function(){
			
			com = this;

			com.configGroups();
			
			com.dataTable();
			
			com.setEvents();

			com.ordertable();

			com.setTableStyle();
			
			com.contextTHWidth();
			
		}

	},true);

	function getCookie(cname) {
	    var name = cname + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }	    
	    return "en_US";
	}
	
	$.extend({
	    replaceTag: function (currentElem, newTagObj, keepProps) {
	        var $currentElem = $(currentElem);
	        var i, $newTag = $(newTagObj).clone();
	        if (keepProps) {//{{{
	            newTag = $newTag[0];
	            newTag.className = currentElem.className;
	            $.extend(newTag.classList, currentElem.classList);
	            $.extend(newTag.attributes, currentElem.attributes);
	        }//}}}
	        $currentElem.wrapAll($newTag);
	        $currentElem.contents().unwrap();
	        // return node; (Error spotted by Frank van Luijn)
	        return this; // Suggested by ColeLawrence
	    }
	});

	$.fn.extend({
	    replaceTag: function (newTagObj, keepProps) {
	        // "return" suggested by ColeLawrence
	        return this.each(function() {
	            jQuery.replaceTag(this, newTagObj, keepProps);
	        });
	    }
	});
	
})();



