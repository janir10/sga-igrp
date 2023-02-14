<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-6c1e21e2"><div class="gen-column col-sm-4"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if></div></div><div class="gen-column col-sm-2"><div class="gen-inner"><xsl:if test="rows/content/view_1"><div class="box clearfix view-block gen-container-item sukundi" has-img="false" template="default" item-separator-border="true" gen-class="sukundi" item-name="view_1"><div class="box-body"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/view_1/fields"/><xsl:if test="rows/content/view_1/fields/view_1_img"><img src="{rows/content/view_1/fields/view_1_img/value}"/></xsl:if><div class="view-body clearfix "><xsl:if test="rows/content/view_1/fields/documento"><div class="view-item gen-fields-holder sukundi" item-name="documento"><a href="{rows/content/view_1/fields/documento/value}" target="_newtab" sharpadbclient="" target-fields="" request-fields=""><i class="fa fa-question-circle"/><span><span><xsl:value-of select="rows/content/view_1/fields/documento/label"/></span></span></a></div></xsl:if></div></div></div></xsl:if></div></div><div class="gen-column col-sm-2"><div class="gen-inner"><xsl:if test="rows/content/view_2"><div class="box clearfix view-block gen-container-item sukundi" has-img="false" template="default" item-separator-border="true" gen-class="sukundi" item-name="view_2"><div class="box-body"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/view_2/fields"/><xsl:if test="rows/content/view_2/fields/view_2_img"><img src="{rows/content/view_2/fields/view_2_img/value}"/></xsl:if><div class="view-body clearfix "><xsl:if test="rows/content/view_2/fields/forum"><div class="view-item gen-fields-holder sukundi" item-name="forum"><a href="{rows/content/view_2/fields/forum/value}" target="_newtab" sharpadbclient="" target-fields="" request-fields=""><i class="fa fa-comments"/><span><span><xsl:value-of select="rows/content/view_2/fields/forum/label"/></span></span></a></div></xsl:if></div></div></div></xsl:if></div></div><div class="gen-column col-sm-4"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder   pull-right" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if></div></div></div><div class="row " id="row-5eafc561"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/aplicacao"><div class="col-sm-4 form-group  gen-fields-holder" item-name="aplicacao" item-type="select"><label for="{rows/content/form_1/fields/aplicacao/@name}"><xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/></label><select class="form-control select2 IGRP_change" id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/lst_dominio"><div class="col-sm-4 form-group  gen-fields-holder" item-name="lst_dominio" item-type="select"><label for="{rows/content/form_1/fields/lst_dominio/@name}"><xsl:value-of select="rows/content/form_1/fields/lst_dominio/label"/></label><select class="form-control select2 " id="form_1_lst_dominio" name="{rows/content/form_1/fields/lst_dominio/@name}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/lst_dominio"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/lst_dominio/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/novo_dominio"><div class="form-group col-sm-4 pull-right  gen-fields-holder" item-name="novo_dominio" item-type="text"><label for="{rows/content/form_1/fields/novo_dominio/@name}"><span><xsl:value-of select="rows/content/form_1/fields/novo_dominio/label"/></span></label><input type="text" value="{rows/content/form_1/fields/novo_dominio/value}" class="form-control  " id="{rows/content/form_1/fields/novo_dominio/@name}" name="{rows/content/form_1/fields/novo_dominio/@name}" maxlength="250" placeholder="{rows/content/form_1/fields/novo_dominio/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/novo_dominio"/></xsl:call-template></input></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/formlist_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1"><div class="box-body table-box"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/><table id="formlist_1" class="table table-striped gen-data-table ordertable IGRP_formlist    " rel="T_formlist_1" data-control="data-formlist_1"><thead><tr><xsl:if test="rows/content/formlist_1/fields/description"><th td-name="description" align="" show-label="" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/formlist_1/fields/description/label"/></span></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/key"><th td-name="key" align="" show-label="" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/formlist_1/fields/key/label"/></span></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/estado"><th class="bs-checkbox gen-fields-holder" align=""><label class="container-box "><span><xsl:value-of select="rows/content/formlist_1/fields/estado/label"/></span><input type="checkbox" class="IGRP_checkall" check-rel="estado" data-title="Ativo?" data-toggle="tooltip"/><span class="checkmark"/></label></th></xsl:if><xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)"><th class="table-btn add"><xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)"><a class="formlist-row-add btn btn-primary" rel="formlist_1" title="Add" data-toggle="tooltip" data-placement="left"><i class="fa fa-plus"/></a></xsl:if></th></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/formlist_1/table/value/row[not(@total='yes')]"><tr row="{position()}"><input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/><input type="hidden" name="p_ordem_fk" value="{ordem}"/><input type="hidden" name="p_ordem_fk_desc" value="{ordem_desc}"/><xsl:apply-templates mode="form-hidden-fields" select="."/><xsl:if test="description"><xsl:if test="not(description/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/description/label}" class="text" item-name="description"><input type="hidden" name="{../../../fields/description/@name}_fk_desc" value="{description_desc}"/><div class="form-group" item-name="description" item-type="text"><input type="text" name="{../../../fields/description/@name}_fk" value="{description}" class="text form-control" rel="F_formlist_1" placeholder="Yes"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/description"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="key"><xsl:if test="not(key/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/key/label}" class="text" item-name="key"><input type="hidden" name="{../../../fields/key/@name}_fk_desc" value="{key_desc}"/><div class="form-group" item-name="key" item-type="text"><input type="text" name="{../../../fields/key/@name}_fk" value="{key}" class="text form-control" rel="F_formlist_1" placeholder="Y"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/key"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="estado"><xsl:if test="not(estado/@visible)"><td align="" class="bs-checkbox" data-row="{position()}" data-title="{../../../fields/estado/label}" item-name="estado" item-type="checkbox"><div class="" item-name="estado" item-type="checkbox"><label class="container-box"><input type="hidden" name="p_estado_fk_desc" value="{estado_desc}"/><xsl:if test="estado != '-0'"><input type="checkbox" name="p_estado_fk" value="{estado}" class="checkbox checkdcontrol" rel="F_formlist_1" check-rel="estado"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/formlist_1/fields/estado"/></xsl:call-template><xsl:if test="estado_check = estado"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><span class="checkmark"/></xsl:if><input type="hidden" name="p_estado_check_fk" class="estado_check"><xsl:if test="estado_check = estado"><xsl:attribute name="value"><xsl:value-of select="estado"/></xsl:attribute></xsl:if></input></label></div><xsl:if test="estado_check != estado"><input type="hidden" class="estado" name="p_estado_fk" value="{estado}"/></xsl:if></td></xsl:if></xsl:if><xsl:if test="not(@nodelete) or not(@noupdate)"><td class="table-btn delete" data-row="{position()}"><xsl:if test="not(@nodelete)"><span class="formlist-row-remove btn btn-danger" rel="formlist_1" title="Remove" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-times"/></span></xsl:if></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></xsl:if><xsl:if test="rows/content/table_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/table_1/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body "><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="table_1" class="table table-striped  igrp-data-table IGRP_contextmenu " exports=""><thead><tr><xsl:if test="rows/content/table_1/fields/dominio"><th td-name="dominio" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/dominio/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/table/context-menu/item"><th class="igrp-table-ctx-th"/></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><input type="hidden" name="p_id_dom_fk" value="{id_dom}"/><input type="hidden" name="p_id_dom_fk_desc" value="{id_dom_desc}"/><xsl:if test="dominio"><td align="left" data-order="{dominio}" data-row="{position()}" data-title="{../../../fields/dominio/label}" class="text" item-name="dominio"><span class=""><xsl:value-of select="dominio"/></span></td></xsl:if><xsl:if test="//rows/content/table_1/table/context-menu/item"><td class="igrp-table-ctx-td"><xsl:apply-templates select="../../context-menu" mode="table-context-inline"><xsl:with-param name="row-params" select="context-menu"/><xsl:with-param name="type" select="'inl'"/></xsl:apply-templates></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/formgen/js/jquery-ui.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/><script src="{$path}/core/igrp/IGRP.rules.class.js"/><script>
$.IGRP.rules.set({"p_aplicacao":[{"name":"clean valie","events":"load","isTable":false,"conditions":{"rules":[{"condition":"","value":"","value2":"","patern":"","patern_custom":"","opposite":""}],"actions":[{"action":"cleanValue","targets":"lst_dominio","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}],"p_lst_dominio":[{"name":"Hide button and table","events":"load,change,blur","isTable":false,"conditions":{"rules":[{"condition":"null","value":"","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"show","targets":"novo_dominio","procedure":"","request_fields":"","msg_type":"","msg":""},{"action":"required","targets":"novo_dominio","procedure":"","request_fields":"","msg_type":"","msg":""},{"action":"hide","targets":"formlist_1","procedure":"","request_fields":"","msg_type":"","msg":""},{"action":"remote_list","targets":"toolsbar_1","procedure":"webapps?r=igrp/Dominio/index","request_fields":"form_1","msg_type":"","msg":""}]}},{"name":"clean value","events":"load,change","isTable":false,"conditions":{"rules":[{"condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"cleanValue","targets":"novo_dominio","procedure":"","request_fields":"","msg_type":"","msg":""},{"action":"remote_list","targets":"toolsbar_1,formlist_1","procedure":"webapps?r=igrp/Dominio/index","request_fields":"form_1","msg_type":"","msg":""},{"action":"show","targets":"formlist_1","procedure":"","request_fields":"","msg_type":"","msg":""}]}},{"name":"showListdomain","events":"load,change","isTable":false,"conditions":{"rules":[{"condition":"null","value":"","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"show","targets":"table_1","procedure":"","request_fields":"","msg_type":"","msg":""}]}}]},'actionsList');</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=16"/></xsl:stylesheet>
