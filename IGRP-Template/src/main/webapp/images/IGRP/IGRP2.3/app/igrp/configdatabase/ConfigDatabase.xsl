<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style>th.pagelist-status input.IGRP_checkall{  display:none;}</style></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-a57f59aa"><div class="gen-column col-sm-7"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if></div></div><div> <a href="{rows/content/form_1/fields/link_doc/value}" class="bpmn-controller link btn btn-link form-link" target="_newtab" request-fields="">
                      <i class="fa fa-question-circle" style="margin-right:5px"></i>Help
                      </a> <a href="https://gitter.im/igrpweb/database?utm_source=share-link&amp;utm_medium=link&amp;utm_campaign=share-link" class="bpmn-controller link btn btn-link form-link" target="_newtab" request-fields="">
                      <i class="fa fa-comments" style="margin-right:5px"></i>Forum
                      </a></div> <div class="gen-column col-sm-5"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder  btn-group-justified" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if></div></div></div><div class="row demo@nosi.cv" id="row-78351398"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/aplicacao"><div class="col-sm-4 form-group  gen-fields-holder" item-name="aplicacao" item-type="select" required="required"><label for="{rows/content/form_1/fields/aplicacao/@name}"><xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/></label><select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/tipo_base_dados"><div class="col-sm-4 form-group  gen-fields-holder" item-name="tipo_base_dados" item-type="select" required="required"><label for="{rows/content/form_1/fields/tipo_base_dados/@name}"><xsl:value-of select="rows/content/form_1/fields/tipo_base_dados/label"/></label><select class="form-control select2 IGRP_change" id="form_1_tipo_base_dados" name="{rows/content/form_1/fields/tipo_base_dados/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/tipo_base_dados"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/tipo_base_dados/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/nome_de_conexao"><div class="form-group col-sm-4   gen-fields-holder" item-name="nome_de_conexao" item-type="text" required="required"><label for="{rows/content/form_1/fields/nome_de_conexao/@name}"><span><xsl:value-of select="rows/content/form_1/fields/nome_de_conexao/label"/></span></label><input type="text" value="{rows/content/form_1/fields/nome_de_conexao/value}" class="form-control  " id="{rows/content/form_1/fields/nome_de_conexao/@name}" name="{rows/content/form_1/fields/nome_de_conexao/@name}" required="required" maxlength="255" placeholder="{rows/content/form_1/fields/nome_de_conexao/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/nome_de_conexao"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/config"><div item-name="config" class="box-head subtitle gen-fields-holder" text-color="1"><span><xsl:value-of select="rows/content/form_1/fields/config/label"/></span></div></xsl:if><xsl:if test="rows/content/form_1/fields/url_connection"><div class="form-group col-sm-8   gen-fields-holder" item-name="url_connection" item-type="text" required="required"><label for="{rows/content/form_1/fields/url_connection/@name}"><span><xsl:value-of select="rows/content/form_1/fields/url_connection/label"/></span></label><input type="text" value="{rows/content/form_1/fields/url_connection/value}" class="form-control  " id="{rows/content/form_1/fields/url_connection/@name}" name="{rows/content/form_1/fields/url_connection/@name}" required="required" maxlength="255" placeholder="{rows/content/form_1/fields/url_connection/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/url_connection"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/driver_connection"><div class="form-group col-sm-4   gen-fields-holder" item-name="driver_connection" item-type="text" required="required"><label for="{rows/content/form_1/fields/driver_connection/@name}"><span><xsl:value-of select="rows/content/form_1/fields/driver_connection/label"/></span></label><input type="text" value="{rows/content/form_1/fields/driver_connection/value}" class="form-control  " id="{rows/content/form_1/fields/driver_connection/@name}" name="{rows/content/form_1/fields/driver_connection/@name}" required="required" maxlength="250" placeholder="{rows/content/form_1/fields/driver_connection/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/driver_connection"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/paragraph_1"><div class="col-sm-8  form-group   gen-fields-holder" item-name="paragraph_1" item-type="plaintext" style="min-height:20px;&#10;font-weight: 500;&#10;margin-left:10px;"><xsl:value-of select="rows/content/form_1/fields/paragraph_1/value"/></div></xsl:if><xsl:if test="rows/content/form_1/fields/credenciais"><div item-name="credenciais" class="box-head subtitle gen-fields-holder" text-color="1"><span><xsl:value-of select="rows/content/form_1/fields/credenciais/label"/></span></div></xsl:if><xsl:if test="rows/content/form_1/fields/username"><div class="form-group col-sm-4   gen-fields-holder" item-name="username" item-type="text" required="required"><label for="{rows/content/form_1/fields/username/@name}"><span><xsl:value-of select="rows/content/form_1/fields/username/label"/></span></label><input type="text" value="{rows/content/form_1/fields/username/value}" class="form-control  " id="{rows/content/form_1/fields/username/@name}" name="{rows/content/form_1/fields/username/@name}" required="required" maxlength="80" placeholder="{rows/content/form_1/fields/username/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/username"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/password"><div class="form-group col-sm-4   gen-fields-holder" item-name="password" item-type="password"><label for="{rows/content/form_1/fields/password/@name}"><span><xsl:value-of select="rows/content/form_1/fields/password/label"/></span></label><input type="password" value="{rows/content/form_1/fields/password/value}" class="form-control  " id="{rows/content/form_1/fields/password/@name}" name="{rows/content/form_1/fields/password/@name}" maxlength="80" placeholder="{rows/content/form_1/fields/password/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/password"/></xsl:call-template></input></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div><div class="row " id="row-9b36bc42"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/table_1"><div class="box box-table-contents gen-container-item isac" gen-class="isac" item-name="table_1"><div class="box-body "><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="table_1" class="table table-striped   IGRP_contextmenu " exports=""><thead><tr><xsl:if test="rows/content/table_1/fields/default_"><th class=" gen-fields-holder pagelist-status" align="left"><span><xsl:value-of select="rows/content/table_1/fields/default_/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/nome_de_conexao_tabela"><th td-name="nome_de_conexao_tabela" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/nome_de_conexao_tabela/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/user_name_tabela"><th td-name="user_name_tabela" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/user_name_tabela/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/tipo_de_base_de_dados_tabela"><th td-name="tipo_de_base_de_dados_tabela" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/tipo_de_base_de_dados_tabela/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/t_url_connection"><th td-name="t_url_connection" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/t_url_connection/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/t_driver_connection"><th td-name="t_driver_connection" align="left" show-label="true" class="text  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/t_driver_connection/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/table/context-menu/item"><th class="igrp-table-ctx-th"/></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><input type="hidden" name="p_id_fk" value="{id}"/><input type="hidden" name="p_id_fk_desc" value="{id_desc}"/><xsl:if test="default_"><td align="left" data-row="{position()}" data-title="{../../label/default_}" class="bs-checkbox pagelist-status" item-name="default_"><xsl:choose><xsl:when test="default_ != '-0'"><label class="container-box"><input type="radio" name="p_default__fk" value="{default_}"><xsl:if test="default__check=default_"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><span class="radiomark"/></label></xsl:when><xsl:otherwise><input type="hidden" name="p_default_" value="{default_}"/></xsl:otherwise></xsl:choose></td></xsl:if><xsl:if test="nome_de_conexao_tabela"><td align="left" data-order="{nome_de_conexao_tabela}" data-row="{position()}" data-title="{../../../fields/nome_de_conexao_tabela/label}" class="text" item-name="nome_de_conexao_tabela"><span class=""><xsl:value-of select="nome_de_conexao_tabela"/></span></td></xsl:if><xsl:if test="user_name_tabela"><td align="left" data-order="{user_name_tabela}" data-row="{position()}" data-title="{../../../fields/user_name_tabela/label}" class="text" item-name="user_name_tabela"><span class=""><xsl:value-of select="user_name_tabela"/></span></td></xsl:if><xsl:if test="tipo_de_base_de_dados_tabela"><td align="left" data-order="{tipo_de_base_de_dados_tabela}" data-row="{position()}" data-title="{../../../fields/tipo_de_base_de_dados_tabela/label}" class="text" item-name="tipo_de_base_de_dados_tabela"><span class=""><xsl:value-of select="tipo_de_base_de_dados_tabela"/></span></td></xsl:if><xsl:if test="t_url_connection"><td align="left" data-order="{t_url_connection}" data-row="{position()}" data-title="{../../../fields/t_url_connection/label}" class="text" item-name="t_url_connection"><span class=""><xsl:value-of select="t_url_connection"/></span></td></xsl:if><xsl:if test="t_driver_connection"><td align="left" data-order="{t_driver_connection}" data-row="{position()}" data-title="{../../../fields/t_driver_connection/label}" class="text" item-name="t_driver_connection"><span class=""><xsl:value-of select="t_driver_connection"/></span></td></xsl:if><xsl:if test="//rows/content/table_1/table/context-menu/item"><td class="igrp-table-ctx-td"><xsl:apply-templates select="../../context-menu" mode="table-context-inline"><xsl:with-param name="row-params" select="context-menu"/><xsl:with-param name="type" select="'inl'"/></xsl:apply-templates></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/><script src="{$path}/core/igrp/IGRP.rules.class.js"/><script>
$.IGRP.rules.set({"p_tipo_base_dados":[{"name":"hide other fields","events":"load","isTable":false,"conditions":{"rules":[{"condition":"null","value":"","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"hide","targets":"toolsbar_1,config,url_connection,driver_connection,paragraph_1,credenciais,username,password","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}],"p_default_":[{"name":"checked","events":"change","isTable":true,"conditions":{"rules":[{"condition":"","value":"","value2":"","patern":"","patern_custom":"","opposite":""}],"actions":[{"action":"remote","targets":"default_","procedure":"webapps?r=igrp/ConfigDatabase/changeStatus","request_fields":"default_,nome_de_conexao_tabela,user_name_tabela,id","msg_type":"info","msg":""},{"action":"message","targets":"","procedure":"","request_fields":"","msg_type":"info","msg":"Default changed"}]}}]},'actionsList');</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=21"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=21"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=21"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=21"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=21"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=21"/></xsl:stylesheet>
