(function(IGRP){
   
    var calendars = {};

    var _opts     = {
        locale:'pt'
    },

    afterLoading = false;

    var calendarComponent = new IGRP.component('calendar',{
        get:function(id){
            return calendars[id];
        },
        getViewParam : function(id){
            var view = $.IGRP.components.calendar.get(id).fullCalendar('getView');

            $.IGRP.utils.createHidden({
                name :'p_start',
                value:view.intervalStart.format().igrpDateFormat(),
                class:'submittable'
            });

            $.IGRP.utils.createHidden({
                name :'p_end',
                value:view.intervalEnd.format().igrpDateFormat(),
                class:'submittable'
            });

            $.IGRP.utils.createHidden({
                name :'p_view',
                value:view.type,
                class:'submittable'
            });
        },
        nextOrPrevButtom : function(holder){
            var id = $('.igrp-calendar',holder).attr('id');

            holder.on('click','.fc-prev-button, .fc-next-button',function(){
                $.IGRP.components.calendar.getViewParam(id);
            });
        },
        resizeORdropEvent : function(p){
            var param = 'p_event_id='+p.event.id;

            param +='&p_start='+p.event.start.format();
            
            if (p.event.end)
                param +='&p_end='+p.event.end.format();

            $.ajax({
                url   : p.url,
                data  : param,
                type  :"POST",
                method:"POST"
            }).done(function(d,s,r){
                var contentType = r.getResponseHeader('Content-Type'),
                    resType     = contentType.split(';')[0],
                    type        = 'info',
                    message     = '';

                if (resType.indexOf('xml') != -1) {
                    var msg = $(d).find('messages message');

                    type    = msg.attr('type');
                    message = msg.text();
                }else{
                    d       = JSON.parse(d) || $.parseJSON(d);

                    type    = d.type;
                    message = d.message
                }

                type = type == 'error' ? 'danger' : type;

                $.IGRP.notify({
                    message : $.IGRP.utils.htmlDecode(message),
                    type    : type
                });

                console.log(d);
            }).fail(function(d){
                $.IGRP.notify({
                    message : $.IGRP.utils.htmlDecode(d.responseText),
                    type    : 'danger'
                });
                p.revert();
            });
        },
        dateConvert : function(d){
            var data;
            if(d.indexOf("T") !=- 1){
                d    = d.split('T');
                data = d[0].replace(/(\d*)-(\d*)-(\d*)/,'$3-$2-$1')+'T'+d[1];
            }else
                data = d.replace(/(\d*)-(\d*)-(\d*)/,'$3-$2-$1');

            return data;
        },
        daysOffEvents : function(daysoff,arr){

        },
        init:function(id,p){
            var options 		= $.extend(_opts,p),
                cal     		= $('.igrp-calendar#'+id),
                view    		= p.defaultview ? p.defaultview : 'month',
                ebeforetoday    = p.ebeforetoday && p.ebeforetoday == 'false' ? true : false,
                daysoff         = p.daysoff ? p.daysoff.split(',') : [],
                date    		= p.defaultdate ? p.defaultdate : new Date().toJSON().slice(0,10).replace(/(\d*)-(\d*)-(\d*)/,'$3-$2-$1');
           
            cal.on('contextmenu', function (e) {
                e.preventDefault();
            });
            
            var holder = cal.parent(),
            	locale = options.locale  ? options.locale : 'pt';
            
            var calendar = cal.fullCalendar({
                header:{
                    left    : p.header && p.header != 'null' ? p.header : 'prev,title,next',
                    center  : '',
                    right   : p.views && p.views != 'null' ? p.views : 'month,agendaWeek,agendaDay,today'
                },
                displayEventEnd :{
                    month     : true,
                    basicWeek : true,
                    default   : true
                },
                locale       : locale,
                firstDay     : p.firstday && p.firstday == '-0' ? 0 : 1,
                defaultDate  : $.IGRP.components.calendar.dateConvert(date),
                editable     : true,
                eventLimit   : true,
                lazyFetching : true,
                weekends     : p.weekends && p.weekends == 'true' ? false : true,
        		businessHours: {
                    daysOfWeek: [ 1, 2, 3, 4],
                    startTime : '00:00',
                    endTime   : '23:00',
                },
                defaultView :view,
                //events: p.loadevents,
                events: function(start, end, timezone, callback) {

                    $.ajax({
                        url		:	p.loadevents ? p.loadevents : $.IGRP.utils.getPageUrl(),
                        data  	:	$.IGRP.utils.getForm().serializeArray(),
                        type  	:	"POST",
                        method 	:	"POST",
                        dataType: 	'xml',
                        cache 	:	false,
                        success: function(doc) {
                            
                            var events = [];

                            $.each($(doc).find(id+'_events table value row'),function(i,row){
                                var attrs   = $(row).find('> *:not(context-menu)').toArray(),
                                eAtrrs      = {};
                                for(var attr in attrs){
                                    var element = $(attrs[attr]),
                                    name        = element.prop('tagName'),
                                    value       = element.text(),
                                    nValue      = value;
                                    name        = name.indexOf(id) !=-1 ? name.split(id+'_')[1] : name;
                                    name        = (name == 'allday')?'allDay':name;
                                    //name        = (name == 'backgroundcolor')?'backgroundColor':name;
                                    nValue      = (name == 'end' || name == 'start')?$.IGRP.components.calendar.dateConvert(value):value;
                                    
                                    if (name == 'allDay') {
                                        nValue = value == 'true' ? true : false;
                                    }
                                    eAtrrs[name]= nValue;
                                }

                                var ctx_param = [];
                                $.each($(row).find('context-menu param'),function(c,ctx){
                                    ctx_param.push($(ctx).text());
                                });

                                eAtrrs['context-param'] = ctx_param;

                                events.push(eAtrrs);
                            });

                            if(daysoff[0]){
                                daysoff.forEach(function(d){
                                    var startDate   = $.IGRP.components.calendar.dateConvert(d),
                                        endDate     = moment(startDate,'YYYY-MM-DD').add('days', 1).format('YYYY-MM-DD');
                                   
                                    events.push({
                                        start: startDate,
                                        end: endDate,
                                        overlap: false,
                                        rendering: 'background',
                                        color: '#d7d7d7'
                                    });
                                });
                            }

                            callback(events);

                        },error:function(status){
                            console.log('loading events report error: '+status);
                        }
                    });
                },
                timeFormat: 'H:mm',
                eventColor: '#008975',
                loading:function(isLoading, view ){
                    if(isLoading)
                        $.IGRP.utils.loading.show(holder);
                    else{
                        afterLoading = true;
                        $.IGRP.utils.loading.hide(holder);
                    }
                },
                eventAfterRender:function( event, element, view ) {
                    
                },
                eventRender : function(event, element){

                    var ctxParams = event["context-param"];

                    if(ctxParams && ctxParams[0]){
                        element.attr('CTX_PARAM_COUNT',ctxParams.length);
                        
                        ctxParams.forEach(function(c,i){
                            var idx = i+1;
                            element.attr('ctx_p'+idx,c);
                        });
                    }

                    if (event.description) {
                        element.attr('title',event.description).attr('data-toggle','tooltip').attr('data-html',true);
                        //.attr('data-placement','right')
                    }

                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {
                            //contextMenu
                            $.IGRP.components.contextMenu.set(holder,{
                                scope : '.fc-event-container>a',
                                menu  : '.igrp-calendar-ctx',
                                setPosition:function(e,p){

                                    var parent      = $(p.ctxMenu.parents('.box')[0]),
                                        parentLeft  = parent.offset().left,
                                        parentTop   = parent.offset().top,
                                        ctxLeft     = e.pageX - parentLeft,
                                        ctxTop      = e.pageY - parentTop;

                                    if (e.pageX - parentLeft + p.ctxMenu.width() > parent.width())
                                        ctxLeft = ctxLeft - p.ctxMenu.width()
                                    
                                    p.ctxMenu.css({
                                        top  : ctxTop,
                                        left : ctxLeft
                                    });
                                }
                            });
                        }
                    });
                },
                dayClick : function(date, allDay ,jsEvent, view) {
                    var xdate = date.format().igrpDateFormat(),
                        valid = true;

                    if(ebeforetoday)
                        valid = moment().subtract(1, "days").isBefore(moment(date));

                    if (p.addevents && valid && $.inArray(xdate, daysoff) === -1) {
                        
                        mWindow = mWindow ? mWindow : window;
			
				        mUrl = $('#p_env_frm_url').val() || window.location.href;

                        $.IGRP.components.iframeNav.set({
                            url     : $.IGRP.utils.getUrl(p.addevents)+'p_date='+xdate,
                            clicked : $('<a close="refresh"/>')
                        });
                    }
                    
                },
                eventClick : function(event, jsEvent, view) {
                    /*var table = $(jsEvent.target).parents('.fc-content-skeleton'),
                        index = $(jsEvent.target).parents('.fc-event-container').index(),
                        edit  = p.alleditevents ? p.alleditevents : p.addevents,
                        param = 'p_date='+$('table thead tr td:eq('+index+')',table).attr('data-date').igrpDateFormat();*/
                    var edit  = p.alleditevents ? p.alleditevents : p.addevents,
                    	data  = {
                            url : $.IGRP.utils.getUrl(edit)+'p_event_id='+event.id
                        };
                    
                    if(p.refreshonedit && p.refreshonedit == 'true')
                    	data['clicked'] = $('<a close="refresh"/>');

                    if (edit) {
                        $.IGRP.components.iframeNav.set(data);
                    }
                },
                eventDrop : function(event, delta, revertFunc, jsEvent) {
                    $.IGRP.components.calendar.resizeORdropEvent({
                        event   : event,
                        delta   : delta,
                        revert  : revertFunc,
                        id      : id,
                        jsEvent : jsEvent,
                        url     : p.editevents
                    });
                },
                eventResize : function(event, delta, revertFunc) {
                    $.IGRP.components.calendar.resizeORdropEvent({
                        event  : event,
                        delta  : delta,
                        revert : revertFunc,
                        id     : id,
                        url    : p.editevents
                    });
                },
                eventMouseover : function(event){
                }
            });

            if(afterLoading){
                calendars[id] = calendar;

                $.IGRP.components.calendar.nextOrPrevButtom(holder);

                $.IGRP.components.calendar.getViewParam(id);
            }
            
        }
    });
})($.IGRP);