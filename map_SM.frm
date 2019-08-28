<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="now_data" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select a.* from (SELECT (data.month_yield/10000) as month_yield, (data.month_sales/10000) as month_sales, (data.month_coal_footage) as month_coal_footage, data.company_num, data.date FROM data WHERE  data.company_num = ${company_num} and date > (concat(YEAR(now()),'-01-01')) union SELECT (datas.month_yield/10000) as month_yield, (datas.month_sales/10000) as month_sales, (datas.month_coal_footage) as month_coal_footage, datas.company_num, datas.date FROM datas WHERE datas.company_num = ${company_num} and datas.date = curdate()) a order by a.date]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="data_for_the_same_period" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num, (month_yield/10000) as month_yield,(month_sales/10000) as month_sales, month_coal_footage, date FROM data WHERE company_num = ${company_num} and date > (concat(YEAR(now()) - 1,'-01-01')) and date <= (concat(YEAR(now()) - 1,'-12-31')) order by date]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="list_data" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="date"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=TODAY()]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM datas WHERE company_num=${company_num} and date = '${date}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="base_info" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM base_info WHERE company_num = ${company_num}]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="alarm_data" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select  concat(ss_alarm_stime, cs_mine_shortname, sys_name, ss_transducer_name) from alarm
]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="duty" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="date"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=TODAY()]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM duty WHERE company_num = ${company_num} AND date = '2019-07-21']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="sub_company" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[1012]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from base_info where name_sup_com = (select company_name from base_info where company_num = ${company_num}) order by capacity DESC

]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="high_risk" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info Where high_risk = 1]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="operational_status_open" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status=2]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_underground_workers" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM num_underground_workers WHERE company_num = '${company_num}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="base_info_map" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM base_info]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="Infrastructure_mine" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status = 0]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="joint_commissioning" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status = 1]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="city" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT '山西省' as pid, 'geographic/world/中国/山西省' as newpid union (SELECT distinct right(a_r_of_company,3) AS pid, CONCAT('geographic/world/中国/山西省/', a_r_of_company) as newpid FROM base_info WHERE company_num<9999 AND a_r_of_company is not null
)]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="city_map" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[1014]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM base_info WHERE name_sup_com = (select company_name from base_info where company_num = ${company_num})]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="city_company" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num, company_abbreviation FROM base_info WHERE company_num <= 1022]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="open" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status = 2]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="suspension_of_construction" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status = 3]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="close_mine" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_num FROM base_info WHERE operational_status = 4]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_mines_of_company" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status is not null]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_capacity_of_open_mine" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[1011]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name), SUM(capacity) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status=2]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_capacity_of_joint_commissioning" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name), SUM(capacity) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status=1]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_capacity_of_Infrastructure_mine" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name), SUM(capacity) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status=0]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="gas_grade" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from gas_grade]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="high_risk_types" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM high_risk_types]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_capacity_of_suspension_construction" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name), SUM(capacity) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status=3]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="num_capacity_of_close" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(company_name), SUM(capacity) FROM base_info WHERE left(company_num, LENGTH(${company_num})) = ${company_num} AND operational_status=4]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="security" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM security WHERE name_sup_com_num = ${company_num} OR ${company_num} =10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="order_hidden_danger" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_name, ${order_hidden_danger} AS reslut FROM security WHERE name_sup_com_num = ${company_num} ORDER BY ${order_hidden_danger} ASC LIMIT 0,10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="paiming" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_name, '${order_hidden_danger}' AS 
series_num, ${order_hidden_danger} AS result FROM security WHERE name_sup_com_num = ${company_num} ORDER BY ${order_hidden_danger} DESC LIMIT 0,10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="paiming_break_rule" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
<Parameter>
<Attributes name="order_break_rule"/>
<O>
<![CDATA[break_rule_A]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_name, '${order_break_rule}' AS 
series_num, ${order_break_rule} AS reslut FROM security WHERE name_sup_com_num = ${company_num} ORDER BY ${order_break_rule} DESC LIMIT 0,10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="paiming_order_accident" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
<Parameter>
<Attributes name="order_accident"/>
<O>
<![CDATA[accident_1]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_name, '${order_accident}' AS 
series_num,  ${order_accident} AS reslut FROM security WHERE name_sup_com_num = ${company_num} ORDER BY ${order_accident} DESC LIMIT 0,10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="paiming_order_question" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O>
<![CDATA[10]]></O>
</Parameter>
<Parameter>
<Attributes name="order_question"/>
<O>
<![CDATA[question_1]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT company_name, '${order_question}' AS 
series_num, ${order_question} AS reslut FROM security WHERE name_sup_com_num = ${company_num} ORDER BY ${order_question} DESC LIMIT 0,10]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="demo_major" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM demo_major WHERE type = '${order_hidden_danger}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="demo_hidden_danger" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[dataview_demo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM demo_hidden_danger]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="false" isAdaptivePropertyAutoMatch="false" appearRefresh="false" promptWhenLeaveWithoutSubmit="false"/>
</FormMobileAttr>
<Parameters>
<Parameter>
<Attributes name="city"/>
<O>
<![CDATA[geographic/world/中国/山西省]]></O>
</Parameter>
</Parameters>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<NorthAttr size="29"/>
<North class="com.fr.form.ui.container.WParameterLayout">
<WidgetName name="para"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<Listener event="afteredit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[_g().parameterCommit();]]></Content>
</JavaScript>
</Listener>
<WidgetName name="date"/>
<LabelName name="date:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<fontSize>
<![CDATA[18]]></fontSize>
<DateAttr/>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=TODAY()]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="456" y="4" width="129" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labeldate"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[日期:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="1" size="104"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="391" y="3" width="65" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<Listener event="afteredit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[_g().parameterCommit();]]></Content>
</JavaScript>
</Listener>
<WidgetName name="company_num"/>
<LabelName name="company_num:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<fontSize>
<![CDATA[18]]></fontSize>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[city_company]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[10]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="244" y="3" width="134" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<Listener event="afteredit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var company_num = this.options.form.getWidgetByName("company_num");
var city = this.options.form.getWidgetByName("city").getValue();
if(city=='geographic/world/中国/山西省') {
    company_num.setValue(10);
} else {
    if(city=='geographic/world/中国/山西省/太原市') {
    company_num.setValue(1010);
} else {
    if(city=='geographic/world/中国/山西省/朔州市') {
    company_num.setValue(1011);
} else {
    if(city=='geographic/world/中国/山西省/大同市') {
    company_num.setValue(1012);
} else {
    if(city=='geographic/world/中国/山西省/忻州市') {
    company_num.setValue(1013);
} else {
    if(city=='geographic/world/中国/山西省/晋中市') {
    company_num.setValue(1015);
} else {
    if(city=='geographic/world/中国/山西省/吕梁市') {
    company_num.setValue(1016);
} else {
   if(city=='geographic/world/中国/山西省/阳泉市') {
    company_num.setValue(1017);
} else {
   if(city=='geographic/world/中国/山西省/长治市') {
    company_num.setValue(1018);
} else {
    if(city=='geographic/world/中国/山西省/晋城市') {
    company_num.setValue(1019);
} else {
    if(city=='geographic/world/中国/山西省/临汾市') {
    company_num.setValue(1020);
} else {
   if(city=='geographic/world/中国/山西省/忻州市/保德县') {
    company_num.setValue(1014);
} else {
    if(city=='geographic/world/中国/山西省/忻州市/河曲县') {
    company_num.setValue(1021);
} else {
    if(city=='geographic/world/中国/山西省/太原市/古交市') {
    company_num.setValue(1022);
} else {
    company_num.setValue(10);
};
};
};
};;
};;
};;
};;
};;
};;
};;
};
};
};
}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="city"/>
<LabelName name="城市:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<fontSize>
<![CDATA[18]]></fontSize>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="newpid" viName="pid"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[city]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="110" y="3" width="134" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelcity"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[区域公司:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="1" size="104"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="5" y="3" width="105" height="25"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="city"/>
<Widget widgetName="company_num"/>
<Widget widgetName="date"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="false"/>
<UseParamsTemplate use="false"/>
<Position position="0"/>
<Design_Width design_width="1366"/>
<NameTagModified>
<TagModified tag="date" modified="true"/>
<TagModified tag="company_num" modified="true"/>
<TagModified tag="city" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="date" tag="date:"/>
<NameTag name="company_num" tag="company_num:"/>
<NameTag name="city" tag="城市:"/>
</WidgetNameTagMap>
<ParamAttr class="com.fr.report.mobile.DefaultMobileParamStyle"/>
</North>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteBodyLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="5" color="-1446671" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=VALUE(\'base_info\', 2)+\"安全管理情况\"]]></O>
<FRFont name="微软雅黑" style="1" size="96"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-2953990"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.map.VanChartMapPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrMarkerAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapLabel">
<AttrMapLabel>
<areaLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</areaLabel>
<pointLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</pointLabel>
</AttrMapLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrBorderWithAlpha">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
<AlphaAttr alpha="1.0"/>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="false" period="3.2"/>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="7.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrCurve">
<AttrCurve>
<attr lineWidth="0.5" bending="30.0" alpha="100.0"/>
</AttrCurve>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrLineEffect">
<AttrEffect>
<attr enabled="true" period="30.0"/>
<lineEffectAttr animationType="default"/>
<marker>
<VanAttrMarker>
<Attr isCommon="false" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="ImageBackground" layout="2"/>
</VanAttrMarker>
</marker>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapTooltip">
<AttrMapTooltip>
<areaTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="true" showMutiSeries="true" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="104" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="6"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</areaTooltip>
<pointTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="96" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</pointTooltip>
<lineTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipStartAndEndNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</lineTooltip>
</AttrMapTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="6"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
<Attr4VanChartScatter>
<Type rangeLegendType="2"/>
<SectionLegend>
<MapHotAreaColor>
<MC_Attr minValue="100.0" maxValue="200.0" useType="0" areaNumber="1" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=100" maxValue="=200" color="-14374913"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
<LegendLabelFormat>
<IsCommon commonValueFormat="true"/>
</LegendLabelFormat>
</SectionLegend>
</Attr4VanChartScatter>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartMapPlotAttr mapType="custom" geourl="assets/map/param/city" zoomlevel="7" mapmarkertype="1" nullvaluecolor="-14374913"/>
<pointHotHyperLink/>
<areaHotHyperLink>
<NameJavaScriptGroup>
<NameJavaScript name="chart2">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="rep0">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report0" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart2_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart2_c_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart2_c_c_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2_c_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart0">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart0_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report0_c" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart0_c_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart0_c_c_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="chart1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart1" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
</areaHotHyperLink>
<lineHotHyperLink/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="predefined_layer" layerName="高德地图"/>
</GisLayer>
<ViewCenter auto="true" longitude="0.0" latitude="0.0"/>
<pointConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="生产矿井绿色">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-16744448"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("open", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="1">
<ConditionAttr name="基建矿井深兰">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-16777088"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("Infrastructure_mine", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="2">
<ConditionAttr name="联合试运转矿井黄色">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-256"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("joint_commissioning", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="3">
<ConditionAttr name="重点关注矿井">
<AttrList>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="20.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="false" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="1" size="104" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return &quot;重点关注矿井：&quot;+this.points[1].value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="4">
<ConditionAttr name="关闭退出黑色">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("close_mine", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="5">
<ConditionAttr name="停缓建红色">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-65536"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[VALUE]]></CNAME>
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("suspension_of_construction", 1)]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</pointConditionCollection>
<lineConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</lineConditionCollection>
</Plot>
<ChartDefinition>
<VanMapDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<areaDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
<CategoryName value="a_r_of_company"/>
<ChartSummaryColumn name="company_num" function="com.fr.data.util.function.NoneFunction" customName="company_num"/>
<ChartSummaryColumn name="company_abbreviation" function="com.fr.data.util.function.NoneFunction" customName="company_abbreviation"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</areaDefinition>
<pointDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[city_map]]></Name>
</TableData>
<CategoryName value="a_r_of_company"/>
<ChartSummaryColumn name="company_num" function="com.fr.data.util.function.NoneFunction" customName="company_num"/>
<ChartSummaryColumn name="company_abbreviation" function="com.fr.data.util.function.NoneFunction" customName="company_abbreviation"/>
</MoreNameCDDefinition>
<attr longitude="longitude" latitude="latitude" endLongitude="" endLatitude="" useAreaName="false" endAreaName=""/>
</pointDefinition>
<lineDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</lineDefinition>
</VanMapDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="1364" height="730"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE('base_info', 2)+"安全管理情况"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="5" color="-1446671"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1364" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[地区数据]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-6697729"/>
<border style="1" color="-723724"/>
</title>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[地区数据]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="88"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Plot class="com.fr.chart.chartattr.MapPlot">
<MapPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="-1" seriesDragEnable="true" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${SERIES}${BR}${CATEGORY}${BR}${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-6697984"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[区域名]]></CNAME>
<Compare op="0">
<O>
<![CDATA[广东省]]></O>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[区域名]]></CNAME>
<Compare op="0">
<O>
<![CDATA[广州市]]></O>
</Compare>
</Condition>
</JoinCondition>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<NameJavaScriptGroup>
<NameJavaScript name="当前">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="province"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=AREA_NAME]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report0" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<newattr201212 mapName="中国" isSvgMap="true" mapType="Map_Normal" isHeatMap="true" heatIndex="0"/>
<MapHotAreaColor>
<MC_Attr minValue="100.0" maxValue="600.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=500.0" maxValue="=600.0" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=400.0" maxValue="=500.0" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=300.0" maxValue="=400.0" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=200.0" maxValue="=300.0" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=100.0" maxValue="=200.0" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
<BubblePlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="true" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="SimSun" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<BubblePlotAttr bubbleSize="50.0" bubbleType="1" isNegative="true"/>
</BubblePlot>
<Plot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="true" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="SimSun" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<PieAttr subType="1" smallPercent="0.05"/>
</Plot>
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="true" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="SimSun" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="false"/>
<BarAttr isHorizontal="false" overlap="-0.25" interval="1.0"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</MapPlot>
</Plot>
<ChartDefinition>
<MapMoreLayerTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<MoreMapSingle>
<MapSingleLayerTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<AreaName areaName="省份"/>
<DefinitionList>
<SeriesDefinition>
<SeriesName>
<O>
<![CDATA[销售额]]></O>
</SeriesName>
<SeriesValue>
<O>
<![CDATA[销售额]]></O>
</SeriesValue>
</SeriesDefinition>
</DefinitionList>
</MapSingleLayerTableDefinition>
</MoreMapSingle>
</MapMoreLayerTableDefinition>
</ChartDefinition>
</Chart>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="550" height="575"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.cardlayout.WCardMainBorderLayout">
<WidgetName name="tablayout0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-1970182"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<NorthAttr size="40"/>
<North class="com.fr.form.ui.container.cardlayout.WCardTitleLayout">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<EastAttr size="25"/>
<East class="com.fr.form.ui.CardAddButton">
<WidgetName name="Add"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<AddTagAttr layoutName="cardlayout0"/>
</East>
<Center class="com.fr.form.ui.container.cardlayout.WCardTagLayout">
<WidgetName name="tabpane0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="1" compInterval="0"/>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="d1d449e6-4e97-4638-9819-b76297916217"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[隐患统计（个）]]></Text>
<initial>
<Background name="ImageBackground" layout="1"/>
</initial>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="5bf442d4-a90a-4afa-8883-ac2235e3d92b"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[违章统计（次）]]></Text>
<initial>
<Background name="ColorBackground" color="-1970182"/>
</initial>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="1"/>
</Widget>
<DisplayPosition type="0"/>
<FLAttr alignment="0"/>
<ColumnWidth defaultValue="80">
<![CDATA[80,80,80,80,80,80,80,80,80,80,80]]></ColumnWidth>
<FRFont name="微软雅黑" style="0" size="96"/>
<TextDirection type="0"/>
<TemplateStyle class="com.fr.general.cardtag.TrapezoidTemplateStyle"/>
<MobileTemplateStyle class="com.fr.general.cardtag.mobile.DefaultMobileTemplateStyle">
<initialColor color="-13072146"/>
<tabFontConfig selectFontColor="-16777216">
<FRFont name="宋体" style="0" size="72"/>
</tabFontConfig>
<custom custom="false"/>
</MobileTemplateStyle>
</Center>
<CardTitleLayout layoutName="cardlayout0"/>
</North>
<Center class="com.fr.form.ui.container.WCardLayout">
<WidgetName name="cardlayout0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-1970182"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.cardlayout.WTabFitLayout">
<WidgetName name="Tab0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[用公司分类]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="96" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="true" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="2" visible="false"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="company_name" valueName="result" function="com.fr.data.util.function.SumFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[paiming]]></Name>
</TableData>
<CategoryName value="无"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="375" height="225"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="3" visible="true"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[security]]></Name>
</TableData>
<CategoryName value="无"/>
<ChartSummaryColumn name="hidden_danger_A" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_A"/>
<ChartSummaryColumn name="hidden_danger_B" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_B"/>
<ChartSummaryColumn name="hidden_danger_C" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_C"/>
<ChartSummaryColumn name="hidden_danger_D" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_D"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="360" width="375" height="225"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[以专业分类]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="true" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="2" visible="false"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[demo_major]]></Name>
</TableData>
<CategoryName value="无"/>
<ChartSummaryColumn name="1" function="com.fr.data.util.function.SumFunction" customName="采掘专业"/>
<ChartSummaryColumn name="2" function="com.fr.data.util.function.SumFunction" customName="一通三防专业"/>
<ChartSummaryColumn name="3" function="com.fr.data.util.function.SumFunction" customName="机电运输专业"/>
<ChartSummaryColumn name="4" function="com.fr.data.util.function.SumFunction" customName="地测防治水类"/>
<ChartSummaryColumn name="5" function="com.fr.data.util.function.SumFunction" customName="安全管理类"/>
<ChartSummaryColumn name="6" function="com.fr.data.util.function.SumFunction" customName="其他专业"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="375" y="0" width="377" height="225"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="3" visible="true"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[security]]></Name>
</TableData>
<CategoryName value="无"/>
<ChartSummaryColumn name="hidden_danger_A" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_A"/>
<ChartSummaryColumn name="hidden_danger_B" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_B"/>
<ChartSummaryColumn name="hidden_danger_C" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_C"/>
<ChartSummaryColumn name="hidden_danger_D" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_D"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="375" y="360" width="377" height="225"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="A级隐患">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-65536"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[hidden_danger_A]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="1">
<ConditionAttr name="B级隐患">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-236032"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[hidden_danger_B]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="2">
<ConditionAttr name="C级隐患">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-256"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[hidden_danger_C]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<FRFont name="宋体" style="0" size="72"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="series_num" valueName="result" function="com.fr.data.util.function.SumFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[paiming]]></Name>
</TableData>
<CategoryName value="company_name"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="752" height="170"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<FRFont name="宋体" style="0" size="72"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="true" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[paiming]]></Name>
</TableData>
<CategoryName value="company_name"/>
<ChartSummaryColumn name="reslut" function="com.fr.data.util.function.NoneFunction" customName="reslut"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="190" width="752" height="170"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[隐患分析：]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-2953990"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[952500,990600,609600,990600,723900,1104900,1143000,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[5334000,647700,4610100,1828800,4953000,1828800,5257800,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O>
<![CDATA[遗留隐患数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="2"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="3"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart1" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="0" r="2" s="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="1">
<O>
<![CDATA[当月新增隐患数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="3" r="3" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="4">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="2"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="5" r="3" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="5">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="3"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart1" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" s="1">
<O>
<![CDATA[当月处理隐患数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[3]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_A]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="3" r="5" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="5" s="4">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="2"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[3]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_B]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="5" r="5" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="5" s="5">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="3"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNAME>
<![CDATA[4]]></CNAME>
<Compare op="0">
<O>
<![CDATA[3]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart1" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="CopyOfCopyOf当前决策报表对象1">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_hidden_danger"/>
<O>
<![CDATA[hidden_danger_C]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart0_c_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="0" r="6" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="6" s="7">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="6" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="6" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96" foreground="-13421773"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
<Background name="ColorBackground" color="-65536"/>
<Border>
<Top color="-16777216"/>
<Bottom color="-16777216"/>
<Left color="-16777216"/>
<Right color="-16777216"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
<Background name="ColorBackground" color="-236032"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="80"/>
<Background name="ColorBackground" color="-256"/>
<Border/>
</Style>
<Style horizontal_alignment="6" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Bottom style="17" color="-8355712"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Bottom style="17" color="-8355712"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m@8B*;q]Amnm9NR,$d'#"U7t+g/;OiP.u_D9;+bq,;%X?N&43[&FKhF3)Q?S2&.kQi(g;`,Ug
lk*,>t6_+jpuo+XGaolgCE%kM2JEm[<sD3VU4Zp\;RSZM)FEHTg\?T&4`THfrOh]ABp9Pbo/N
OaH26?GAPqoAB6HTr\klS$N4MA)qB#N&-pn6/XuI+:$Q>no]A&s5HIjVs\fRIb(Gp"E,6F=&1
p"[pM1;Y*+j[s-B`8UkAOT1'ak9`I[=m:EEef#uFmR76%k7;a>IH7%9`9DMb5qLb-9jqsUAR
EWM@7pAGAPhmal^#Gef0Z^3FF"FkWr@LJKOgCk^b4aH>JT51,#i[8-TVX?l\C45(@NY"g6g0
6kklRj\aEp9"`u2j`<p@dhAs5g<%6DBOcZ4^]A1_'DYX]At:DgaJG(p-l^VZO;lfe-?XlG\*9h
7b.G\-`f>:V#p!;Qb=neo.>RS.VK*3`dr$/W.mAu7>s.-*lc>g_b/A2E3[$"YSF,8nsk7DSe
*/Zir!>)(d!F2=<"$LmTX3i^&\&%Qig(5FD`HO;$@hpR!(c+EE60Y^j(J+B$/F[JcE($M8-,
laBtZ4$1UGA?<tn]AP"5cXr]A+"Q\\D"Pcs?/*bTB(SS5<A'8Ajjn)2'f.!1Oj56I[oCNF_!L2
j8m3tEt8F$f?Yr0M0D_;?pR?f^&.@sZO/_`K3\Fem.4^POJ:r/kJA@'O(e>L$F^6W_rqPfTb
.f5=(.VR;L#*kR"+2+#b.*)EtAF3sIg/gd3bLHedPjO@"MTn]A-2-Y*$"dDm/0g^ZjnYAY%]A=
22L370ER_VI0f"?r--Zee<li6LSai$]A]A4SD^.Vn'3OqXZ[U/3N]AH;6t/dB/>Y%eet"7WE?\q
`;ISJ9\-WHYhi9PpR:&o[VOV^@feeQ3^?]Aa0K]AUp7G><-'7*%l3'.%b`Oq0@5:t[5CVpqk.0
VS64`+=Mr:YAd;#)V#nP(rU=]AahEHC8d:W4r_de-$E^#[X6\__,:N,F[9)RAnHN<2Y3(4@gR
D/-Xj?_1S82q69P9J4(H2&#id(Yg#1_]AX*:t$R2=_,OifYLA'Rq)QUDSr\!+rq1tE=$b]Aet"
<?(=#)>T"V64_*+0cM1<SX@dc9pVR%G(YZ&'.%t4@;sk4\NuNJDrh)[7OGKU\G>/ZaIV6[W9
:US]A,[5#8oFDhTm(U=adNRlGBslbUGj5)>B)mb:)PZSmS)R=4A$LJ[L%3pVM]A%`LX1A.J%HF
3HTp]AM*:V.+$Ja=j[)X=tE`gDY2sTm4OnuE[R"Wl0d<ZgF%V!Wm]A@l@7_!Y'K5O;msi]Aml8B
$EjeD>A.t-OTe2m2YV(e*h0*o-V%umYpq=`sIC#V)l=;&isq&:G5J_5su`h5!U+]AoU!H/s#>
%.V>q=FeCjI1:?l1pYmjnK8;"#83m_?FkF8RUJ+ER\"IRDYo<:QbY!?D$O]A[PfLSX8?bW7c"
J]AAOdeCTM$^GEG[&U8D:N`>qjR_*gd13o$YmJIpeaS+e*D2>Pb6O!"J23LhHQ`YY9h&1Pb>[
,R9mkD5u-u<S#pESg1O4.$dbEG.q#PT:(^@<j^NQrQjYC[Iqh$!0<=t6<$J\pN7V<*>n@ZiZ
>;6;#84jN0F7YpdF9"`iYKlOIHPs79pf1m8D,3Y\gNZdE$Frsa@b6*r^S&C?Hfni2'4;lN]AM
O&F:P`(@gDG2#0Q.+n'@>jH0jo/BogM36e\8R*Ue2&6\:gP8"GA&#]A8<Yeg7+9>Cn]AEqIgsT
is++M.I+_X"\o0IfP>Q%0(W;+Y#"dAq[ZjEGU>JV7SNL-l@6pb*&J\Hd=dnPV+DagJr;l&*_
A0l$H)=7=04'-e&*Vm2uPn;7)AuL'QI89GA0d=*,F:*k8QqE>[790-LViUQhiJJ@b$nJ!DV/
#rG1+p[Z$0LX8WeO@tN\`GKgK:N1?*Re$g8WJD2dd`,pI)<cXi<uHpZ3E[(]AO>a)'u[m`KWp
\7uc9Lo2[Eo>")U(D4d.[`t=RRgWlq)4<1!gaS*'&QeFsfj1FCUXJPPGU(iDfIb]A(;i5?=f/
^Dp(=+Tck'sU#9E1+`(8b7bmNn2USnWu;g:q^"pH_4ngW<S<VWZ$$W:J`c>>/2\mmg6r'e<o
a&oqHOsP;pE0-##0;!a%<DD6cm2X]AD&/qL6F[0.P4$R8iF_&`F1@B$\FO!Gp0^5oSt);[5&H
:ZPsoT+"G?;/YGHjaX&ZK'4qDBU#%EIg(IK%`[rO5hA%:X,9oJ\#?Dk,VW*Lh3tL^V)>s,M]A
'#rR%TUJoNqk*E4/kR9i.#1G4Ah\n)+\'<nZ+CWd)/EC,_Ya"j$2:j]ApP:Q4;:q"c)5(P0)$
pY#Vcr"+_pFl/=eu,DDunjCLT_7R9ru<rc!&%eI90pBuA*"H[paosWlF7c/=@Vd^F`ZF!'V5
MNX2H_7rXUg6d=-/ur8F1ftATQ8Kk]A@]A[4o]A>Xe2RedFpseBB,P`)7+M@_O+#@MG1sD\ILrF
.JU-!C[@<`P]A;;:$V:9htF\7r(ZniAYK((i>!qjPeK[!9La*f2=cI;T>LQtW-c/'2b1&u17U
=Yppk;@SjI%o%N!!Mrm@S(GgQ)"tB>#YO@?c'eMgHRL1G*f#U;(Mm:t&dsmq2gZeNp7+)k%p
&H[Jr@\!"m9)b&X&3\=LP;EaE9'"E_er0TuU]AUHB0ek-;3B/.*jm-5RPVeBNV/2gkm7c!0=)
e6$SS:'!HIo>6EeY:Bs3epKCpd@imjlVm/MhN8]A'._jujbZfc^3Rp/1*FMuI>'S3AO(T=&*E
!\t/fn@$%]AJW.-X'!=H#+c"e>Hdk/EZs%Q`K$+K\=U>f)!MPM>&Pqrkif]A"Il%T/b'do[Gur
CRe[tG3FH:3a,e-`2m_afYB!Vq>N7.![Y"9_HEr!N"Qs'>cgV,LrLI3)GMUYbBZGcJ*_@N]A*
M6@m@o.;9'Z3i#VHLFD7eXdp3Wqm5UA9A2/LF['Sju^$FcRULshh@\fUStV>9*"Cjh7gB5;T
-.<m72.YmA0P/.d,L``B;H^4_`cS.aVGrD#Z/6Pf0BdRRJ:N0R*=,<>!%VYuK'A1T[W(Q`7l
1O%((A)#UL/_Q)%nQ;Ocuf*.7lIq\*0`q!DYZg-&J<KQ+'h%2(C-MFS&YId<T7&W!gS[T+Z1
#kQOrjaiLUN0K@7mr,m)2#YG1Nn4OO_pW"<f&?K3A?c=C<=sa'L.V=P1-HhjVLO#lbgDZ?nD
m]ADckaq5^(E6FiA2L!B9g6`mrL&!L+$TX(V8I7RAi-Q0c]AZ/Kp-#`NQ"E&'+F7*1.cP\RV^Z
%%"12C'D-C,5l]A:?I=('$-i,G0&&fd0El#g58oREZU.RF&G?53Y*dao]AD3:uY&nihQJKp&g,
hKE1rZP\qoMMrrM/oZnYU_C5pI!\gDG*W/gcK0R"G&%qb3<ekWs454r(/Ll^CW$aGs86kamh
Fl8(<%&[-N[B'acf$\GWm[`$5:S^i4V)^#a-0>EIW5Q+\j27YT8P?pona"I_@LY6#5*uFDtI
Vj;Ik=^>@YG)p`\D8K[d;eQSJRY/D:G@dE!?4k_7]A3;VY/TCJ34+9hekHmJ]A6k9()`4b*4J#
DH;t<\t>Y/^)lV."pW+#p=`0QT:=?A_`CF8t\\5fhQ=4%XanDd8F#qg-4a+F%>((siZ&e-'O
_^Uj0DLSeNX-/eNrl^h).O["@<D_?LA'dgt;665h)Go*ST*?2Z/6,?ISJg"PQFW_uISN!m-$
*5!?^49Z:LnAtPt5Iu_;cK%gYW2k0K'I!!4+2O/A+]A+b1uQWZ9A(*43Y5AW91>Z`,\,[n!<S
Tcb(b.IETn"f7jl*,?]AH73uB5U\S@W:ZM<rr^`N$"-CjD1mr?mT]A$*,V^'\mh_@FVNR*KSNP
G-:)IJ)4)gCAo"3EZp1H[JCM_nX9"+gnYP2P%8P(t>nfI8Yoneb<C2.jslo4UL&BB7%FmP5t
Z/!'DO2KI'he4TG@7#b>@&oRku.FL0e+;q7j\#"5:dq6YF_h3So=\8Mho8Vu-YX^I$@kEhSf
UGZ0oBsg$DN(D!+[nKhh2Ue/lKRl<iEeGSa@FDu0a_4U,hIHr%kdqL`';NNpes3KiBH\<&@a
k@+.8C48at1r0cRkrl+)C+a"E-"dOk@3frc3-iW5m=ANa&K,0j!]Ar18o]Am;^j%K^q#VN"hqU
#K'P0Lho87@/jB'Z%3k5o\N&e`Z&[p4pNO,lK:1Ik_Lk2RF1!F%O=]A4PN0O7dcK^Qu+U40=-
5ck/h]Ab2coe!2V>n.[^2qg#D)'qSm#2pu&B30R]A7*F:_+67)Kc`RVJReD#;Xsn%S:%f8d+lM
k@:l!%n3Or2=VaC=f?SGe;-g2Y<!!8.&AkD(_PDSMIm]Af!S$=Yn<ifC,!-c;P3lPP^hp!pRM
;t!90A"V?0</KYL9;P>>4\c<LLN2p`m9"&jTtL\1=f.]AiE`F@HW'<=L#cKJZkR<N<2a@ln<?
I9$P132mWt46UQkcfbqtAU&LYR!8A"La:W=S*VWq?-#e7Uu8]A#$g3if)jY;l80dlTO'nKif/
@g#-a2Ua'<l=."8KORE\LX@mE/+g2_d[Fr%n@;HdlRgPaT-u[=_T(aXCXqH*7Tg_-g\W:]AQX
DjP'H1W%%YQG*aBWGP:M3lG8&$(b,/LQ8$S*f]Ad,(X/I2noFJ!FfZ'W_S0[0/`!h'a,%bY&k
[@CsUq@HBEVL_J0p7mO'uB(et4m@K@?:k8$!4S6MZG;b*.Rb.DRs6PlRQ@NJ(F)+e]AMLs.,^
i$*<#Qk^:4ksSOj,aF.6Pp+\Q[Wh]AVWGI6@9BQ[_giNk6Bd?A6KYjLP1pteUSc.5ccW;ij=9
V]A`h5D6,:TH!8-'2\;F/ADNQ0^Qd+6r2-c^(LoYB9*2n,D1bK_^U!iJ)HZ:WZV>4_q`UMTi1
m;8t5PYWd67<8qVhWD/_?Kk+/\Il9o_i0Y>8f#@/JdC7CXO<.D)Kg[UcI3[PEf<&mKE_5enB
hR5#md*XgU%)q!Z9m]A%?F4OpBfV"DGHk:SYEtsJ>_cm^fX7C!GqRsY78`2R_C`1M)?R+k>_N
taWB;>H9rXiU-01e'!g%R(M=/E'7Kk9Q<i02XJP+u"5.;s9mT7-hk^?TfgV7lh>=GkToll3X
=_C`cgHY8DaFu$"iCMEK,^Rc!FV'lA;Z<3:2WEM_(UJ3K:.#bpWuN>2gS5,fWR,\Yq.q)CfT
-1HF[N!CnCj-\@?2enq*rE[:C;'b<gkCVfN-&Zm&NG!2;JrGDb4S+R0$',4]A5%SVdS$I+5PJ
hV7fc0#e:h:cCpNRk%Kd$/#72fK*fH*4@pfVrJEH=hbGk4Y-BHNH0C\blI((X0(^rrr\/<CP
chV2%GXqEcsHF;%M19LfHm30SEoK#i7C*"[3'n+_q%`L>TWu6L4.Xe8Q!a,5[<']A&urEND7,
VQ8ZHI3)s8e3B&b#Pd-&ag^hHf6n%,H^#/5%Y71#>*.V3.\@mB7g`Q'&N.c5ceFrh.A.+EAH
c_SVc-FTL4rB^flA+GAlfI@VXk;MfDN5m<W=mq3SVK.Y<W`gKfX[=mF*?@m6Ql&c@p<o>gWd
87OOV]ARS23&6dWg,:E,&SHu!>@)en21M=A#Suo^02f*<N@1tE?D_O0oO!/<f:MFRcY+P\ma]A
U?*l%o+Wi8#c*+4N"SSN9=WQbJW8WZfWu-;^F"6FaD_G5"^+Cm3jK%h*Q;[jdVH94G3^ti&2
fh,Wk=.K_=`X+V5IL6cJn"dT;_s:FHp_2+2mJqj!RmD*#ugWW,!6rhg2%1S!hisueSP"jbr7
kZ^Sg8ig]AP0iE'$D,fp6Zl`(OiBbqY8P0NlLO@bHm)nNi]A_Ofp+O^R"nI654p0-ibEF<^%9r
J?IJ0CTX)6k2=E4#T@lTHJDpPZVuB9N\Rr/KGs8X81c*j.pemF9o\Vp)hs4X%&LaSR.d;cl:
%T[bHuYD@QS&(IT)E1;LC3,;i*IL:sQ.Ca)7h?NP%1NqGYJ$/pne.'nQ%lKiLBWKI:\o"P$O
H,<o,cO,rch.bA.[#7:IZ,H\<7ElpUjpA.*]A<PW_lWD.Hr4j+SFMJhOH3*T)DePKRsIB0;JG
6aD8_;!e^o-)he&)G7uli^4CFIgWd]AISQ.+3m@k<j/s<9Gg?<KokB2T&='IYGShOUe.C*qlt
,!+5QT,_1(E8o0BhW3<\dJrDthLFIIYS_V-Iu't@u[C2Cl':iWTm:gC3De9c>5E/P%#=L=qc
I\oc2Oqrb%*fBRUlcnDe6<ebjA8F"mj1AucG"4[Rirg.M;bTU]A3.Lg[nTT`k!7nAac<Z':TI
WO;ecC?uE,+Lo7_5"%QRrsJI^TWo^m2T+A'[5gY?S#[?kc:@6Jl:@=HE%6\nbcN:Ym0Ak4pS
$6@!Q,40Qc))AUH5DnN;E9Ld>chm42?s)NBG%MFq/YPGE*.k8.CfWmDq=Y!]Ad.fiZk9GZ5O9
-^>DF!N`-W?p84hih0Hs(lt5XdFW=IK@omB8V$r.:+/-mtjXb^2Tag=bZ;S51Jp9Eq^c:]A.o
2(;f"Y-?*N,!cs6YEKO!^r?:pQID@jjSF:!;O*oXukf.gJnOdEW@R&rH)P,!47VNRbm=ZOS0
p$)L;@<9_!i-OUt,N>t[m`Rpkqq@Uem1sl.Pt_jj0k[,8k6;=_1jX=ONrs:'_Q@eV\WK;F?!
1[uV$?TKMdaV"rGTaEn=(fYNM?5`k''<_Z\]AhQC2]AYufu]A!Ck(QRh2=o6i-?@Uf-2t;[ARf'
JL2F?C0O0o:lUBrd_^M=(I]A/1lbnl'a%nmrCa!G*.d9DarJG;s]AOBSkjFM0#gs,*b#Vi1Y_A
CC$S#)(9d*TDZ+#qj;;`H56!DkY:kG0M`BY&MPd(;]ADt7bpP&$NbK-@E&%U.Ync4nYe^cK%\
.\I4M8u5lr2$PQ\@)>8;3Q>mM%9b_qCUZS$EHN,ZXOaPl=1gd:p'=l!n"/^DIB!"/+)q51r+
_#8jqM&34dD9XDM`Ld>O[(,N3K?i$XX@9&K^qc;F6[UbIF!)BCfr.[PWk^p^=tKrRi"QAoH7
Hc.\3AQ9mt_>Ae%B@m>V9bB\)DM[QcM:6e`8bhJt[d^:;cli0BKJKSJs\RqAF!j:'F,.P!X%
3e2^2#EeYng(=Fi#BKgW+="[3j.78T2:,pEd[$K#i.O4\*ATdQ@OZTCeW00u(N2e>Ce+#^,4
k^Cn8L:L<mJ5&5TO6I<.@C5Q'd3o,V;KPdO7JuN0.b<D49%cn\*M.-b]Ai&pch&ET<+.I!iT3
Ld,e_k0I#kp9Ai'0C+srq<8\s#YCTb4*UHuOo;6,8gI@-tsD&l`WdO+\-:eIQQ_n@Tmr/BW9
@pml0L2$A(7]A?shQig8['DInhjmm/V?0p@X6IK9Q7XM((P.a9=;GO"rQOk\eWh:YWr^0eKS)
>AJ4BRHdnR>KaW\l`u#7"30b%hV??\0LclT#*mE-"qSP&L[kp\p'h$\aL_N;=`B'?*'@hm\d
$+"*^M09UtVJ)GLgm*57&G\g(MVBHFLq.V4A(ll!((WC:A)`kUa]A<-c,NMg"W#j4c9GsaDi/
fB<8P=gi_R8kZO3?8m%E_*sXm4X(]A#HS=[ib[<t&'<Ij_Na-jnIoIWZ`/SAS,E+TFn`l8Mj.
Xi;!6/1Ze;'5i#;tdIkNn3h,^p3dhL=eW$oP4Q9J%)6`QV1H*]A"N+GJWt\kpU=i/08*94#B;
.[/4aYHp9t5'*:GdU1M[1\H4girkHcTrACPeR`3qR`F+%Dlr\oM7-CX0?7p!r:@>o=p.,>Ba
9ieKTP9d#JK\Ilq#unSbjMak86=c^S9+JIoJ]A<d:#(]AmdXcfk0rTK"hcG1XqG'*mXn6Pr0UB
/@6[\Y*)5K6`MM"^DVlfZ;CQG9I;84&N``"=I)<9jpI;\=R2)UW'TEb_O5j0!1s6nQ2!,dBB
YTLs^&cc%:[V*J(@D&U*]ALte8',e>DT:Jg8*Uc%RZ^;qFa4V]ACel_h5n@BP#SJ.p&,8VM#ZK
HtS/eG#O+]A:KrZ5DOZn6,NP2Xbri-/o`AnuoTF).f]AchW*&"h!fkPOW80I=uiP(L:d6&,Jpa
dZ=oE)8L*eRHjRoqiO.VWo)A&r/nYn2o!et==VD3&';ePNLe4-cBjV/*?]A%46geINDDj:Q,g
l,082-8E0ms8<C\4<DHSF&_0gfkfB,3Hp0>s>^]AcpP%OSG1l?.Hu&-Rjg%c0rGR1sM>?<N8*
!mlKF<5Oe0[f3%RLcMWR*]AD,41rf@++-8\nR\^t?n%@9pG"4X-IdnIc^Gqrh4Li_5b"iN1M@
G0WV"I_^L25j6A>gGLf?e$_I0hf]ALd^WV9_e$?:fBEq_BKHoK)?f[aZ_0i`-6(^4)HC"93OK
DX-P+m-%5$i'+UW"]A=<U[!X%C8>)FjD.ZF`r>W8I\qMm$G4&SLJ1:p(DjTtOec@]AL*!"-"k,
E.i]A[>'$U]A2u'KuDY"2tILa`WOE1D9$.+bME]Aa))*>4m3N&4krDE-\BEp%#LiCQE)@<Tg11Y
%G!Y'srfbN9Xd.<E<lf)X%4>`'-^.'DYHhm^n^2nI^MKp60A]A?7IU7[q=@+WpL/;D:0;aT?@
@<u#"*Sjk:=]Adc(U"Ou0I^Th^TB_dpaN\.$4\l-_t2L44^r(-@=&NpepLHkd[,bRC6\FUN&K
*G+eEaHM.-YB/!TUD/(s*9kV16ZiJ>*o#-96B\\#n!Ro)p6[dSbqlLa?Zr%:!I)=1"]Ad^^2@
n8"'m+JQncgGp$p=?!Ncn?Y5iYs-@K#te)IE8l-bCW&@T%)_S9&[M>LRi9R<+^Y.X^?<#e88
U1h&.,kPuA%bb]A[YcD`J6iQ=b?04j(G*.Ho0+JK/J@)S:5!Ks^P:IgMd>\gRI="^:q&W@en'
s:%*9[h3/lLN@Hk9^Hli+o=Y-a\n%r<aE\_\NNnaZ/.YkG?rFg)jD&0Smp$9M;%#K\@";Wa:
o^`7Lti_!0RCqW&0/GlsoSa)A/#Rt5J1H[.7Z"GS+Ws;Dp!X4*uqE=':<V<pjlU+IQl5e!CA
?.U3Y7r]ArHY.[BPQ\*cmb,/H7Q%fl1O(f@h7gB/f8#lfAL6Ykf<oe!6S,=;_]A^`X2[5;iNh[
2'`(uE[BV&L*)74TP5s#>Z9>!c^X1S^e+=$EVnrd4`CE->&mE;!Q)$:Eq/;1sCG[d:b)'lU6
o9sZPDuqp6,uFi:=<m4(=TJ\C:q=?iP,O;CODGYC$<j+I,a.bCK\#81Q=OZPi`d[dW@0#LA$
odQl:.-J>,\EP&mhc_J=GHEUoB)nY^]AD6rHh)<:c*S2W<K4KqZ:+jIV\gdMrV71MX@W)ckf(
XGe!:RJ%f#RCeS`kVE(CqFjGhc&Hcit&_=Qr8:;Q\'4.gn?3T"uiAeMWj7mBB1I@Z9kB6hm[
bUAR,5XBo1rsDmPng*=ng[mSV,/!S/`drI*s6XJ\TB"1WT,A+,_h3R*ja<hVH/6ARuqES&:=
XV_TEa9DhaFW4m#BVX2LE#DSg<Ign?cG*84I1>qEeQI3Q/-L4/#UH')Hk(%Nl#ZFFJ%oSL9p
,@\h).%=-%+2SAK+[K1i*N^i86c-R%G%m4U*7tkH[$>$JqF]A`!Z\\h4r&NJlEdn2Z5X$\us6
%B]A@-9?ka.MIL&7:?g'i*G*K)SNMe7>MmKI+a:M4@iIg?"IBk!;S$c,<*FF,_B67Q")/>&>K
\-u*rr6lb$#-;La7\g<4^R1]AEe'/Mr`)1$KBcrtj"Al$.6UADrM+)JTuKUD\6KNOJED?6cS-
rb%r>^2)6Oc"Vq@lH-GMn(E?NGhsW(q%A2!esfR)mf">^(T$[9I;%_r[XFU%%#n2j1qro_I@
Kih;'Z9U2KOJ`?<T4_(BS$*0Z;^$Z5<;_qY[>!FBt!()!PVjACNC%7cH6kqk9lrCjK112qbR
$l3o:%sK@A@"mi,7qH]ATj>i^@mC<>9Ed1Z%lYU47%QJWge6YXlM)Z>0aUVSBg6l=W-j1hEmA
I>K<sZAEp4`.IE(c2#+qf;%^/l65^usXk-?l;\bPeDY5o&>(=^Y]A;!Bp@$\P+DhAeTO')80(
)/MpLS@4ie=p"3#m]A:Gotbl3Spb=VH9SZ6R"B]AI#7+mk^n@j#n%<I:!!GcsQmkNua5&?u4Np
8*]A"C=8ASl^m4AcbW#)QY(6V21h>X:h0$=_X_r(S6RtYB2-b*)WZ#?',]AcLH$C"kZhA5+77J
/DIa)F]Al2h$iqSJBBH?#Ua9'M6F$_'an8$nVq:UuE>*g_5G:s$kj8D)?t<824I-GA5O7&0b+
R`b13SuF+PjB,1:Oj8b3FB"-WN<(]AF-@m'Jeisa5jK#WN%=O*!'W,V?6SI+0'MTlLq=nE%?G
4D?2"kHDhJ&5]A-B'QV/%TsG]AG7R''e$55%&b&=kU4A/Q%7C;?K.<*KLT"f%>Cded\d&[78!&
A,G4O/J<&LD=bqBMJSJJD_Y5A1n`]AM&#j8E2O%b,R0+ang'\V(((u&!:0fRjr8e.>BE)+m7b
-$,;=VZT)^6n=s2r2g#5J]Atjpe_=bm.T1(AolQ7h0GdM)MJibC]AG:+n#pmVV'WmtX$'Z3r$d
IOhmnQB=Z*6Gq2m!FH%WO6ppE:'?3t')@CH'U3(92mO4CM.0IA@2[KgEHq2'\=p-C"JFe1.7
<V!WiUgg]AoSJqea,jPgBJ9Dut2lg+d$$H)B$,*6-N!'!WG7_'jFuNFrm_Gh3jHj9"-Fndkg;
Xk9N<k'k'BkIDC3#e9-0iaGd8Wl&im`BjNTILc*/+BG!i30BR8d?>o"f328m;"4)83aMXIb%
-C2ujlm1m$-#\TfP.<Kh5V0(tt[>Oa+VL0Hjng-KR=_pJGo*SoeT1SXAVQI!B4-;YSme"!i>
^]AZp3D`"XOO.gN2:l^HG@,))@&qb^3pUFkCR'5+Pb_Mkj$Ro`#uotbBHpa.c_m_pok`@9_d'
HLH(SaGC:Y$R\@)>*a,p9O51pjrp?\56O;767K(_ISoaqP43p8C)iXF0_ZoZUB:MRkUC*?`7
c7@*O5i.@X9anO/?e\^,W#j%+dbKM\KNHP=&MUZ#>JRf+2.J,T=PhZG*F/u_>Q!;hCpcT!ZM
I<VKT6E*Vug0i.:tcXn[aUE:s:RYC4j^hQ,2\kBC)ar5B)MUd':NZTX"ZXIk>#>29K+DgV0=
r-&Sk1TPI9-3$QZQ@B.Y2d5B0@%oLd0F(ne?hIE,lpFkE/5N?a@G\3!OB_@b%8qLQW`a^**$
;*%7A9pReI#t;2H(e[u.kE#"WPZSa=!KA@.>ZfS4loO&csffMIEB^I)R?8U(.cYPGKE;A!bg
SY2h=]A0]Aj<B=\90;drrFa+EoCYjPcYEJe-PWc1La7B=JYM8M$.dQYNLFHlf\([-k?,a@8<lX
Yf"k1-d@f5:@,IdW/q68qI"%sCa$29e.IN\,umLJmE:2X,"92s,YE^U7@meb=8EH;FtYi9C3
-X8U,DbV!EZM=!m8(<k&K-A+f9Xd=Ul-7^&!BdIYNcaN#Nnb-'*'">UH7u#4.0"LWe.r.%8W
!FsW,U9KV@mId(Kt.A`<hX6c)TU3\3JH4VdGYkSBqTn]A?A7[0^#GME(D?h$LFAuk6"hh5C\V
eb$2i-d&QcJ^8W1s$[mrjujEWuYB@fp</G;is#Q[6Th#X5.e2Xi:E_<ASY@A'7l]AQZA4H!P(
AZY=^a\/UoZR(J8EWmr[mbeUOCc0/EG9X#Zh-nT2Nqe%_eaXdJaEcnmn_cdj2-`0X\D3U_s,
k&`5j<7C5ql+$r_SLo@TE'nI+._Um$KqoG3:6$[PP1KC(p0!_O6AZ_1W,;=)2jn&oc;/Ri8Q
$IUq)WEQ]ADb?Ih;8l`g@NLlZc5@V$*rCR.a2a]AIRGUr+s$<p,4YI-?'H-I9c<X#A,*QSH'$Y
!kFj&oPaM!7#?1-s,$]A9lOF9AT]A:8t_K_RPcZ+g?Z*11IrU^g+@Dun>P7b!k>ZIk6(*<<ZlU
E4p)0J&Nb)RqD/*q2"Wf'a!rosF[)/s;M%4,6!\WX?s7drm>6G=bqBIXb#H;I?9Q;<"bkmmD
r[9^--jb'Verh(n]A@%A*tKr)V7r_[YFQ]AA9_F7,^LER7(6n?<jEk&@1p)U(/]AOUDV1[C3!0l
-1;oJdfQOGVRc-I>MS0c[(OaH*bk"[F@+QiBH.%oeZ7#Ec]Ad-F,`@St1LN?=Nk(^#@I`5odu
.i6Co5a`>t(Nf6Gp+?PW'\&2ApE7#N[q.[nh@e!n'"[)X*#$ok%3!h1)72WAW@t..Be->Wb3
pZ@;_>2SWHT&="FIVYD-NZ/^rj.bD'(0WNM7e]Ajdn=88"6j's^1.qorm-Te'GlY!G<52mW(5
,HU[NJ4$402D1Dk%_puqmBc7KU":+oM`b7m(?64NV=:XB4=g@c?5!$O1k[Y5,;i!^QnQ_WkC
`Nfr\NDb]Ap=SOsB]Af(Wb=`Aa6\*Xo-31buQdmB*NZb%nnqe>h2-kCnppXTfh1^'YW[9$^fO>
'Y<nLbpN2Sq+hM*"B>PTg)p283<n8?cNQi+LA7/DY%7o<mF@JRQ"rTfd5-VKoDK=aX5Mnq9q
^C;llrh;ngQR8oWdgZ,MHXI*m<#Ua&2=&c&Y5nSFZ1[C>r_87!>n<CtR=IL0:4kl>fi*:GVR
N!a(j=igV>5*td3%[p&]AY6u4mU<eY'E<""PGrQEQ)l3jRK2=;(O3IQm^qgXt8;M,+c8Mq0?o
T\-NVQ$aPR)]AM<q[u0#L!WD=Z(>/<"1kj@:QcKB>6T^3Ng(SFeoQ#IK]A_tRG$6;dHVIW_k^K
G,1,g>F(t`4B[9KQn[SX93b5+VU]A#>uM+n`;,(EQ:#OAQi&^frXb1_!FRoqDG;KsPiD@-mbo
iS80NlD+j7]ANd0TSk/i$S@2-@+-!^Gr%C6[r86W#gHk/b&>Nt!3+_k?*B1QZ);s`ij^XnG32
`-.(O5q<;2496o+c/RK]AN2(5u-J?ZA6)doU5"e%fQFP#_-aT(sN.616hFl+bR&nlf7fE4%<%
&dfZ.TY,BH4HQEgtiKe5\*=rF#aH)NIs.\n>-L2H9T^:2Zc8Z:5j(bB<IA$(*9d&sOWl;*,X
3V=*q:l-ek#)FInR<TZmJc9U8'#X7fPC9hd%V[EVLDDLQN-VJ>q*H$+D*2h\N=jEYdiokLXW
Dd/>Hb_qapA)hs^N@_4_h,5_+9W]A#/4";qis$c"u<T^UDL\ODu'P:TiFDpTJ*Y@eUhsdhAEQ
nFkJBYM9%`dI>-CbKpeT%,EF6B&lhV@Hubm%=c'LP6,DHltJE>X'>S^JmW`T*ui3L$,h##!W
Db$;fEV$%d>g1*B@@)L$tUdqKb%n\W94PD!cD/7*mik5*/_*NiiGImMHEN9pgiA1__f7X9Uk
]ADR;_k_0e0S1e-urEM!/7g1lgk?`be3^kKn%Bf9'hM?VmT2BUR9+PB[,"nb[f@N)QnQtEcEJ
"r/g2`>Ip.WUl(h8t-`qH#cYj+]ARh"GT5BqgOCpLk)T@L'j7G@:`bN_)0fp*o/g;lb,q=.tL
sMqrqdEKf4XI)H$_n+fB(9IX#.CDc(-;HS8:TlbC-5'3n#;M=5]A%RQ>QVfDGI4iLI)5>&bUl
[f+h=Y?c,\<mr[n3YJ!$X?.'`988-FT_?ZrK,dG:Trtm;\MNF+qoXm=,&FB>@AkejlcOf+@#
FB^p@!h.hW\AhP.MVFqA;*EPc,J#'_(SOqsR5TY74D,(P?0uA>)4(o0W1%8KE2E5+KQ(PAm;
33pc=QFUX@,7$Z>WIqoZl>H\`^)a'Fdr420,K?YApm'"Ti\o4_%RL_Ae9)["hmU'Ph*X^I!\
[,i)j\X1iDY^b6`F#A>QD"(-Z1X^BNF4h=mU!)-O%&=nmXt?lc0$'_]Ah-9BVFndq"+%P&`'$
;.54YiD+:o7kdJJQ<:M8EoKQA"LI%)uTLSSpd,qUHr?8:U"/eS+FECXUlR]Ao.g6q#J/_-OpR
hj-MfXBSp58>+CD(RjN>a^]AHq`s+!Z)QaYhN'Su=m*A)I*>LPMs.s:rF9Z9*TCtlidW:3DR!
9/U,7ED76O%\d+@"AqDqTL;]AMG_oE$7AUpi2km:*X,$XhW=>Ifh!O3`<FW0&Ug$Gt,AT0P]Ag
\*EK&qdE)?@DV_"uBih:]A?n7-r6;fVJ&t(cDiX0>E!P9`ZnM[R@^dP90>rQ)`NR!/FL[,ab]A
#K+O6dt%fG>iX='O6_9NW[&kO#mm3cHDmuOkLmi4(q;Wh76g2o/FtCjj5NPM<pGQ\A?TJXdX
WN]AM=5P@J\A.SPIEX21"e*hF'lsTqM,2\>il:#*UG"e/FQms+5G4rm\7R%]A?[`Dg9mnTEeQu
rP*K:Au"F1VlaehV;<3AW?KD,aVS5G*;=0Cg:14cgN*Uf@8o'O),+rH\VSbOkD!*sFe9JE[b
q)Vhu0kbs%hK/)Jo$&LW+i;M.a>hSmr"baQCeSWfRPe!2:[27:UG>@^Xjt;=E"2SXM+!Q9M7
9f'9XTs*QMX!JR-1_R;,\4o[8,^X9uCLa<cRe;S.IS@]Af04&oq-VCMnra\ZXqHg78:0uDMQH
M&31[tA!@s%c(P^\V#"NeipHIM\0U)e/T0b[H"S\PZ1C9E'Z3Nu'QKQ@e!DKR[a%12N'"CMc
OKPi9f-+3)sq;IJeoK:lFU"n%VXjKM$DM[;[:o*Cn99/0H-%<c1s#B,+c5ME0%;6MVG'Th(p
lddEVQ,#sj:D_`EnJfD2[ita(_=n4WHN%sXq9?LYT6]AOAjKL7FekjIDmRN7"<2Zu-dDS?Bn:
-DqIl)=f.4o?i@mbG<fjaZI=s\8not8&/hs\uPr3^Du'7XU'113Hq@".)F*agnD(5&W99!o!
\*$fd`+K>AIhZ*>d)b"%KMt^V)4;p>o^?U<9S4;cjpROGPPi4]AG]A=#[VN:&V$8sWp%`5g*NI
43+9d[V4LG8Prqs0HJX-D7k;FO2+"\1i.=n+%jMf*S=,IAnq,RpDL?Ar^bt[8A\WL2KEAcI.
R9Zl$2eldHPPB[B:DFH@TkIFO!hP5OM0Wkj9Ojhh%2LgH-/F<IK=j9+QS*rO1TEZsQH[JQRW
>8m"sLhcM*6(U2pPMd,gSi6V$@L:GU0+,9Q6DqNM4"X1C,@d:]A%MGb^3FD+.s7,JBI,"H=q)
0_LOH`%Olr8i:5W=.RdkuIYY$fS\qh#oNfiLH`K-ArU!R]A/=r`GS(dB7JA-49@'mCIf#"&8[
sIfJ>tTPsf5c_\!C.2RT`^K:ZVHb#Pj6dU<E\(Y]A@fmN##rrN~
]]></IM>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="752" height="154"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[隐患分析：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="752" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[隐患分析：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="0" color="-723724"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[隐患分析：]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-2953990"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[20916900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[23202900,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="RichText">
<RichText>
<RichChar styleIndex="1">
<text>
<![CDATA[（一）隐患基本情况]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
 上月剩余隐患10条，本月新增隐患94条，较大隐患0条，重大隐患0条，其中一通三防专业23条，机电运输专业21条，采掘专业39条，地测防治水专业8条，安全管理专业3条，已整改隐患30条。 太原市煤炭局检查隐患3次，共查出问题57条，截止8月9日，已整改55条，剩余2条正在按计划整改。本月上级部门对我矿检查问题一般隐患共计98条，较大隐患0条，重大隐患0条，截止目前已整改92条，剩余6条正在按计划整改。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（二）隐患分布类型]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
 本月一般隐患192条，较大隐患0条，重大隐患0条，其中：采掘专业52条，一通三防专业58条，机电运输专业39条，地测防治水类17条，安全管理类22条，其他专业4条。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（三）主要存在问题]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
1.生产：①放假期间停工停产，巷道及工作面失修严重，中高不足，支架变形严重；②部分地点烂帮烂顶及防冒顶材料配备不足等；
 2.机电：①井下电缆悬挂混乱；②部分溜子机头无点杆；③平地岗位机电设备运行记录填写不及时。
3.地测防治水：①技术资料整理不规范、没有及时填写更新；②现场管理不到位，存在水沟淤煤清理不及时。
 4.通风：①巷道压力大，风门失修严重；②隔爆水袋有煤泥，部分水袋缺水等。③图纸及各种记录未规范并及时更新。 
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（四）未整改隐患原因






]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="1" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m(@OAPM=\AMP:.r*CN:\3_5GQ.7'EpU4Pp+UmD3On#5l=<+uB0WUq6H7!]A0%?4r'I-8fmu&3
0+FrbXgU\DuF#mPsD,lf0),=F&M'F3XC%3M/=hPsddb<MR'Mo-t=a&VYtNb$uV>@K7"f7;gO
(5=`H*Y+-(9XkqQ(;)IdahIpbT,:Hd<jg3;%B$8L@c:f!jHq:\_i33u>QU>_:Y]AP3Ymbj=so
*!52R/#YN0l>Fu#;:U.o9%'+$0`n-k/'($q'l5(2n,[DHp*i.%!s`/-&e?kfF2rBJrYN:k-M
_EqjA0mb4[grIZ>9\Nat'FkE5>+VZq#o="=sD59.Ch[Ju]Af@fGGp^`@-Tb>W.j#'^=D[ss(E
#lM]A(RN6lt,G4R+i,.tuMo]Ag,C[.p*3#ne5Q_t&c]A/Z;+"7G/r,5h1+-al6?UhY1I2#?EITS
H,[PlUSqn,E,hT^OlE,in-$HHg(*]AXR@S^E-\Lod"O@3@J/*j@-Q$dqq,,b>&dr8c;hcbO"]A
td6Y+BZ?=\Tpj;rgSZ&EC<Bp[UURQb4.QT#Rjl%Z[Q_9Lo^XSaN4D[[qnngP5,r>"cOS`hea
hZsXVn_uBE83i/h.kY**\'7Z!g_8bOPmNRrb[\d&B7J&^\0Ye?\FMUFo;*gr3MH^hr!`NrKg
$_s0g]An]A)[K%05^[e1<9h9r%mFBbeNl1q<e.99cr!%<&eP8Q>TuplCn)jC1T^_fMmu3OQ+l;
HjLHGr+QU)qnGpi"FK5p_s>5U*u7$'T<YX`g*H[@KYPM;?N#?pCJ,HfA+G!ppe8Wmh\0KV5@
4[[V)![o%3FFcN'g4)-2q&&I+#<[Lm="_MN(4Knh,T_kjQ:=$_;9W*u4tCs46H'Tl1r>&8TQ
Q^2.5-XaK*rYoe0)cr6'qF)(&k_<0?Kq.nI[WV8tSO8]A@(ha9&rM#U!#s+pOoEW7]AOQA^4eS
`,WjHjBb=RF/P"aTV[fH-uKYSu8??SC*.Bj6Y>ig%<td[AaE"TAhZip<:Ia#q*Go:BQ-H\A;
1[QL>QSpQ<:?rW5.a^D?UL,ba1IS*1$DbSVKaU'tCVBO7m_,^E@0oSF.)p4k8'US?TYOt;Od
O#0tN221$kMir"Y`SthLft-aQNK/^N&8MWLR(*?5lKK)Ykr9.$ki>LWj29qK+4N)-5dL4Vl,
Uak3otMa3^9J60fR&!h%e6Y1KqItfs-)e4<I!1.=q9d&,4p`#,E=m'I-6+1L>;9@"^>KD_O?
a`,U<ojbMT\ej]AVGKM+Q4`M%<"65DCMe:gF,,0!C4Zjb,RE\a&:\bT*6,;+Bhh(nR/)6s)$K
?rlp(.Phu5hePF0"\TAlQ+X0?5n)5]AuH1J=Fk/<p4#hJq!:&I3-_`9HW*R>Aa6@YD9e=VH]A_
nlEM:'^F0Hiu5RkqN(>+\IH<jDGnXF*-)>t`(q:K/LP:/H-]A.Fhe>:abfKLAY;E9$Mgs2ouf
`7XK:iQi9"RDuhnAmG6K:Vc+!\[TD0Y+M92E$:a[-,&Z]AQo5DZa_SmGM]A`PUdL;`t%@"8KMX
es5,<IH;0;)8,T`dA5'g4;_qSE)HWMdqUl'p'!c2DTpQHHqfgA+e&oNm75_%Q"Ii$,cBhUN@
rFJt7EAboZD*VJ2A&mZ0uT;Xh$WO_3%BSI@HI;G]A@o;3k4M)3c4LkJ?Y]A\Bc9\tT.((e`"/J
'Gm%_CY`V:s4Xn)OO$aT-?DI6Rj;@r7>m7Y'XD?8+:Tm&au!"nW@C%I]A%lEBj/E^R/3QRSna
0aHd`4%Qk+EEo9$ubjN-i[j#pn:Q0p6u"AOp/qN[gSSFOb`0oP?jh@2Fs*5UXI9gndP9^(+#
CPq9;blk#_i3MDK(@_iP(@@:%.hq/^b-:\Do%1j,4VhdU4555IpijH(3K%a7LcG)iVq*)>.u
caDXI2+`p#hcaL(BI0)k"Qm6"@kF>I<oYm1h"H6:G%uJ=ZT]A1G-%D[Pqo(M/V$N-mWN0ERiI
VSoWQ[PFPUqm@Gs1Ib\Aah2\2nd,QYkFBlI(ZaFVlD:s9C>R9*/\:Q5^$TJ>C+$cf<jX@cqA
:^C*.Et"]A15DFKWo\,bK^-(Y(Ami'M5_WJ[m"O:R4H,MY,('("<MFTin>VPYb2gtg$jjZX]AD
9GV]AO9InO#t4Hl<JSWV8Z[[TR!g9BZt(Q!'#1TN1"9_PPbK2o=im#2F"VNXEnV,W=WU[rCH`
8l)Uq7PZbalGN5lbeFj_3]A!$>]AT(OM+7k@fd41j5AfS#.'`4\1;ZfL8WQMCbF-B7I/t0peHR
DC:61LZIljl2g;';[Vld?YLOU=%)fZA.g#qFG29R1OE-E\?f0s:-oD0[.<CL7Y$MKHuWk^*G
sS-ZmnjY*!G2WRMg;6nL6duiZE]Au^E9=Nm&[5LDZ2WNt_:"dFl4:teHgU8W$Aj"u:*NphKa.
Xma1[W-9qHV3Pd#+Vt1)Vkc(PQ\RR>\*n_aV9/IWWF'O*Sie"0!['FoL$i]A=4@O!i:*4.XGB
0*4n%acpP=7MaU,Y#P#"^e`"(fb.-6IN).YstVnfXb5C&pqSYN1NfbM-/5r\/'2:<$RVaS*A
Gukf]A*+jZ(Xf/6@`VObQn,^A<D_,8g#.f1,Zo41c\)G`HdaGi;o`Y9=2i&#VU'blWdi05&S;
\+4WVcR<>ukK@`#).-A6NGeN2($*c]A*-'b\b4gcCA#7L5'qAS:j8RHHC\+.C%5]A=&t-Rbq^!
UN,?3`dn!b]A[SNbl=uUfIk''oDV?&[NCc[gukM)3_W`(5dfs@p#WE[Toh]A:rQ?nR^rN:Up12
X;tJbVlXt_]A!C5Tiko8!$^rWVR5^^=.Zs$k_GNu6EHr,]AEpU]A+-Q(!_n?4bUM:b5LNTlX:'n
tR]ALr(T'5;j>&p*DeX0#Y05&Lhi3Y<X*5%$/s`t;qE/pa"HPPqVb?Q@<q?fD">cbg'nHsi39
S.e+\ZZ:tX*am-2&6UUrc/Pup?G.,-(07.>'BAD96Vj'ZcsjUe%<gj:52(+V6L*e(MM-VmT1
)3[\<#DGVb$I3G\]A.LNLp6M?Y?q\&DWMM3BsZ,mo@^OcpB*;L9-V!+Xm2Wj&W_l0s.d5$e5W
ULf[J1>3HopU;9>oM:m!n?g;DJZRK2N;Z."=H'7"3@9V/<d,(ac]AM\lhFeAcB!WbX?AN?QHl
TQn.5DR*9biHrjMHG2>cgd3YR]A/JO!<Yr-ec9i-97i<-*pnQ8';]AkZ9Ooe<,grTM(WM2FjA5
Q:X'iOD[ji1Qp0ZY'16:p8k)IL"*m]A):pMA\(Vt0,5cQPi^\L'bH8n4`p]AnL#JT(YmZ2FfL2
!n6_EiE9$h?D@8^`A7\?RCjFJL!4'3jc01W91[mh>d-#/XZQ(`A@+4S1omacrl:rnGZUcF^<
n5kNbbue@\B:-SmqnnQ_D7fB%Xqp!r5?D0J\t=phn(5r;$RW^lcJu[O$[Xj?%b/<1LZ:n2cN
A7f,GVDn>3;;DNup1Cd(-+GVnEGk?F3"o5OJDR$X`,cIW"UNFQmfl)m*n4/W8Oh^PjTrp:nc
-dLhXAu&3?Y+HUS;qWSrMh=dc.iSH11dLOVV37eRsA2NQ]AfjH'qOES&%J;QWp!YKkT:?(oB0
+UIJVp2FQ4C$Q4R-b;eH"52n_lA/MTSb>jgi68'N,pk\:^7YJU]AL5Y+4\k774ea1A6n6JoNN
A%NR%<.CMXSl762Zb&<L5H1i;(3"'@=OdaEZ21P/1<&t!)R<7--uOQ%.8mFUf8LibWNMSOW_
]AWX9LCu[&K]Alb0Y7V:Ti72WQXQXsBU4Nf*n$m%J%R,65256h=sE_3!*`/V3\dDp+3e$o>f6,
OU6?oGbUdchn88ZFXu@>HP`[?4X>kFh<2!.8'dX$0esH@eA()[cL39F+;!=T.l6JsK,#pPQ?
2Qf&"`hG/Z%sfObF"iZb,b5F5f4C]AJo4F:/H>hArpu,/fD^W4RpC$mCPc&iq9sL"Qq5[C7UP
WX\ap'HK[k:G,DsiM524Wnq"=coi*iUfm>+*`q5c<!eWpGG?bRVT5.Hf4hAuMK<pdg,Dn@Kn
?%50-OmCl<^>]Ad4;cE]AHD<<<T789[Ta]A#3hI>f$&cE/!W6.GBHiC)77GahFt_r9?Je(a=Q5>
c;h5>/O4c<_[0UmrYK8]AdK2&?o#)<dTY\]AeP"3@MQk0kHi8Kq4H_=aWmMEMA!NCJKU'[]A\*'
oBT]AiN,pt]A6]AFH\?5TjJYT"ORUaqpiRI\1D4$.O*15rZQa^(Po0Wh?:U*:fT,OpV(S;.%cN?
Y-kSB^;Q*q_.h<8^ud3_W3BLA8q@>L(c9WRf]AnIP%EmAA6%%b9&ur;k>[p56Q-F;ZRbIU8W<
^GqH<e4P[!gEURK_0%`pqM51mS:[TB(1<HQn46f'm>'K\H'hMS7u!SVq0d,bRO>:-4h]A\,*l
$jE2-K]AFLTk3hXZ.GF+tf`KmqbA*[RD=9t`2Gcq1`2@I-ErCIBi=2D=E]AOJsppcPK^^`1TPh
%b^M=?]AMiB#o*^PLu[rC;K`.'j>E0s;6s(O_\NSEQ1P,<Ek7*Umt!W&Wej'WtIaihDoe(HK*
4<bqnPDh(!Rh\`k9/H>?CPKuiYF,CZO%r0PNb^DNC!6_^X+ZM@?F/ODNaa1EG^mO<bM6[Usm
aRBra8Zo97]AI1D8mrf[Id<ZOfmCQ0Gd3+hD_;B[B+KJE%B=?[*S;LiX@E_%%itV,Mp_q0ihC
i-2:[i&W:.$FdJIB7?NLiM[SF@qmfg>oJ<RX2d6B8]AH_cXE#fLk2dDtGe`5Zj7.WRe9pC[Uj
-@SZ&.8sNS>jR:2\D>nS`Y6mM[WBl=2]AgudQX84*@2sR%<:^mHF_!2>@A)'7C7^X_`GJ!tPG
OH(\?nU-hh"f?+VV8A`Rd_K+]A,5_;"f1B0oHW^KBBRc@+qVdC108Wq)SdbY]AP',VK)/?*3(f
.:s,"&7JgtkeaUN0U!Z9M9$5V+r(`7/J)R-'O44"9P!o9HK957m:Kp-G#h8n1RI08GJoG`E#
b`-t$#R!lC0>dA`-Lq.3S\hq0*ZU=alM&qc\(\EK\/oY[I-rT13'G[Y)6+_)8t.b1Z1K'8.7
C'YLV3]AaC\;s_cIih7XdM,Ldt*5DldWAU;c*>2qL/5Q/hhH.Z1SJT7SXd`A^stAd98o4'-%t
`Eon2jE8NF3VU?L-FHm'cVH2,$k7,MbCN921Dfm'F-QJo(qEl&X%df-b_Zk29\AUFQeo:.p\
-Du$!O+N\C>eEC+9JtL*k]A/FH?ar\CHcP?g!DAT7\OCd]AeZ3rn%]A@`7i\[:KGejJ'n%'<*g8
VU/P]A[7CqU2;!1@0kc8G?9[Zkcl`FKT%I(ca]AuHa:-V+"`_4u1f9hd$Pq(^n.`5?&]A>s&WRr
oe9T),WAZ68?UIf-&lsDc/1G^V9=cgrF@)Nq-L&&FNqoKu02^lSBJ%#U(O-qhNZmr,]AnYT-f
j#3L*KIhDd@'9uu"_D@>dM*GGHhFpY6/[7d,Whs-5*-u<;=3+C:AV#3r<-*_Vg/K-Q/nA35q
"g*-NZK$NhT=;<P4Qc<Gr<-V#3Y2[tdDt(VI2jZcY+mOFqs)B/+8,'iRK>f$en\Gn;]A/u#^(
69,P9:!b%QKF30Fi^f.kCES8?_1^9)&dE;Xq=Dc"lnoZ&,j']A@0q<-dB"UC2nH+k0mk$!d'@
'q+AZHai#fVr>Em3OpE8q8`Qg]A<j>q,j)+V$5H/2=*$-CMjsAdBL)\ashe*[<h<]A"0aoqprh
?LUij/2('=l(YVVu8A(4jpo9m_YcKI!Qr=cIlj.rZf<6L:$0c8bgA<VbeJ+Jh),om`tfF[6_
8cGHQuC1NZ&;aN?knRWhcW.>II3oO7CeZ`3G\V)>kl<"`Jki5Q4DFs%L;fm.;b"oAN?+>,Mt
'*.(eIHJ?rpX_A[#B23r\f@2NT\<pYeVs0(T4;R8O0_lEV`#$L1[6'G^&uV0"3\c6m;u^FWg
,^0PI;*QDNldM"Vq%D_"r#Gp^]An)K,ma[V$\)3gk83E@l"Z0F$0f5<+OQ"2![25<.`Ee2'G6
?kg]A'tKaf"S[$>,M&Ea8I)<hd`4rd(3/?FL@cIs;q&,&%#`Y`m(ON@:*I@<DK[S6IH5IIjU#
g<&kV\K)ANmeei_a!3ZJ'$2"EQj\CkkU,t:4>DZ$Mu9l*50\@q+2&-hpUr\0)n]AqT#^E37o`
75K?_[t@[PD!(:cVs'k(U3MaOT+?uPCfK)6:t!fY3-5A(;L274Ml#!LP?dRb=d!/o^TFc;Gg
IMu+ZMnG,G8L-Yfs!3c8#i^4.7LbGo(dGCESC%dOrg<2V,L_Gul;;N+S2TrJ4riuSmG"X$,W
2?Lrk;NXM#kuu)*2KSh>DFU;'.X3N_&<4*JqCMB+gbeWIUCi+eu,+)d#9.8l)+`4nrSeEC4h
Z%VN\r_`6<=UTMpt\QhWS/tkhRW&Z?b\[eYf=eg(<3D[`Xj#5KL9f5'r.)_2Or!itt#!Q$Ne
>qi^g!c[d2(5''B,crCRZgIup*AS.[SB=a%V3Cu[F4=(@TmJhY5[e%(IlS6VMaUAVB"oVKXt
FkG+3M\=]A#aPN.W%%ZU#&-^2VH/>FNqu<:e>;Qh:a,V_9p)Q<=.LSHp-E*7[@G`Kd&m`iJ$2
WHI9_-mNV[VRKrFO&,;W=k_4i4A#?j]Ak^GqVeXZJLMA0j;N>:#Wc0QD9CCrE#kW2Jd!_C,`u
SS0H>La[1<R[+9U\X*=/h<VGu2(+Q[IU@qMV,.Lq^cPG*K(DakHXBliTF)&3V-tVa,mFn>s3
5A=CprQ))jFbj5(`$-GOE_HF'SNjc2F?M&WoZLdUXQ$8<=]AWTmi'42f*Zg0h$0bIB2/E>"'Z
LIZW(&;c%cPh6iJa&)AYA:KqHmL8t*I`jA$KEfNOi4CrapSd\0_>&FmlmGj]A-=d7$ESY,e!j
$0=PD\Ps/c=&?*0.NWKj7K&"\Cf)HRjWB=jR2A(!3KBh8`=;4=Yi@pNetCt";,ITf-g\jH55
Bp,C[B8fa*aZ9U[Q!:'EXN@&]A.OdjIY@aPmY?pBpoSd!Ta;OrIHB4[aka65_TN.`m">t;]A.>
M8lJ%%*$%X%(jm`,)9<^lV\-rN=*Dfk6$]At2W#=&"%Vlto?iHZrEI^.K8*pI_Pk*q/Q*6k/o
[a4RQm)e5j..K1Cb*:YCVr71W#[eb'-?W.&Er$h%ijP&ttRm2l&=D-=^o'sZ,QN[>YEr'pcA
+eBY_$^b)VFI%J?>L<,XWQOMolSjGgrMGKi0/?@>D_ofjl<=,CQF#<=`<LnB3jV&;LaG'*=E
F0n"FL^r!`Z-eE@.2.QI&k?JhG[3JQe-!Y*Y0%7Q1:8]Ai'Y!]A]AHeqT5=<0&BO:rGtRPbCSRt
dgQa!Z@1?-25I<haSqAhrc.t4\XMH`\EM15cD+a74L%=tXP>I2l^pXNc<o9g]A&88QPe5;<#4
1Nd>Uj?:@Wa9M>(8=o).[d)/&L2F-9]Asa2X7d,-l5G(rrIY0c8tptd*fDMp-i\C^Sg"p68F)
^?Q7E2ToDB/+A10/_cm;*c`cXkcS;Q[qK7e2W0AQCn4=<c6Rg74NbV:d=d1!JRuRYn-";>-7
]Ap$jQ-Y:K:a_bN0_Vt;"e@N8?A:!bhjUXSYY;Q1AOk.6Ka;h/GaQ;.&$um>7N3pSlXbuj;/O
QP0\e\paGZ=/B,WnblB_e2$$'Y!0F.92<NV)+eR35%M#Z"BYIHC6gWPnnjVgOW:+gV2QH2\,
Dpc4ndcAOc^LfJ,T,6,JB"Z$ugSnLCYRm_t81Mb/S5kG2[-(i&$-WS0:+CEm]A#N9V4J1(ldi
W>,)kIJWXM7U\?Z[l1eUO/SYl;YhnDarZ@Bq&#aFJ.slQcVjE0/'B&_U#n3`'["l!B/;Q_+R
7,tS8GqueBg`)m_e4379c62.q+DlE_ci!lQq6$Xl;,a,*CmQB_$41A^(<0?QjIGK8T@EBh=8
rX(DpueaNd.Ph/=gN]A\f!>*Bb_*uqZT5ML_.P?@91Lf-#:eV*Spl2I(9hOUA1AlXH20mZY.s
R>SBR>\MBgRf5cJJQ8>*s[QCH.)WIWR-mbIA5@>Y`ZXGC-FU0+*[^%D8?h5erBE13W,Qi1%i
p+A_fs.^l]A'JiX+,!*Z1gQ80W.]A\iEmgJ4d857LJ:*g3U-$a0.#^>hg;RYdu.JkEF3+NUo]Ao
#ru,q$/sro?bhP'q:j+m[F"]Aph5+rB=s,h87gkB(p1iB"-S$>lI=>allp#pLDf(9F^]AMGs\"
4BL_B#a6RdU6V;]AHG-9(#V!$ZI-r@IJ;-rV9B2KouV_`35H#+.$12HLD.`@nN?QHK,XW1hZ`
[%P]AVkJ3_J/]AiIi-H#1P"3.G90rP`D^\PuCu!bQ"MFkONJ/_!Gha$s#qB1/CM[B&':mt.R`0
2uoDi694=c=@6HfU.TZs&R7+YKIq$7(EH:QG2dO\**7]ANl-FD0IZg&1;1Z0t*C`=.Q;S$&E%
B;lobp.TaRIWhn#V?*]A79.Gf)Wq_tg2nM$'GS@T\3o[mp=gT^)3T<e9arP/]ATMB]AC('g,O%]A
Z#$j(GXRDP1';B5M7Qf^t8o=@bu"IJAmZ&H;eg?O9phH<IYW3cHg%M"6(W=**3YdN+65f?Bj
B)N!)&4:@:s>lo@i8I0V;d+;6?`D*44^TA#m]AlM*Cj'k$J<_42#,"Jra8!mtmm?aD%Gk2@-U
\1(t^o8b?+Rl"Pdj[L,g!e#&)or"%B0X:W;G>,l#"+j(atW]A6d7:h4Jtm=l'u<Y]A!SI*OFZ(
oUTR:onX]A(!dlUaE@etG%i]A:.<Pfn\J9r:W4Tc=c#o)/q3LpO%DYg?mVX"Pt6u:t8ktQLP-9
ij'n!I*Q$4.&;F!;b-:`UZag:'D;[;`]AVc?U,7Qj2UeHaA]AU5qARuesoOY%C%pUP-U5W6YmY
Im;8_<e,<VK^k[FsMGlac.8>mS>sqa!L;+,TLIc8^.oA3Iu-iIO@85absD@RBr"WnUZH.WXU
:l4i[!e_(7Z8;B:0k5YO1q8q.GJfrqS73mIs)\j`@:@0VF#$VQ4<VQ)#^ij<?,3WkAqatmR8
$+7sLEuSbU>`r5g7/`(\X,lViSL)`KW7G?70l15ogid1G@3m#'F<E[i<ET=EI%#aVq"*u&1D
7hrko*+!2^sCO^(8fnOqP+CUc9"OeS"`6%]AbW3UK^Y@OVe,ch0p[dU:'8S@hZ$C;.5nDW8(<
A]A0eKO,DQf;D-`l">X%hDL]AHD+IpbV&Yjh;<d*T.:9FHiREh)TfXfEEkFKoR83A13]A7GEZMO
sl16E-`'%K,XioUF/XYDc^=76WZ;f1W#;8fc^F'+_kkBdg<3rn)N@d8I`W:u/i]AkfLC._=l9
W%Am!M;D-q%O64]Ap7s5>"4M.oJ6cR>/)W8')c3NQ%a'2=Pg+8@X0:Ba?`>Y3q=_Y,=aU]AQqh
pe1gAd$]ArQ@+_XgB*;t**&DIoMt;A7A@(gp>-c<^OJ9Q<B'`EqkJDPg#W(F&7r'%GKno?`8N
7SDL6Y?]A\jppDB<1Z5$MmL\hU5'<SqMs3qg5^JWcl;Z,#qb(M(FJ/rdoWNZr)\b+8EpJ-cco
hUNo[*,YSU5Ie@29dNj:l5McL_acRYUJ0X>\L=^X(7]AK)Re0`2B\i7mSZP0hY!<E=1R>I6=Y
>#Y#H[oW9a#9@S3&0/gi)QRI/6t5`U=rJ%_LNnb%YuP]AqRt]A2O<Ci/ZjKtkR0&H2I0F$fds0
=OSYE#Y`dfNRLl.m;N`fghM[;piQU/=b-F3M32TaM'=]A[@k\u4#A+fbmQ3#IuInes@9Q80<D
3Ge+GB5X%B1sCrQWPf49lIW\T]A[sie*gi6I>%+Rn37<!0QDX/UNGW_)\B(G:]AU=(I')'`*G)
^<B`9E2O`ASYmk&(IN,md9AD$'5alPbiOQ+AaPi53Q[uHIuQ2P_\o,"%TpNhQ%=[C^.HfnYR
\0p5q1@ShFM:4GnQ;;)fZ)8'uq4=FZraUJ%#plt'l\"3;&%shoq=FMM(]AQHKmXP(<7!/IB08
bZYcm24"?X=_q7hYLDggg=krK?sM&c"q/&[P"4-Z/U`@UtKp#5,Xj09+,EgR`>q65+AGH0M;
i3RVuFZ$c((-pBX-\KK)kjb#Et&'oH_.ArFlD><lLVrnEbCQ45+GC-l14SLTtXoH'5?s>RoC
WHCMdh#"reKFfki+-l?4md'6r8;M]ALK6b!P5\;+(;d!DHA1tmd*kP:CtO/NP5k.f2.2+;8GD
pIAWCN:fjN'_0!%6*1mnJ3%fJ*5C]Au=JgV^b^-O7>V:%]ANk+(:3g^JQXf%h)6/E:/p+@X5KD
*j^\<q_m*![+TIJQ&+<@4$>Yh1SIb]ARcuuknd6Aa]AqI?`4;0GN(!lBE9Z/^X>:$<r1si.A`p
]A`X8e!a&"1*O<#ZO07.)hL$gOduN^aE35G8spS(-(q((-g?)n-)s$8Vs9.4Y--_*VD#X*EGC
E'R+g3lPoY?om1ka&S#k"7!oL!_a=_lgH18`e-?Ir<Xj0^WIueOkk-Mo>CqEdZM/UZjhbbYV
BU1tQer$n8rp?\SCcLkXW3r/'oRrkQp9oUo%^\ultAsRi4*hV:mf=Ro!\"KiR#>!IC%VOeBF
Ft&pO@(*)\";ERuftW)_Yn@Ns(7'RGYQXK:b0km%$[:tp%uh&`:]A1D61GidH23rn,C,2!aA[
dT5FK]AAD]A;\WBYRLQco'l*%t-jop)_-a>VbLN[RuCrif`d/d^!/g97SW+Wg]A-b5DRN_6T@`Z
MfOPc."O]ACsL/'%3^Rj`5+%I^0'@24VDb8]AQXkLt^'@@m.,:DqD+U)W5F@,TD]A[g,\=h@`&_
u<-pEolr%hdF#T%Nf/Nh:J;]AaOfJeK,X=76t\7o;J4\3:\ko<XA\dWdfkb<WM'WpX)1(aK:]A
F.rneks5G5-F)oEuW=:M,pi"L.Ur.AEPV5g`YqZ->J.HV'315_YEoa>8V,DA)[@=6"KK<Plh
9FcKp9>b)PRRD`/PYP)#H(3"a+Y\C*,ge+d`c%uOAoMkVs@l@6Gt--HDYYHI>g5f#\/a']Ah!
UF;jWEbBZ(Vd9-Ri>l,D_$Y2VZtr73JFkaIWf*b3I`m@*ZTBqhn[h=R+>LT_OOBn*s2+^Q"$
d*-^,F#;_rO<C^\Uh>d+3cH-j</"D`-C_,YSSr*_;i_9TL1Of7W$"&)YerbFAl$"1fY!bmb;
7S/0gl$EttR\ZgI([QEX]AGLVMQKhXf&\([#k>W=uue[XgS-o8(m"6$&&nH=8d81ZrC%eZVRm
Q,EZ`TrIdRnm4A10PSoV9;t241Up^B]AF?fOd1PZ;su%WQ5FGBh7L(b@>I;WXf4[aTDi6ur<c
R3M*Us*Z^?NC4j1L:j"Kjb.,E'_.[Dlb05-Ct3LDU^OLsKg[/!`8i!A`-FXKnCQ-b=YlHA4c
"<Wo0RGMA(\0q'J']Ab!q'c]A$H)o`dtgeICk)$!nRl)FIl'1\GN'rbKsjD]A1_!q[m;'uT$36W
:gX%Hk*<Zg7r^Gqu5o8^!78#UcXBT]A%9(W[IM=-Xt$L]AI+VA&(>h9beX'uKi.YM%\7*[3lj%
h^9SN(pk8WjHs?&-]A\3LkRTsP7WP$Ns_\+l/<I3^VP:Wj>/&2V6Gk&qB(-F6U#re3W#[RHR7
I8K4Ti$+_:Y[-^TA$9.k\%\u$S5rhM"*CmaZS!@)i82I`s@Uq8DHE9mD_"oUP@b3HSR$&0CA
mk;GB?_nqnGpV^r"`Sq_[.L5japXD(K74.WmJ1nK?Eb#uukakk;.YH'(`GNlf^[$lCp;_S-q
7N!n9G?Y$>#0kUQAJ4N-1QnEK6oFnM,cRlMpor4TQ>*&;CCpH?lT&3RjDP<+*_kPuJ0%b0b!
Ju"(3Gp)-4R*MP6:_nY\>F$Y^UGWfaM)a7V*CQIl$\LOO&;3;*GWBi!%o(8p5A"bBb#.-r\I
;Akk5OC#59U!lC+M>`./'0eJ#L-fS6rYH"[hr6_4VV=>t-9tUeHB0'h;D:4J&e^k=uNl!)Ph
`_m=<O>Nm."GH_&;,3=PZm'3^if/,":ef.>eQ2k1W,kR!$aClJkWbj>$!uVbZpNYK.j^e&,`
jqk.nAZnK[n1hg*-Smfto!pmb,D'r!QkHf_[*Y/p^E^k-^U@>*<=;,q#Ves"7=a%I53GX<ep
a6ufN&HVm\mt`$X\rqk(BmA?Ps%k%9MJkMp@<?1kL+8:t?Ml/-r//^d6)Dab#+(kqONu*L@2
`A%@UXJ*8IkE)`'\gYLiqFk-NJrC<JW2AR^3C1M_?ik^K!f&@7&$NakoJ/HEhR+^<')R,InE
_/Eg5*8!cm!P51+kf]AR[,jKfMO#p^U7Rb1k.4)ZjPLAVnYBgm1,h=g_(C]Ac)qeIY7E1j9BM(
r!;Gqlni!Z2e2^Fs!sfL\?ZANE.eNHKI,HSXhh49"i^*<>N3NlO(\#?=U<$F-=`l[NeBHZVn
/(8IeH+H[JS1eoQ$0$P?j0h%Um<FtO._a0Laqf<_@6)X82D93DjCK;<4tb$d:P[N*-5JFo*(
MR)13,\bMe]A#8-1ISir2a3(TV3]A,Am)mm6i5>n_/jLt_&<XZTA`[&rLT4i\nC)sR\?qYN$(/
q6Q5$IqF^it>sZSuG;:g^r-PW'LFk*_BD/tVX'V\TMRQ14_Q'S!@:qlGd/a'(Em2*S;[CZ1E
o]A27Kq.&t)mZOT:)SY:Hl&k<Su,3u-!-h#C`8P]A-"l-&f[qQPaCba(%h-4/rb"iOpqASTL+q
a1.feTK8B&ep,++&XGcQ?ip;9<:KBq$U5uh,;hPFJ&$p,sEY%B^mbj7'Xf@$3e;QO5+m[/7q
\K_6jgL1@D9j5?V*$(KXShK""bL4UTGq%#p7A#5HA4]A)%m8blI:+DZ,S0"'p_%OnS=8=fdCI
qbuQ[)ju&pRmOI"C?mX^-S=c(brPH74Rk:01=fseQd^l8&n'1S;1=F//gPMLf<+n3bU-Xqma
Ku1jU^BSSja,5Y%Ym/Wo$cKWfbb[Cuj4+@*DFY^YEX`TYQnJ*4BM]A>Fr'4XYDM:5tnbndq9/
`g+-r#WDAJElDo5\jLk0k[V5`cPas9Lb3<=J:VScCj2A^g`J.`XpUfrF;gg2]AX0m\6YNGs+[
.Vnl`PVp5!EGUhk_J'l6%d7%qlu/KRC$Y=LjQbl<l-)K--Pb!KRW\l[uO#H^\*1g3<LDVX]Ab
VnR]Ae!k[4u-f=etu#57C[Zna]AT#n:eOH9:,Xf2+%mV;KT%@KFV1UEBp_l;Hi-OV!&?p+NSjE
9-SJOD=M4O39teFem&O`QY//KL%;!Ca*J,p-@je[AnKj,\SSR>BD@4e:\o-YB6IH*nM@iqeI
:HhapV8V]AT[M<gAPV39[NGsi#BXoMe[+J_q'uXO']AC0nRRHc.9Buh5i]ASWD_N;8rk.(]AJG6m
Y=>/c(8q/+c1r^->YbjsB%Oo#,;)Z5[g=9Q=Dh&k6=,pEuQ.sDeGD70a1j.?s4[PKUD706CQ
pL5`1/a4?o_12ZQ4M98%OQ%iMJK.f8d=CDnt+j%OF"%me^P9U`j.:MMA_(rqe`.lD=nmgm8f
6prIM''rHY">hY'^^;pI1u5,?nk2,!7m\g<+,2iP.*F_7#L=[jh+nq0Q4<T`'s]Afg')NTW\m
`tiNYNWtY2(CrZ82]AGlS_eO0lqU.]Ai8V"W[/ICASUuGU>eeE15<rLK(?mBXp-fS]AC6-lRIU]A
t+@[ou(r#*C+@i1b"8C;_5-j!2kc_`%WCqc_kmS8/k.B'qfM,9J<=OL2-\$W]AR*;#N@^E6EC
\<H(d@b>d/d6_X3p98+_Y[t.=KX^8bQ;[*jm1VIA2I8F1_=kW>AKH8:FNr4,qb9'IE=@N9C5
'Z[:RPD^AX;c/3LPD\EQQKAL't/k6^8e[b'<a1E6Mkoe=$KA.*j#*5Jp1MoG,B,KF)dSDZkO
&VjnX>d!b^,D6/.0>@dr8YAt*MpSWGnWPqq"3H*WWMYc`TB>`&R0k,+1lS*L&'-jJS+4*PGU
9=;30**%#'2Db2p#CQ+N3>9>W8M>jJi1r56U(VR`6R]AYNXsGgiMXt_J9;Hrm13F%Y7E,8s"8
b^C4>uB_Z[:+Pn"9%_Ee-aKMVWY27@kus?l2ajXWGTRm-SI&&9O`Hg_(ENIuqb_<J1q&K`Nj
=,uJad5*0#)QfAO-%I\aUgQ3)@G<SJ9"`<6-+&'>H,?aO;oD(QPL9.h,Fpf8tb2)ddo'UZ4c
-4+7a$c#YP1jNP93G_k+]A?@QWAV00%)!*]A#%=npa*(eWc'Y2V%sQ"D=m6Lf$_9?!9d9]Ab&A%
n'l+6"DIdsRMSU6sX!1l\m,b=Ba;f[MC+J#34r<&Fq44g#F-O'?kants-pSo<qDZi3'^<#K9
?21X%A>Q'>>&o)7ck"0f1(;\,5/'?cmeX$9-W*lfIBJ=Z'1t7)OgEC'?G09tY^WiYs5[a[(&
5GdJpDW)'t_-XJgo5oE6_\g/4YLd\T9)]AI2kO\:\DC]A0'2oi4G-<C>[#s<@8/PJH9e0(ZD!P
2[.A1Zf7G%@r1=P<F9`fa8oaO1doMm"d&Y-`"#ss@B'@]A5q'"lCj&8ilV8^X5rA1qNqE)l;:
?Io9$q@8[mHZnXmP01J\dU0/eWd$6!FNe,N)MPa7`-lWFLIDH;cmb5gpk\mCd'Z^LS9TqKu,
_c>&@.8>KIObEL[OOcJZotmtC(03W_5_en)c]AjbUX5XBHc7oT.1k]AFT!,_0-e%e;UX`1%c(]A
1`&W#5h[=1/d]AnG%'(Sho)-O*;7EdL24S1C[s$.&idaepI)OUuW##)GGTc)B]Ad'7e/'%S%Vj
DKp*-]AZ>-d\rSHGtN_0nn=uE[VGk@;pe,?_ldTjJ*rbYmpOOqU@ZgN$XZk]A7,Jd2'4D@*)*9
D$c<PPI'[`%h:9moPuImujHUo8oEX&G+;FeYI2tR[1,\E`?GbRPEMDXa%BJE+BccUYVRYDg>
rH3^7D1'#c%@6o9V<'cp`F]A:X*pn]AEoFWh0dbft;d<^-a>[`Q4(hl%i7=Ag2J'6g8;.E<.(f
Vj]A+I3om?LPHF^9(Y[a!8m@`G5"?0XFY/'"6a\2O<H#;]A.9Fu`C[Hd(!s0.QZ:D1*=5m&kT:
C:'(Y;C(pBrRTU,69WWE)@[OH(*5toGINimJ&#hY\CSRh=,J!)2#R!25g^Y$V[k5XR]AFbOjD
L?i@+IM:i?Y.c4b;3'h!LS>r%B>sC_?\X-7C\LQ1gRJ`O9L8L9?)]A3rVfBq6P\[F(Cg-^65*
.]AC1PK^,u4(R2fVoq=Dk;k6f0dVjEJNYs`iS3.]AEdbVq#rGV<i#89s[GO,VMi=_6A_C.eckZ
8[!>V[ZCQ5@.:Yl(SGg`mu6qL+CUQlPmqp,FLb#Ij5U9<6LO0aB;s0WP/eM=Ok7=f6$^,D@?
d9Y*r-U3ZS\1Uurh\nU[7f'Al[/MkGFJ:lA<PV]A9pdlg%L?NUP:D<X2#KfB@^q;7WSZ\;TU/
h*,nGcT;TQeQodDSYtS7F[m4^3f@(L%q7Z_&r68Z"kHcmI"p/Gm*<X,NY.Je!/EYYUSe?+M;
F'/RFSYT4Di'kq,^PTO`!S1$gbu%RY#D'5+.WjMlR(T%,Q\X,NkGN7/Hb(F*SgAi^L=*_[=!
q9]A\HQ@3hVu73a!iR<K;/+ppIN!RP"R8<(C=J-YjTBZ5OHDK2e)KIka;V_`<4\M8!LE%$QPB
H+W%Hj'<>m/Xg_pH14shpbC/E":N&&,\O->,iZd%cLuJ0'Eq3gM2?.S\O(%o\Rj92/Bl)8ju
#)K)H`tUYQL>Qp#OU?"0U^Cika(6_u-[9=3MG%25\0>@]AF)P9ur,=%_]A72EN.WA,L;P'TeuP
#1/:p3f1&uFrf'i]AHp`R$b6$cB.d3Z&2D[$UK]AhUjjT$`h%p5&E$Te)Tdnd9Z$.gEfstifMl
^A.gGk1.I"K6'g=6OY"A'TpilS*cE;ZP>?.-E1coqfZ]AMIF!HB$AS[gI6"%X>B"eAm*bB]A5F
qEH*O9(OF1RQ:-0kM>f;T%B@)ag#)ju3G0Oqi+FTb>lp:*!>28XU-IC(S3hMnaOer8?VNE#4
On?^j8aOsOj#[+>$"$,Xi>Y3q5irJZd7c*mi%+?$%0%XHt6:[;foB*Z?`t3'j=OGN]A>+$'@N
cANEqh'ZUdZ3]A-Ao>DW2Jb:\S-#U@6.TG*Fjah(*+SbH&H"KK7j"fBP5og>l$YF-#o2$NS4:
iu<[6#"kc;N,/P[S85V/oTRH=eNU$fosLX&`3/S$=1WFS_btT,2l/KOaMp;-ZRQ76Hk<Q:.B
qib.?JZ?4^PD16d:'ST4&#DIEpI&cg,f6[("#Cf>2,51=.A[c*<3,6=Gnh2:V?E&F#'sQes6
nD>R19#8;%iRM^)7m1uM8n(es*$(Ig]A@<F4ps'Re\Z/M3q'LX`b\ilm)r(bTVkA`H1Y".`'E
1qJGP@]Aa-SNAEm*gS<`VkcB=KQ+3(03k'S4s$LG<>I.<NZH-_5kHEnCX6'W?=rVP[gR=Co%2
S^qs19i8L3@iY3nFjCGKNKUVs!'pqIUDj5RT`o@:*afbl3dHP9r+oV%Og%k!?RT^A1lFN\/r
+a]Aq;(XZ0?UM1U^Ie<Ge\,)h7F&Q`IA>sq:C[2.Z#QCH]AF4it,S0TjjO?BQ?CQ6caaPX(".J
aj--;qAEhtq78NCSQL<_+4[4`[i`8ErUiCj^iug[inIr+ds@J$Z:Nf)`M]AhluL1Mj<:N]A)<9
!A+.mS]A-jcBV:\2K)&Bt(Y]A=fb\-Pp@_(+PgcUC>^?hHV<Y.nR=-p_9V`$P/F4a1q9*s>InF
UqXC+JgPM$7o(2bn?h0!0VIHX#a_`lQ;'j:PcZr(J?8hY/O9^`#S,Fm)9fdn[&+N[41S@0uf
9q7!t.MiCNM5^;FHd1/93;[9M`NmL^A'n$^angZUh+dCh0/SqVr7qX:cGqU)Sa;@ApejU6<R
bA$c3-nB1fY4bt5-sqCbiId$0JZA>go2OB7B_!pjNhu%?f%146V&\.5,cBMo>E'uQgQUl!M(
u[>l(LCer:O%(*Os30GT!H-D5h]AclpMgf-C&e@-^@+NM5e;d^_;LDhb\UE:ecE9"FR*F/jRZ
dH_gZi$SEas0]A<\W2X(jF,MG5S76'(;>qG,+<5GO9KO+:3f@fLA8k?5]AU\]AtW#q0k&GZ_,oZ
4*I$?Y&R6Fns(>gEP3f*)DIAWn-Bmp'ZA(*VBl@Y>Ko,TJUCIQY);^*dRL+<9'l`KFiQ&^Wk
IFb0(70[:jfq:]AkO1/jkf\Mja6EQUps'kkbc_dt"<$3DZm<Gc;o24!)o0\a.N(-?_eQ??!eq
p:+`;9RT=%euIRnll^AurN-dSUa]A*0;U^H?nUQBKEb2F(P/A>c\&Dl'nFFlqa_PhZESp]AFYE
uDCE/!SjlXqTiL0an_67?9djED0Z!kj/+fn@E8OkPZ&eFad_gjX1+pFU46N\X`1<CN8p&+[=
Iani=e3ZG9FrD4R<9[2L$LrCaQk=UBo5c.(4XPHq@.ZpLH`jP$*CqKV/LMZ-+o@J`.Om*8fh
2,;rfe=-ITnYf]ApQKhf0_jtPOFgA/?uE;']A&9,DhL2@hV-370K^SCl7XatnmNY)BR[Q..eI[
/t1?4LN?J?!90sV?ccS''M,Ap&b5p$WV]A;Mp<.N[.aZh&RM)i0TA;d3=AB->$oHIK*i5_IQ8
=ih]AMRlE2Moc;h/3\(%Jhfc4mc`LS>3W@Xr2j_LHMsEDR-^Y$nHh[A![(k+XG>^,0l1?Q"f/
NuER/d9\P6IuYMk(U)EDtC0(]A\TogS'-sBGNO9j0PG6K,h>`XeLV@"qOfQj?+qbLL!JS_0F=
N=p?NbK]Akp(pC6r[oW@_!fM?;m"L-;Ti4+>tk$V/sRI=iWm^ZUOHkf6I3r$%I3aP3ub3$c^N
b`1r/'dglfA-%s,.PX$*oW;B=a0[He(487klK/pJ`%463WU%*/@)OQ@-kVs;Ai3d2^ep*"p"
[K[2hjM^q/mXPoqO0?8N-7n&)n)HOm0:UTB_1[if=Mp([,%ULW""@1(LLQP,?2=S]A]Ae<%;&8
U=LlZ>.Y4raOkKa/GQ=53a:eo)d<:\9fKW+aI\AR?#!pH3oO_2E&MF_4S8!cAB(scPnK7Qg-
7KU;E[<90B`_&*8pVUQasZWjXW<IIb9VVK!>]AH4LF?.+f^KTh96aXNlgt54S@dl$j>YRT=au
QCSR?]AYfk=:gn`07cZQ4pXMkR'Vd2F%*_GJ[&p7N-N+Y,9'A%DOrCH*/KT_ISjF>lISN>nJH
>a!josc%_"*(fa?ZVN_)-O;Nap`X5$/RSmikN?>Roe0#)']At8$T$X%,TpQ`jf]A!d2Ak-sSZK
D)!16n+!7<`1)$-_r"LSR.?&U,MZ(eM.]AZftudcmI+^J\+CR6,'6q?qm-oEpcEQN,]A.POKWi
[/O5MY"V&'8"_Xi?r2T!Lbjkl+!!Tpg2#3+>?nq([SCs_]AuDSqZc8C3gapF&[s/>5UBLq)!I
!#*Z^-,JlB2R+0/nV`SdZ%()+*BX0jXOB+hYG@h&ghq^KVWDEe)]AVb8DkKG,9tS'KMjl+X,]A
1BXo(:,V*,pb7b&pG<XsMr>X&?a0eX>cCq,7EV'fX\s2R[7PE,?d\Se>UF!6h"6s'$D"tEaS
ZJ6`7T37K.olFH$2LkO3F(LIbI\ri>M!6TDAGqB,BQ=672?KB!+Y0*NpQTWnI%^uYdI4oXo>
]A`MBUPk*r)9J4P$sLF34L*KN3;AeXV"NV`e`4GJA264I!6[L2,@,(MLl`"L$=E9X5(j?FA8@
r\B*)-OYHY^i!L8JnM+AbHE)pk?NfZRR\=HHY)cf6Ml/Cet6k@IeWBiJX:Ng?J4V.+&FrbMT
T*,l.WjcVkaO.G^O\<8\Pl1XNp7PXFQdZ?2l^b'6-QWV^O(thO9idGrT;+Q-03W7)&`4#^#P
<QR6=aX3N@[%UqnuPqR[J_B-p`?PM9PWXf>lg1CHS6beI9AkZOk?T3k.<.0/^?FQXYYYlE.[
J*T"'_R+%d_6cuqEFmFTH%?Ec1%d#;h4K0n9AoXb*MMVae_:.f^G%t%?MWS>4\,-0_/dqW[g
T:p24$1Im&hW!%iDcp5'lp=``O@lJu.=ahH^q/o+<,&S.EoPtA`S'U$qP8dXAihDP`pVH^#N
?R1^=(6f-K&%Ao!`LW:_j--I^f6<r*\YLc#LU;Gd)aV@#S6N/cJ/JYaa-Kt?cg[.f6@oRnAQ
.:OJoDtkZEr<>M^gU[nOGq+H*QfB2n7@uQV@#Pg.)"Q3&5:2qT6e&1rBVk?*oTlX6d;MQDR6
:eh3NXZ_[c+;%3?:TX3pBP85hfNVppE*s@O>89WfZgV@M'mTr1d)Tg/l+$c;r?IAi)htK)Of
#!"NbcY+a;^fkg6bY%GAt7ZMEs3dRj5)AR.EUb:m"05AYFkRCGPL#o_Wj0A1DiP\aOW_VSPF
M7</8]ARC]A&_cIKQRB__O.aDdEQZ-Xm8^Nt$\&$95]A)E.=u`f".)N1KCC!GjnCsh+baa(Li,7
Ztas7M6Ih#nucob1C;'p.%ahE.EXTU0+Q0No5u)fd$f%ZH69%jb2?MbLRSH=LHXBbG"OQ:5-
Y0/mNF`MAq%s>J>DCfA,O=)onX_2#Uf0[NG6B0lmb5<[k=)XAhV[Nn`tVVY1j7S;L#-nlT#Z
>=cC9@*@46Eg>g!%a)b(q&5?Ue-/:>@\&E&0R#,g84C?ec5G.bO#6SAKPom;rMqjCheK7uMD
hm8_`L8;BFSJ#E`8:/)'?u!(&t]AJ=mFN5dKa%^UV`qqY%M68GAr=?/b<2F(`\6KodA[6!PJf
1`H-Gl,cFSEk-<_a0q`2l%D,?;&Ar`LjrktY.Nnf4\O6CiZ`1q6'#?EonX60#Fj,9'@QZSpJ
Z6MCUctRKLo<1d_F=8`KH_aIX^Wl7Oma#!fPI0C35Kt2%]AfgQ^s1=Z/*8r.(dNNRfg6c'rSb
eK):klp6-"o6R/LNP4iC#'WAf=A\"nAqT>E%,!9hf%i"(E-?-T/+"1"Y77aCV6_QXdpG'_j^
PR)csHf9B$U/]APINa0`/:pV^%3%HRtZ4=\t9ML)l^#@N8uK/-P4CA/.bAB?":+HKrmnqA5J*
`V#pX%b*4ZW1*2`4sKY+bmUIY8ho;Q?-FHR(JG`AQ@\LqSecu-i1MaYP/o.c%j'X9W7@#VjR
&/KFKp^eK/0>gWZ`dn#$'2L8G/g>>(1cEX\LS6QGJ:+$pgtb2#U(of9.1\+Cr0g0Uh04aN4m
efcoD11dF+hO+iDimhrsDa0Ot\i"FM0&n_#S5n/W#D?jj,Oab_fI">8Y,"]A\VjW\<ZV+RVce
YfgOgG8'7CXp9kH*q1#h5J`,:Lka+5IgdTP($Ilf29kl+ukk[1tn#IU<'5mSP8$FL]A8cg,m*
B),7RsNVmb&:;.7Q,(!<8<mX70;&o1LY<k=IZ"Kb/9,IA`E.[]AYhnFrI^ugb*C7q`1l;m*uX
^%mu?IZcZ9tQI"lh41s#/tBJB.mHPf*8]A.>m6O9aX4GLbrCf!e`7pj5CE8Zm=?;/6qB]A[cKR
9ZF"oduNm,MO%Wp!B#+CQqbMsl:l$m&"M-.g1rZA^6r;ZXHZC(^FA;Gr<qkC2_E*hm(qPPI)
GWuGmT2cC_5W7gb@)K5)mN4.&%hE_ejmI$dQqom'I9_/<-"TGOi5>MKWk>NGaVR1NB?a>g0)
G\BiEKX]A9%DC#gjGJ@P+6l%@U'nF3&1_;"IeR&YtV.#kM]A072A5n=pmWMfDU&rAD3kFrD5Gl
<R'OH+/<mk%Qj/$aPJ=1`PKEO=H`,0!UJ(L\pYm??;0)CX]A[*D+#P;VNWQtJ2j)4;"ocBSoo
U))ho6e>QQbBfKo^&8$+YUq6`98t?'kUCX&qF1uc\a0POXM%'(j4V4KBp=8cq<,FVIf$&"-<
*6$*DJ!qO/"]AV<4m-<6$S+Sr!5cc$6`3V45N-[@*ZJ]A$7*h;6F5pots5Ks1Ln]A!J<lhatN`H
<G3PtPb/L<c\]A2%:46:N06F@F3:6@WWD$2.F7(Ud*65fW\p@HUM8sILj=Ja.[UB*P$F-]A<m8
W!/nLO*THs.rqrF?RZnBEOt)PljA/qo1;(5bNe[q&pQq98ii/[>)Dq2As^:-3,8H<4#pL4i;
M@nuJ`P`QqZ<\B'4BM0gr^ml_:RN&DG4Te1&_W1oV/a?;>LVW\#p`m+?\^P?["Fa^f@M/^fj
_W5T&ZU,8/mWX2$'g)c<*\pVhHb?u[B_08r;&gg[\kNL,+lS[;m:bDm'4X!2U%2(UaAhSep,
g^GPFlFCF>hO,p2[;ChCSQ4i&6qlG0%H9QRZ2$+W;>&DAKnY3]An+V5&A>>L\Ql9jQsFQ!fpG
e9R6%F.mCGa)Ud=RCCr55Dte`ZEJ-or7%`_267BjAq',+qOU!k4\9GRnoOFsZeLiNBWOdbkB
>9@^=$D3Ahi`IVgnZt!Na"8C'Sa2/At0Ga';s;-(j!a0c>4P4R/N0\,c;iPWT3'7F)BGcQQE
gG:h7(gT\AX>[6#-8_ZpErkF89l`_eL[d@9&"To<46FoIY@t5^JUdLri5m.CH(h+nY;OX;7P
"*$<<k=ET*#PMf,R+J;=0MM4*k\-?^2<bUm<u_K#A0Oi*,D[)*QPmC`u;%B'N5X*oqWJ_;Yr
2$0JFI%DQ%A[NFT0UP$t,k5mNo`jWV?6h:m%U9np@^<k%8'3b98XP?@1L?^-5]A#A.V\rg6\[
7]AD=D;Khq2)os^d4^Bl;W3PH=fu(F2)hIVTD4c",c97tCg^d*t"\QOUiYGkjPVPDKd7!BikD
aBhHaD03-!tbTB6&NOf!%J?fdnRC\rm'$5hX\k]AF'ePNu5W[oKg^8/&<Xg*O('ph]AmJ/aL4)
n$oo1SfbukF80\j`hu1TP!cSL:gX\M;\-sdu;)mUu"u-0W:'OSp8$ptb+ujnd`n2;\GVHCM-
ph$<g0o;"BJ^A/k8m/QkaA(+99?0gF&Qht;s1$8&)-t!?YEmun+L@=H@8"]ASbNZoVNJMrci`
UXGQnE*<r89141HoQ[b3]A?_B2H?^>64d>FoI*Y'PGHFTYWnVSAt<^LM(F<%ZlA#6,%Yo&=-]A
rT((`Si9>?CNK&#`HJgoO(s8f_Y,*[VB&66IoD*jAJI*"7N4V"&7DNHp-S:]A2@+7:),>j3'6
\q9d`Fgp@)5t%[e_u`Y5%m^Xi50ZM9s-^)5c$U^lpJOXGBlJ_]Ar\m`(<$GGeFsoqHdEe`M1$
)l#?oT6:GKbm#\X/HAXn[Y;9)U1$5Fi@A)bEh-ZA\XSeun"Mhf#63tA8b`H$qD`f^KR;Z2#7
E#@Lj@_/i>M6?S3ZHfCo'Ua2YB[tcmSLNX5h5"Q;B?2OXdd6`aBU_M]ANQ2Y$#XX8TfC>9<j.
7ffhFKt3I6984uGZ)Bc3b%3F`ge9dp#[V-"qHlt.kE_nn.M!.4$8r^+>lGao;]AZu*?/@LX&1
e.b_j4#l?&*R\#/#\!ViB]A`kL0o0aDp-Lio/c`PO5C$FFEf:;_)1G_I-Op,sXI^nYh1H*7*D
?0&(JXNAh?V7*P9o81!<A3KK)WQ@3qUtBGEKDT)N<n,ib*2:6]AZ^thte\*R+;mYd.AWLS>12
SdK@1LPsH.gWMbW+IcO`L>Fc>Q]A=d*-d\)7b%2m]AN]An42Rm+*Loku<%Lp%rXZI<au-]AXD"#T
.gKI50F[44e4W*P`gE<;<CkK(Ybo*BO[n#n:2b;Nm#;rGBUq-,13C`R&!#GFruRB/?R16mr0
)`\[k6,*4a;;LQ2sR]A1";)#4G#\d$8aUXY>(F$TuE.^>ipN2g3!F6-6$>asl(r:,1Yf?:N:_
`aPI"8H:UN,3%^b<9+40Na%"#6*^e]ATrd]AOA4=bcoh;f.Q8^9f6Z3)[lW&E%BKYM.2M/=QCc
&RQRRjmGAq7=Yo$g53`=sc\9jQol$XQ:;*maRbBe)&^&2Tflr!%I0TK(%QCpD2HqI-*\qJh=
p:IcLf]An8Xf[&+uema^eAOX5'Eg?RI0WhM,kH[P(Nmh=$6_^VQdZ?S2?\k(?r428G27=MZ9G
AbVc2kYVinjBLRBb_ui766a=R8Kq45GE%.@^sF,lcsSIq16E[YLB)kkN4MJGS7#qU;3d"QQ=
h/Se0`]ATSV&`A]A2&X@&hY7Q.*Vu2hdQ4pX#HP2A3%)e9#"]A`Y"cOHFl;iWUF`M\ZYm/gfn3l
`Xbl<^p9o98PL^dpHi&f+kPZ=E4C&GEgN-;[)o.(hCYI'%e`,hSC\#i._r!tQOa4N!uSJZdj
tZ8+AOn%GC/11ju?B/_0s5gq&Iu7p9]Am`%&PYcjMBStl["o>E,:#mKn-tjN?nQpcD#j9mm&p
Oafr&D#.7npY<-qafG?nG3satlI3@Kd6`cdZCG4-)#:51aI_/rN$.((2PuIT9ceEU>3`&RA<
JlcHI?s$%MH@!ok<hL/#(CN380M-loDT72if!/l/=fgYS0B26hi<B']Adf?JqB.69gGbPnOEK
]Ac-n`[8nE7;kY8]A<+VO7SkO4ON[jrC6-Qu0*np`GAJf#b\$-?V&@LuK;K:3/]AQc-2X%ncIV>
f"lFM9C9iVC.N+k%+<#GVro<cG/%AW3,*X-q7BVg<MFDi55Kn=`fFAF)d%)EL6`It'LL.gOL
i$]AV1jnbM2+ir#E5YpI8d^m%:YeRDB1OLf]A.8_L\h'IKte""E.XR_^=Wj9W?E_A1/$&F$?'W
W!]A,Y[H_J/#_:A3anU^W89DXl6ds]A6_n`2XH['\^3\SlIOfM@MbhCok^?Q?B[MNP$Nqm23(m
R+!n6bs!L94GSR\G:2S)3I.R&2AY^_6:g_s8SMFQ2,iJeScVXq_@Osj&"sXkeX[89"_UdcYe
PaZd7k<+SXQ<T@%+4)n^#h4(KMhQ]A[8D[R%E/'nng`fm2V()UC:[59GH;QgOnVG]AVmm053c.
-OPjS_OQ2'TTL[1`@#CnaZ`Y3FL:+;<!gec%girE)<%1B9mc%Z8rL+tVb2!S:)36UIGA]AV'-
5MH3)To]A#QrIFdg,o0_M*N!iVfIUF)Iec^&3er[CHcm$ijruh[?cCmE(t=8'fi5.W&Si2YGL
Gr;Sip61WT$2Yqg5(ZgLZk4`67pc,YcUI]AASDH(sSSi>of^+sb@BZK\6n!7gQPMuQ3b2kj7i
8.eT&OrVdkY5l8&B4O3RMkI]AKDEN(8SM]AAWI"A[)j,G<$"N1ehl6"?`=,+Y=E>`98;NLCn48
%A=Q;guk!&iLpl#dHX0]Adp4*]ATpbdOS?<1!O"7Cn]AX[I5sfTTaH_JocB`W:<3lFe>:[%iO)K
+0Bf80$E#f:qBB(dRsIVDupc;B<]A@t!c'j'`WeNDT/UPL%VWSBq'_!?`CVW,BE_**^tJ&n0$
b9l>(K90Z,3)3/6HK:MImh+)PL>k`5><s'clG8n28egFJ%al!R<TkmpWU\Wsglq$7s-dEu=,
[;$lC)/"Z8/VE)u4,QI<7'KJ1GPK^U1864F*]AK^*@<mli8+XQlp_t2r"P!kH0=!?bR3@)S9A
J<#/Yd9[T`t5^t>%[%CmhfcHi,:)'(3.+":>?4%e<7c2)=3No@lW%:2C-^>Fu8DV-kX!QB^m
$=nG]AbcYK$*[l[@N%;)iKEgK_.IX\O$;6_iTrctr)*jA-X>^I(e_dZNYqdVO0EpG/4iJt[I8
qZW#G>T#klaCMYi?"N#XWaKYF_76g1qqMJEJo5Y,O"AEG9$'^]AQ'':u*-pU_]A303DP>"^&9r
fCRKs&Q6:TDeN(=Wju8P%6k(Z(Fu?j(6OT6RQZ`8DHBp"C$=bdVIL7O*s/EV1Yi>(-3E^>iK
OR^?]An'"NIeU<]AiH4Z`S4^sKM7m;gm[Aj0V3>nN]A4oj+haqLtGFgH;otV>"KCiVm=inJ4[4#
Ogmc1\YrN:k7`>RZmErH9j>_:*:4p[\#1;M,NAG;5Nc7ME.`h#G/i=5KOtS9aU0?3SI\]A^5E
;b<8A+Q_0#S$<%g?]AdSqn9PV6:+s0smM)g9TN,%]A2tH#(iom14S:_al7WPe!/`b/AQS_1BFE
YXEtCY.cY"@(*-:Z)D)PJ+%$GpDZ\sqrf_&G5o52!HH+"X8!W,+Md;N4ZNUaN/kY5[.#.,]Al
j6oREnZTVHc,*<U<i]A7@EhG-IY,>*^jVK+8:#_n@@uJo!Q#dG\lj6B842'Iur"'C/Kj+G8O2
+X%7Tk9*D?:NQLurQ>q6'IP7<%3Pa6WF&KaDBEi'a8nH=1V*sgniQl[%jN25[`g;FI_?9R#3
UHo?lY>@kl`SF$FO\@IUM/u;>YH:Wj0G7SNlWT;[l+]Aj8Q<o'G#i\VUt/e'/.TH=g_BO!>FB
eL)?'?+Su$.*4Z0&7h\ZFWW;hGmGUFmGX(COF'R<Y:r"m^pA4RM%6i1o/!?@W-j=ELQee,-7
^t0'4LgQN"N==Pj`o#3b[$J9*-GB5aL*#W=I.2qPa.B\gM1F3ai-7tM8&1rmr-")[5UcSIB\
st/1S[D#0Dkf9gp?D\JmVDi45aTF_B_K&$qLZWp!kL.@.5f)6Y^uF3L`;-=ZP!%C6B-U^W-#
cK0f,_r.%J"ic"_pl$1Wdo`YSEs)FHeYohaDq']A^T`VfS?r+F)HDOC9MfMo:HOUj[rHn`.P2
h(+1FWjq"]Ab6?Kq#`@%6URJbh2R,ALD;b$`D.3;,OLf$3Z4Ru;nF=h25g&.c;C2JGj95nCJT
S*+p_;O_Y>CP3RtnWUN9JF++mg*99e$Ys,X+Yn:*DtYkV\1MUbr-Iuhd_hT1d<0e;H'nN,Qd
Isa-:8`OTu=f(Cu-/I.$_B`etaEFFt3.*T?fha851Y;t2mEJj@loTX!qB$>M2B&i;d'*\'p&
B^ln7:`IYls\CM-nWZb/ch`@pM*Uj8q+?UHkG:p(mZ:QTS-:bVg3f%G)F6<16d+X/hSWr!lg
h=Vjl:[lgpBjVC3rQLQ'L!3HkSiasBdj*e,sf$H:bk9bfF!Y;oc+r<VH@<*+Q-NcQ(<Aa*(M
9K08gRU40Fe]Ah4nrD+WLd(b5s$q1HJ)s=C^FtDg&QrVWF1(TMa,$]A8<<HK:ULh`r(9D\_QUr
Qq5i7au9&]A^bF9("-fmJ[8MOGp,0VA?KqCi4^mif><jRmlo"BqW2V#LuD_ES>[8M^Z1YZpiJ
gAn^^Y*DRKT0SU3FjRgNNoi,'Q'$Ek6Sk8c_K"=2`jF["0mNE0E:)'Vf3*@*M<*u,J&mJ+TO
$kAP#9Gn7/%r(i:Y!_nN\Z)62+l:=PN[:W2T<'s7Q]AtJd@$Z-;9/)d:H+J1iR&p>Zfn0Dd4O
mLA]Aq$l2CAVN[cOW%-_j'[*HU%aag=5Xt\8EHJ_IoeQ]A+P6#,'7>+bsW3rSrC/2n6MN9DV[.
6bUc-;r[@JB+RrHpco#;JG0;jW)*<e<Mi$P8(6R1L`lX<?X2/16Od$ZEM\uZa`>'EL/R<Zld
\C1q6'"F6,'jeV"XaW&D@I>RGDW/hL_?J2;M(Z87B8s.j=PNX.p0]A6S?;N"J,1pas`-s,q!E
6Y>t`-i8nP?3bW/IgEB$%iOlOkbtm$s&NJ:JUHE[$m`P9WCkXYNE`6E3T&+%cuZ+-BiMd19`
/&nm=%F-Tjg=2rH%N$SXl,367FtK)-N>%[B=:0LL;EF"Sf*+?C$PnFq1X#XIdoGhp5-bm\i4
U*`HT&B\7<"T)cS+-I$2R:l6g26Iba%_r-0t9=S&'qi%r5a9JbU\kWlr.L>EB"Oi+`11>1d>
5*>jb<iLOCem@C4P5l9o^UMY$Fr$6@tg:8mQ^n7QU)^rET0lap8B4po\6UpdHsBWF;LRC90X
6@jPPbB:LDO#%Y?T:V"sEl#ZuV!GNokW*Qms.nbRI<]AiLKHY:<4_EH1bC=Z'$*X8r]A@!Ti(1
:(0BO:%\@o"UN^0g2Me?gKqTN4dOS[E.(B@Up-6LgYBplZ#hhcXF:d@*:3[qprV[CL4Xm/!_
+(-Xj*:>M(fS16sn>iK@!e7Q40["Xn%=pPJRL2hS=E45]A10t2QeoM<bLT[-#T2\,i`DXMIYt
"7k3q7^0s*tVI>Lu;X[K?2m/2-dNWdEM;Ccq%)07%*\t4LD%$8sGJ3r<]APaUbk1f^G-fHk8Z
2;+KKZU[*R>cLZ;leV9An0-GAf`1:e%;Ip</1kK*Hh)hB*,?E"%p\Ee*p8"^;TR-04`@hS2n
uN%>]AH,:\8Mp8P]AW9^fk/ELd.E=:cC@5c&AIJ+mf-_"=NO`0km>'ABP7^^Z?B@^0u(0?t_jX
D!9cP)S0?,]ArYdagh!L#I!cZn,IjM>qf(VY")&7h5,UUFAPIS(9Qi;R3ZeFQX<iph-0a+HfI
Rq"NX07?'U!Or`GYD]ASJs%(JK(5MVY<"db\\&QJ$^OHS_h9?jYb,:8Yer&9&IH$JZ`<=l0ku
7$ZPYdL6XNdPnOFZp\=VX:=Wq=Bi:J#_,iNQ6/bP=J4k=DFPC,ngCCX#*KTXi3-has=:s1=9
g_P*dC?h,,G&rTc>a(Pb1'7cfkD31WsdIVf;A-iVW-1>j$od]Aapms5l</:<$MsjMnVU==pIe
o*9>L&cYXMn^;\1t),FtNS[JNWt@q6ti1f\C<<dV:5g9%maWOdB<XW/WsbZktuP\ZDH1gX7W
1e'%I\nEfd4GTS_>#VXgE;=/O(Jrk`><c#P8T?,5E8mttA^XDXTR1h53<iZc5/&gZ6!"J0$j
1KION]ATl)=1ITQnbm"7XBqdlO_HH#K<m]AmP?_j5UB)s]AaFUpmT3IH8tccgHJ%,I8o6bY3CZ(
T/qU\s0etenaRr'sWXLW2)5uJ<Y_Q3Mrg)X'6F/)^\I:%78(*VfUlUddmI6hR*lLHMOY(APM
Eiuq68OPb_p!ORi3Xc<c^@%hOj)en2iSQ[:J,'Z!a+=M>fu[W\U6Qa05`bI/h@2A,*l!Xmj]A
oc#KUZaeK?as=5uDU@7mQcM9PV\p\2A"kI*SrW[5B$SO+>e2hnI&6[Ph@SSAX6BP('I2EAQq
O^Q*g9m;c(7CG-r,q/6%+7$Pm6IYa!WJ+Yn84ROs_&'f'FN@$:)42knj/>9!8SH&F)P&VCkZ
8>V$E9=\*ak*f@;o91Y1m(&&2%S\\kh\g7307o^JqH;:f&U_*Kk(9#`m'&8qaum0$e,2XF7E
U=FQ'"J&^^%Y(eLZG.VIj*4C+9oYGSPCI_)8]A3e#L2baaDM=AX[\20?d>l"<MRLqu#DAXEAR
IY"'Nm#/+hr9Bm4DsSOlN<&L85g[chQ?pV+o5[[hs/=k?\;fk>Q/Y!;/KiN[')^G?!#NjEoW
WQ'.B4<;l8mZ"+nWR=o(mbZXPV</?IN+=Ha]AmgZ,;aI'+R5Ad$"\&sij:-N_=_HB+D7<qG-q
Mtp\]A&<gF>POd[:R_+&ZURHP>VC$Ne$\("'4(ZX_XQO?Y"*Y3ncAsEW?]AVQTpW81(/q^n6AU
X$/)LDq=Ca_p5^n<J7hbt7XY"&@02:pcL3+S@=4[:"?SOhC+f-ha9pL:Alg'aMlOV"5@Pn\@
1L/$jJjgV:#TCK`3V`^sC:CCbMo8d&2JNf*4<Cbfj"KN(1s(kYIof1(mV=kOUfCiS(p5NoNn
M'R%cdk-sY.L"<oJYt;P`"ebV\BZ?X3SBoT%-7&U19+$`XKWX<S:D]A,h5]AD4K_?ZZ<b6+hK>
,mKoq+SbD&hqOep$obA'nBgbnd6-H=*mU\n'"7:`?`&)oun3ojot:p3eeBG^7B*C>Yp/V=I&
TM?ZUbc(%8"'K,\5?.Z_+Gl9)-\!B@hHQ&PR_jgEWqD*jXf:E6cKZ`7==h$#h%#q0Xl?_mUf
5&nOK6s1]A.rOAH6&(6rg@BA.=#mQN)FDMk5WXD?+OP71U^N^T'#4dY95Ct.!:X;^PP+;q0lu
`\RT3_2KX?pe5t5^>*4&T2PV`4qCI[DJ$hHL?e^g<H>i-`"hBobS#C&aRU*k,4UfhaT)(X]Aa
_#gp,]A9<_)H<!c;Zbpl[9QR(o@81skYd%/ftR!(m3egHaEk?KiY:uJlN?#NWGh!"E-otPq?;
#LR;\?nkjG_)Sai242^LAQLQ4@r?c-XnraQRULkE+La5%.TINGfbFiW<tV&a`^/2uQn?E=!'
<N`td1Sj9m5E0_YqK^HE]AQjZmYrjqJn9A9Z$7DHX4ga^F5'3dEir@n0WFaK"f%8bN%HMGlH7
o6^h&l;;Al(*T)1j^5>^rR:pk7o(&EOq$k5&j:>gdNk/u9X]A]A#dLrT,Y+(r(+FpAFZFckBqT
U>,riBE,6l"U'+;RkJg6]AV#9,u7\o3e8s'U1MUYg_i\2]AI,tMi8\iT1A!]A,+tC5(dW]Apc@eR
R6T,dNlD]A<U:>>]A&mlMVZQ0oK.bq?LKnad/;`%r5M05@/%*irMZ6D68rAkeaX;nr.^h;'pWO
(`G4en"EjIHmA9/\M/g1slHi\duW=r"7=AXU?\f8W7EW;b$;<cJANGH8+W[/A6G%'7<&"$i(
O6\C@lLp\kb-$"$h:rKm(1C2>%b60-*.?Aq2`liRS5Q9@i5HJK(g2Lk%.X^FYK$G'k"W6Z?`
M\5<fuDo(M*`O2CHPiQp^NrBpmi='4+f"1=b:rX1af]Aa,R1EeOZ9N2qo;f\>1Pa/Agm0;A?T
m+UE3+e?<AGqjlP0QI8-t?4m`2U]A<4H)P:H9@#8ZHi,QbT6;:7<`o2E^YT"ei)IJeKV2'hji
XCZ@6gN*ad9bdf4r!o8I!P]ATJ3`YUo1TI.1;KBp%rZ5*K-nR;IJ+Dp<iX)+[*lfRYZ*P"p*\
8t*jC`4hf18SWQBi-bH2@TQY)c,9eYt.:`$^3C2#dM%N4"/71lMVR>h)J=V3hXo573V,2R`s
>-m0f90K3Xp!kumP>+uJ.r$!=#h8tdODr_DPG_JPN=dhJJC$[r'74BLX;<4\$CMQO+,N1Q?]A
rC'2!)s)J=lild2"DW'ggG5l03ojA*00Xq"EGnS3@3Nlt+2s0NOik5_`>'\aQa3g1OD'N'Xm
efKhI[j6*Z*i^\LGl00F"o5!QXfF!2;R[&*Aam>pTUhl*N"AURfh4KW<A/4/DJc6$+`REIAZ
6oQI@$"9m<LWLPmP;&,?r]ATN@h^pGX[&0t.s7lErlGI@ZC16XQYlA+D_!+6(DlcD04=A>oG:
SUR9?`9SI!0X,Q>BTm7?/&5g>J&mHT;b7T,]A9X%p()&hUjpjFGO38)<DCD>n=I1'R!nF<t;F
Bp:+\SKF&3:RTb:g=C/4TZVE:_'nDXbGRLKP5[M5q;X8<6;@m"GC^A,GBoQRU$5O.H`"UQZl
49/bM:DlKfb.*4tS_c&o-MTC4Z[P#1h8f-(5ForrAtf(2Y]AG0g1!U]As+:]ATi5g04P-2%U+K7
-3N]AYJ?R%n%N;1Cm[JgJg!rRXQM4!s[3Xm&'b(FXa(#I?mr4#eCQ",FO0ADYj$esjF=mM+%3
uD9&n[;rD@O-U&]AL<><Wqdi(E3*4\E%T[F=WaQr>$!"KH!g2ia`NtIfm=N%V@Y#[SB;nQd1o
f0>=fI_Sdtj)g!6uK8qM7O`f$5_0)M5Co_c50`LbOnF5VQ%[C@]Al%]Ap3h5&YqEO?);J1Va$3
`Qo(tY,(:IF[^IqPl3m-e4#*lCYQ01&!">=b4CP)Y/Atr-GYftV]AhpU:Lfe@n$'D\Q5D0t]A8
SU3$'H7+f'Fa5CJD5obc_cFZq7f!67AEE7<7Zb]A]A02/*;hiejB4uI&7\Gf(dsoGkr%HP_d*p
'e+:0WUD^HI&UUiaOSa26*'!mM04"d?&G30d)Ufs,dOjg5\_nY8`6lXtNj4N:)Ch.!]Ad+6ds
%%@_/92:mcBV@'g6^a1r:-s9)RX5^mftAgaf$X*_uprfE0T)#YsJ6'OulFN"-qT>7b=+q"gW
hfPT"UPch:k;.Pn$;gTEF8^MhUkSoCKZ&.]AmrRo?jaS1NL4#1.R]A'q5MogKT-3*1AM@o5?;T
Vi=D0XP$Hs?K(qrOI]A"IA3jH:8Nj1hIe.<R[017Sq[X:/k)ml4(A:$gjIUnBQQ%d%Zr\0]AbG
@RD*DNRa,c3Z.<.)A@<-R?&?Y[V,]AVSZMYGrBE&#H6:2d*NY#AYnJh1;1<7&>MhLppgfN]ARi
VP\F,8_-ho-%L"MFP3@]A[)l+q3K77"V5>.h!!]AtBMBek3t/Xn%D2t`H6$HATsoSN!B"lj)hI
gY-O3+'Ig6s9m^;J>DT0"A99TCQu3B`i@G5f2TV#amE<HKOtRO+A@\F5rZLK*EaG*k,lNqXK
)TK:4aqI2Pni;9a)N:/lD\FZdP;k&mbnOLD"D&G>"g`K6j`irLS<"m,aNa?*l'%m)i</gog4
#N*:@n!*gjfOXPh3RE#94Gd07NRU5]A2nM]A5.SJ7*"]A2F9ERa@=d33[/S49>)LK`)5]A<(G]Afm
-+WT6$>I5k"/IUHqiY&PMFlh1.TMqY:1k"r5skQ$MS:@cD4Vm7?(_9>Puski>%qns\3tq7UD
+K6uPA/u&J[p7\"!U$V&<kT`$\kDd0q.2(0PcgRT.ACsLhq7!297cFLFd/@aV7WTLY5Wr-p)
\hR:iWd<D,.F$]AUj^o7\U/I/m5(EuP;Q+o%\dMS3G;g3U-Sa))Sap1O,XSb7?5O=!/:k[*XE
_s7]A#`KO]AMDVeQ195MBF8*1'/Lg=L6H_53c)\UB%V4XlZ?@.0B`7mBX.73S_:q\NSfTQ0_P.
(1$8bjc"[BXG*`hlJgR>gc+ZN2JU*/`c9:SU`ZO;^G%H=MoE%$6AB,Qk6S.t@!OM\XYJ%JJ&
K$^?P6N)&*JEnW?jY)>^kd*r@nta.^sgVVX7AGU<i]Am<aOEUT<*74Hm/]A?lgB\Q.]A%#oMeYg
-YT(hO:m%nO,uCgl"of7=F>2ls+N$OSjf7B("Ih!TS,J`a`#QfW56k#5)\2"u7$aL-pu+(PX
q@F$fYT'^_CIh$`Pd^.:B=sYh#,^1^pi/(W?Rb$14B'[qHSKEXlrALGdqh)/_\iuhB1:tk9.
5d>J-a*28o0=76BK<R;k!ID#0(&-jI-u^+-i&4[j)dH'\u>C&,f!<#O2JJkRU/%+a7(^=0JH
g(c?agW*hMj*)#?Z]AK/\CcJ#`TB.\O8`5&c<qa4B6J2KM&8U?qR$U[-Q^0BLc&ZEu"9qhiP]A
*]AfQhR[Te/SOdokB[?'c)!Ert(9^;OpOsHR0H"rmM&;A`3T#mOsb)KZ')R9t"NR_L!=E8GcB
G#2p:m"`sXo%]ARr6omP#1#=D@BZeI%J99JJ@>YRUMR6umFPj^pd$sYgdP*d*M(C:TY@+`uI3
I'jj.q"s0HF7<BT>L%1@%!kqq6mo*]A$H#s.<+d]A)nLIUKG[3EcH`^n"X7!J4+j1SO71.^N9T
<15=W*273EM<,*a?%TcGXu0E1gH'/_`0DhA.3jXkM$Qs7-DZuk`L$FLa+;<*Y5?IVtR2E>"q
&Acul=ii`V]AFV5,0,N_`IXc90X)S>uXDQ0.*^?iX<%2-@HQMXO,gh"lI9:07bRJmg&aG\I$-
h?.c=ZoZq?ET#HInD:1C/7inUU1A;_sc.]AaX6"k/@3Oo4&2Ao-`;L*I`6rA/+:Tk-:jO8j0^
A:e_Y+:O7'6TJ!JNhEPbcr&j!Fr1qq@,tLsl8,He9%A7\=:QrhF\htQm(CgrOg5GY8Z,P'Ur
reZjKX:UnWIpIlok(&JSPKZINsD;+@4\HnY'W[8+JHF_o!F"\>iBTL<[N/;hYuJ8-d+Gb"OK
Zhr"#:)P,<9DRM'&<]ANZH3VE5_d^KePWbZ4,A8U.Y%-QgksI>[8-Wk8W.B@G5]A&,huF<Jj?o
G>OK/+O'Es[EF2EkCUj4EiY/lU*#qfNie&VgS3Sb3:EF<$\8K(+R+F!c8Eo\MD1jgk1.k*+i
9F>#M6,c;_u;IST=q#Bk+d?BKP&@,$fFeptguS'4A_I1f#),em"Eljuiftl$[/hRVRW!Hs=N
-fBuVK>=^<Z4-tX"+9b.Ei/U3_Ze#GeYb4O+8V**A'=$F*_^pYT)q[/*06/eVc=;iq^8!+r&
!Z9m&tC-X)rm>^.*]Ag*8RJ`WlO]AnW-pksTOWMVK*SdIu"K)*&.YFGJI5aL?nG:/C93in$fhS
r><F$G%12egum-:8:Z#aTQaHQk8T0`u:^#j<jh-hDn3>spK6uSRN`=fU7hr1="50m-F@ge@T
[#R4t,E"tPdQYUWW'Q6Z\P#Pdn,3^9HK1dVb'VXApg#s-ZFj-[%F9mh-IPc&6Qd%E1uJL67F
iH_3OWTsI9;%`p$J;2gD56D_&UOL<*SPl=FjN?]A9'+Sl0;[lHr%.(*EXJ?e<QIPCX]Amf`OjW
b:(,r*[S;RX%Ob@Y)[^Ih*=;$D##tJgi:4oC!^JQ`Lp(*Fg)[j4O8?[*CH5Qu2?#<rHtI;CJ
TW[W/j'e1$,b"q-1/G<S1RI_04rENnL^Y,#O^Th;gZ8/]A?Vl"ZRLK#@O6Yp&c<%ekU8pa0['
bI8!5j5Ds&^t#^US"6_.2C=X:o!Yr'*Xf4mO$kP$g9FoX%tfLO3((sDGMV1uB4n.>*n*-Is"
JqkRA?#4$DE&FIC"-.G9Xq\tl[+jrAo>ei+&H[XlZjiM6QS./g.__Njpd(!HHY#n=ON>iI+U
:Zs`.]A^>8BQ>DBWC7`RR#<%$d,IkAI=ZjM]AGu4V$[Y`%2:lTfA@^.*o-*%?q;c4/[Sj81Gi,
CMcDSe.oP"40Vj!L\Y`T8g,tupS*,d:4.X\$0i]A]AFrgF>-&9Q>'>J>l<9+N$Y(@m[t]Ak^Hjg
<Kgf5_$G&relcD;Ug^O^t$UAf&@J>bQsCl]A@*/UB0)hiK@s8l7PG$P3JWDiQmup#lI;;+]A2'
aZE0oa?2LB;jc*nqu#oi5A5P"Q/2R5fbE?8XXc/H6p$AMtB*/It4?:q?J(mlXK5gXs>_V&6X
EIL$P);>mG*PYPt,cR#J]A>'s.e'ar\V"(n/nXQGdddP7-7E5rJc0QOEEnP`3$[ld\8"2[FMA
s(:$k82&/@1*H=K%J13=K^Cr`k1#q.7^I5=C!45$mqcT)UK4$ifJEKQ/De4508:eA?[;*]Af-
VXsg!.-?Ea9-O3VM5Vi(A8ff=(^,Q:2DdFP2Nf`cMhtd[ZjcMOUPt[=^!M9.t71,N=[i>-,l
Q!WL\27-7VuUCknLIA&2B?&h8)`sJ8Z(5Uh1503n\s%E<Mf;F;1b:DVm*FWr&Kc(kTGAW4#W
q0Dcm/&pC9.m'aT\#Ua6F@Z@cC/b9Mqe!-nD4NtNh`Bdo-LIO!dOaU4aI-!*L$IKtDA?,fMn
h5CjHeCU`a[P!BIrUF\5,Fu?BS5jTF`1C(s._JSp_OP0K+0r4)F?:NmJo`9AVeiP@f]ATG\\*
G"`2YC`UrRbqjaP`Xh>ER$Oj]Ap]AU#b#1N=pa)0Z51/9SY3SM)cGk&;,65[`Ru9nd$QYmXHJ)
M#*!fA'4<iunW)UbMKAB3BN#?EDYS,pllU*K)0Pcg43[,@%/8rLOcTR!hf_EEWOBIPfYf2oR
IC8$RNorijp\3JGJceOjgR;`=V[iP#^$a/Z_,oNZ_=m;m`e/+%eqO6"<Jm&Mf%."`b&.kGrJ
3O*I+D1P3fp/<&J_hN^PcsIBW5k-O.e<'/eR)8*M5_BK-cHFH?d]A0lH9Uepsl2T:!8\SQ\'9
02V(R.1dru\O<'9!8c;iKK2W5.rCrmPGl[ho!0K%ZlfB+T,QLmp%0r':t)%n$?mWn#m>eC)j
sFJ52b_a6L-R]A</:eWCr@RsLjd/WYGR\uR+R%`Rd*<4\+:#k]ADu_1=XO/WP;T]AT^%Lu9_)DL
d[C.":UKtmF89UfSQDcZAc6G\l(-UfkF;eLdp40tmO;mQ_;hG/dFhkHa3Q)V:Sc=tcnb@oUk
@rtd+[J_K]AmALdB*#NlG]A%,C[abDC(k:9H\CE<><R.QU+L16q1`<8MH_oIF"2aCo%E8Zb1[P
WH+58U-L`NQ.3$no*4M8Mg,gHFuWS:*EpPphL"L_F+_E_*jl=tR@;G3[d3Qi'6W[P#E9pqVZ
?G8VNXliQ>1^s(F@3>Cm]A83+8bq6!P8TgPm`+WdO9l+>=rK!J<Z#]AX]ADrBU?^DU4Glq+:Q^C
aZ2;AT-VQ)jJ"@<"oIZp"emD(k?RDdJ2JT=6rkOF-s36`XHH*Dof6>:(m%>5jVT:Qb(sBW1e
T@6Y%(Ke>"2lb4(a)5K"c^mt5?Td+,TRO^*OH]AQpe&Y]A*B"b)t]A+27A'I2Il9**p4(R"!EZ_
.-.#%/]Asns.X?1bN:4?JjC)G&@]AE-:T]A^Y/P`dOU#1m1=q*LD%@.iTKlpSe1huhmEZ_S'!?K
(LfZf->)K7duFc;I(rq(U-YW4FPibd0e's.^koIk`OJ`n;e-QN@Sm]A/Pn4Lc>Tl8`kCPa&NH
dDqfPNB*K,aLm^eiMfU]AfPeP@7S4Z3<&5dn<k6hI\.j+kr$3)&=u7T_%Ri68JG"d!NRr1S%?
o^\l4L<#;6[%q-SHtD^M5WJkSd?<@QFGWPk+S3T8NPZRb#nGOh>B_Ho3XF;=@!+j"fTZRK8@
DSTaEK9N%2@`RiG-+`jCKmC\Ea]AYHk"#?"STCK4?u_V\k##nNGTDkiW$D>obN-l+ar84jVCk
kdkgCf+pnn6D7)NEJQlG^:6#Hm7@=KoIsQ.=+ggVeDq@3FFA<F)Gu`It*<`F#83?b`dlHO@V
X#j*&At7$q($FkV]A@&<'%3dV@56mcS.T%k>,?e%,Vh0hlOAOZOfQ,_/)C>%]A<TC3.e`T03m#
/Ao+PHGs^fhtu1s#JJUNOud$$>chC:A<eQ;F2kEr]AFn\S.)qMt<iD,q\CIpVMp3@DAtMU2"s
9Sa6St#q4M%_J4CAZojPl)3s4eY?f'!QY86O/Pa\_<#6G#hA_HTdS5GYDRNdCTtkoh"SDrhF
Vg;DK2DkPr3qS[r/QhgQ,=:\bqG!k!:rbBO(FS!h3,DL>MlWWC5G'b48gIF]As.srRVXRs#1N
,f<.Ee2UP7oF6V"2Khe`fh?]A-tc8"IlS.W'JX[[?$['i4[(B0iI",NFN0U,FHdX$2WON9@DJ
1@M@#qKdl2M@G^PAhRcp]A5c#=Ym>:43Ch7L?-/b)fMi_%j'+B$.\M*:g#&kW#=WG2;0\-u^%
$7`YQiGa(:B5oJV=p:mmmSDC9-^aSf@$7N'+02+HRK$^F2=m.^ZC*f3An,N>FN>IA1B7P?-"
:@-hB+/%]AfVhJ%r6A0X6ZaK<KQ"9:nNa3UDgQjSWFmNgA8i%)<Rp5mL[*2#l,r)r$#P/G;6d
FE_]AkRi'3RWhlL(JdlGS.os/6>B>>$?`JR(0Tq&%7BdIG!,*%5G4ZNkIOe#u]Ap$c71Jj1I9;
amb#F*PY@SH8Jp5HR>XTidP\F><e<:*/W@s0aVO8m7a=MBY&*BV7Qu%m\j>-nA(*GNp84-d0
Ru_k.lgZcmt4g]A,-kX4=;AMeKq.D.f]AsKRk&hfH6<9E<M>mXaV/V*<qY01q'ZOb!5Jq3hbr,
SUK.>%qnJEl3r:0Na+POlX\4;:hi^I@8pk*7HG=s\VDV4:`4J9+L61fi:h:&!GTd7gI2GMCn
^Ao,qBV(C=[*tmdEFAa6uc/V]A1H.TSBnX1!J?k+@>^mk]AmZh)C2,#:hi1_bY^_;<cbg*_Or#
eYZBq[Xo6GtW*VSa*FskSjtT=EM(FI]AiaEFTZ=t00Lm]AM2-=KGq$:FKq;T?_?nmDll<FktWi
I1HrIZj/]AKIn%j+WUD7d2P@A.bkm<!J?^BTq;rfVJ0-34-(YVD=cX+a[WqRhd)`j+T9RYs-2
?=p/Nnas6rP,*X.e3[;rTbauu-i(+3EsX.7k0!LVXT@AUI`C=S5cC6;f2bMmi"hO:X,V50)?
`'SPc#^.'\(7PonnS#ja^Qr-&1m3'M9k+T5+]AmTu&_;12(]AFIVY=Cd5ZfFqen;X96#p.@d_L
ZhbE<9L=);<-ke,/YTqV/BV0^hdCj<\.qAZ?fSZ\%='H&:)=,WJCDKRE1&UL[d&0s=1n47m(
"7R+1tBrW?tdq.o8aTkmIZ/SJf$YgB/M5%d<Rqqguek9Qgo:IANA+.Eu8=>pgh>cj(G3bbI0
#A-BnaBe%b=P)^Z@=)&R!"%_(7Z"kau)Zc/smGBN33WFX"$Cl85kg`m9,jB,cdNQKbbp$^3c
]A43d^f#1hMPs+1F2;]AXdk$^\]AAnYGJ1SXEW-)e2"-HGj[u7a%\;C)6?E=I5<kToWORRs"nb*
"[*`//o/AOGn:Lg*(APb`F:3KB9eSTBYMZ$6!HoYorJcV+6Tc4puAiS<-=0>]A2)!g#Wd_Zrn
4(selIdHDBa2Y-\4;lMMq:E79(\Uaf!L[[="Gb;'A4oH!#Ll'#>B0(0ek%&s$RE-2GcFF#\8
Y8i]ADS.6TV;YMXK-S!AUXoKQM<nQ<po]AA\b5I8-PqRsHocQ8!G<BuB'Q2`;fiI7KPIZ+=EP0
`'@Gs5=%pGl5[3`enL4gl+ID2b>7Cri%BhJ71P<#pa<:FTW[]A'h%g1r)+.m/]A5c;i"9YB/C@
d`UI8mNf.qD(MEk$'4GPW[G%7M%`@X.65q.N+'&Q=I/F(%1hM[UZKU':`IM7pGPFE6Ahp+j?
jn26md]A]AVqDUub>N%i@8q&CSX8P@K"Vn?#,:=o(:f"%dOk#`mH`MtNe5LIh<,R-?&UBGc^TD
,-;^U#VVmJD9$(?qRPnj\pu2Z[R<HZA^---J'\PIRP?n"I^;jd5_<b>5M:29Z'4WWXQa#fG]A
C/M]AjU+mVce,G\]AdoB<5F3]Aorr4"'1!HH-bb[R7b%)5AQ9p$_44WpEd/S3OHTK9pMV2UshD1
l2=J.ks)TlIQB'BkZ;iXJ'p-6dld,Uhp[<GIg]Ab%>L^_na/(snaB)!RjmIPHbd+8.g,55&"8
q,:^kR(o8J[lXF;(69Ff,Eq5B.#F,$,BN)XZCrAt3r-l5tX.D\hsB"4$bP=)S>)poU92!pJV
qJRsP_s[efYc&>tr!Hbq-!+5Y8CcTlS'%7O[F>`0jXYJGc,NdTR[NRL>b]A^:58nC?3LWu0j<
20T1OH>(ch:!AU(,jhmPo_B%ApJ,%!/AJ2=$+=!=M$dH[4*Gb6D>.\2GFcV7.PTMerWVaBcI
MTO._Cb<0DjZQclN\b4=,dfKtX)!A;225cBY#C)!E4[G)rO]Adf&qYR%gq#a-Y-(R<'ajgI!n
g3ks^+&)fo4Q)cP+hDRrC_EY*$J3ULAInK*=S2j$*:L]AM!#A@iJ1P1M?7,QgGW8ZUfQ,'O<5
>>hWI\`^,C,<GU#"rp9<Dk&VhRo<HOkl1QloPY1UKfTRPb:f>)D>9=.EYio'eAr7cN(?BW#p
KEAa/QrGms9u2+a<.SD41q.W8Y+rgXs3#9E"7Hk"V*jmogt/YjAdbV1Zd[4'?2LFSZm)\<Gh
S3#)Lj-anJ9EB#rO"q06aa*e&-acN:LJhDl7<&rnH%N7\5K$Fe!O)2,5;[XitFT2%@anX/D;
L[4PSC]A?uGG5*.od+@NW^Gd5sQ'1Tm^EmH)i\mVt08gr&GHGJUM*<q4a!S%-+mZ^(:/FEFJW
g#rD4o>P^r!m$:K>L=RRJ8TY(Xs<JeK6V"Sq8L6`79EZC5&s<Ag^%KS'OVu1K2utT2"(qBX=
skRS'3bYX431o6YX(1,@"WK(6%gCsG*)$iG0,ZMXA4'e\l/4rC.k)dU/SDh?]A4/bpDLLfYLO
gLZH3fe0El3B-ascb*M7/lY.^'GIgCT3<IA6S+:GM+o_.Runeoo=X[kD;g(5H\MelpKQW?Kk
pUK@\%\C*_CH[Zm?GV[9[O[,?]AA0MAd5Lptl`B0Ep`0?*eBHgG#u2*o=R/?*t!-M&[Y2[a)Y
C4*e428kL*a`.O]A0>)cG4W>5_LZ`R7*>RGr;)H%-+pauTO=)HpiTD_1%>U(P;L5!MtGW)9,I
EC>V,.26e[>5^S4?O&@*%Bbjhuln!Qb;E+FBbuo,HRsCVu<Ktltn':;d#.O-/&)YkVA@C#uA
DRR@O8EofOhV$gbD7qJ?@R\0-oAF=,j@LLlXLhe`CAX`jZl-c_=Dh+B'#EYR]AX7CPGt(51j6
qc9jDq*=Zpe]AQ[+"SYG4rC]Anr[*?9oT@FC=;pI&Vrf3.fMi%F+8,p^#\<1WUFS+LNl+aC!L]A
^iCN,.&+X6[BNP(.1")'kC?T51eFPq<<jb[utOV4r'GFZU-3=ORH!.(i%ZNtiVBlO!dM2DO^
mg`rt39tNQn_(+Z5)g-L2O6I9:!E&Js:&OTn>AZVR#>s=gST$P59kW.?.b-./I]A1/2Wk?DT?
a/;poFCQYhQcTO?=J-6Vdmcc!XJH"5D*=k8nc)uQKI.b3suR`JYl)39,HJ'9c."XE<($;o;f
.)a%d*YhqL5[oltNM3]Ajq&`j7VSj[@Q\-H//3M-O#]AL0Vg(Q,dn47nds5i?Stid'o"]AR^WQ`
AX,3%Bhs'*hs.jl<4pf,\.^uAhXR:sc0Ii?JU&R,9PjgM34#*5ctkf9\e+&kN%C$3!efb9.'
IEe7^Loj8LS!R6I;?Z%-7iQgFV6=6-4GKqIbOB)L.4)k_=Q':K_WTp0kQp[%M6Bdd$PO`9Ac
>,uJP#!@@I?qA"[;A]A*kRRq92n-Il3c4N2K\=1pZ8X`s%B^\`o#Oi>5\CYllp.MP<3'C>As<
f4P$%r/41.]Ah<7XlW?bE)f)K`8;L<s!V-]A@Xp=#YJgRsrP`B3A>i$`cNeC+gbYhP:onL:*b+
1i.ue"LTZJDh"o<0taGJ[+%R^Q]AO1[(7A=KW#-b9O&s5sY@iXtm`[nA,ta+l0P)]Ar[JJf+.2
THG>7R^N'u-#G;D;lRs_442B!ID:*u_7GAl_%S:hrO8%L*s*<G<A=X(CY]A&2V]AX#FlXs'N=H
#3=cdFphm!7sn+jKI[,@q&H"EX\ok*(9RX_`36Z,Y)+SVn;ZhNC651B51mHV^Jn+"@6-cukd
-A8WFXZH#eM$o'<`dM=00-g($s91ds;<;=1+m@rQV"bCuq%[m\2b3/Nnh`sd4BG_b.b^2LO4
_Bj@fl=HK@U6n74F!%R'X0Kt@JJE:FG7K*lM\0EKUH!&^\ie;7qOllZF:rD6dNjiXG2K/AMI
.'GmLDJ@uZ=MlOH'$>csLhoER;.d7uj<V3(4As#\W(]A#[4&J,0^3;b`cqROch@,T+AEg%pA^
aWtnh("sR`fV;O$;Pjm?5>$HXl=Sfo$FuAl@g<:cRPnmeFM4-u_l\IlROQ2/X545To0]A'um"
8IB5L!>ZhsVrq,L_>aFP;Z^<T%cO*7_gd!1E?D;+Ks*LJ<'cs%M*Y7aaCU]A`?`QhE&1:RR^7
_/<[C+rYY78!]A!X2)0%h&+L;oVHD>Zh`^+t=UgX_SWtFM=KGR;"%,u1TfsniofFYLCG!);>%
)]Ap,mE<Y6LO8U>2J]A_PLsaE@)f6Y7<B0+PA"!Og%jtVSZa'Ss7;!mbXeBN*3qN.8>ffIYmK5
T5r\eua,NI74-+3C)(/&UsLD-S&JZm8Pnk2k(rE?]A(%JSZ2T>[-<)`gU,rF@!mif="GI2)*[
-A5)tR\='32`?QVhB$.lE+h&FHT0@*2>nhP#tr5`?7(/FQ6Go%[hIq#>(MATq?(do34cbKe;
EU&!,i.PO19679k1TqKa%KA+fPO8p(mNo;"#=5F(k:aXQQ8VhHs0u;i[FC52k%3f\?LLNMh8
mq3U<sH80`V]AG436%-JPVO3rkgidWhBCat5#9&B>1#Jc2WM*lkZ'3tuSE'4Y3a#Xb>[D>!pb
\(9mrg0h6lK@/(/tg0n8*r;oFFM_?5DQHrT;LFJ]AuRbj*"s(1Gl--j`,=E*4B<RJqZk5OpLf
G75<<p7U7ntu-dDb&/YVA"5r.p,BDi6"$4fOT3^)#_OLftgVHC<uF%f0)*cjQkH(hH`NBb;t
@VV9&lZq.um@[,LLJR%q<C/KcRor1sAhn1ENc9_&i77)Bh-&a+^[BCi)R7BU&2l-_"^Jcci!
smRdCnZ=SRuq3E?$2k[kAB'C]A##KJfU9*9KXB`:ur;$=$+Yd4'-oY_]AuVPl_NgY?ZU#<D-4T
rAG\0X!N#0ERS'bZB_Q;0(Hn\sj5DdgSlC[`&Yi0127<omN^i8q#WH+<%B%pQ'_CKkP-_sQ0
GsOSSG>Z^#`jXRK^F%AEUa0iP\jYLp<#e1)pa3;]AJKq9pQA\%!%)[=50?fB4L-aOg\uWW6Tq
MY5B?g?6juVkZ[48fXZGI2`2lG9gDd(/,H(67-Unhok#f=Me#^iKO@N'@gMg`c`Kr*HKtYMi
V,+14EOrZ%hD'tnf(20$'eF2UK1KZ>X5kn0po[*38_lUVbua(,Y#Ds?0YTs)94,T\0F9?@30
fBU'f[9@(r&"YrcLK)1WtqhCAH7:imbeuYI2r.l$+A@iTS@]Alfb"NZW+mL'la(L^cd$[^7c:
[7\P0*$#1mo,2@B'>c[&da7g#:r"'Z*0lW2P?cP2S@F[ElIG,Mf.a?%A@JDg'DjaVs::>k3p
RReeOWdc7p,;Z<6^O]A*c)hR@c;:r-`I;Dg2M/L+A4k+X;"1IP*5ukD4;PXn6P#QpM`r3(>'S
dt8_[@.4dX[ND1.Kc=1E.ZeL(*:@EreQAa*\Enk!@T'7d@(SmqV(K7-]A5HQcbGC%Gor?@>HV
K.Eh8dR,?I@o2FW"U+a6JiM]Al]A"aGnX5rk=CnRGPqT^lALBG43>r0[@7n^7P3ND2R*-(VcVU
2)F6)Z#rPb4l'*SIb_;t_@SRf,M/H/7Y29d.fibM/#."a8:fqO&l9ZRhk8RdtpoV3/`"Ckra
nEF2kLi[=B&7Z]AtHe/!YK4M"X!*F1!b?u^m+UiSa@%rb!0$>&OHAai5K=JSbibah*SO30FL'
IP&^?O(4tTJH\d#uNd>PX6NKFC)#:OEiQI+M(u'\kh!UPC&)rA_pJK4.8r$-ReU(*(;aSd8O
c@h&?@32l+!p,2IJc/E]AeGW%H3]A,nHO6.,KfI?[pk%NtV9Yo3ui\$EnPShV5[nmJ`#9Wq;O6
*JLjZp7#'#Ojn.)>"g<N1SsdIcF.<I(T\)I*3rX1,#oTtau%u9qu%Lbes!c4Z#)/qrLe<2U_
iE2h0%[NoleNZ43*Q8ooRSPlB%Jh'eXT\dKA[;XC\D\rlL@_=Ot2HeSM+O+\[EPZ\>6#fhk$
')!:%lO9&/rDUK/U>l;22M(>=N]A>brAU\Yg04/)_$i:dC`B/+b4R2_SW@a>+#+Z>CUn@cNQF
\glR$"tbWK44HdR'L8s%.p-p49dDOOrJAuV]AG9lQ@3]AuR^PC#KbD+erF2<k`B6Qb/0RNRjTA
;5kL^BZS-@B8"N"L7Nj<Z6Lk_hqGF#P3ElPup9EMYTJB,I^?W4E1f*7TrEo&lgW@rf8e.^5V
MTJR,2p_@t8(@VpKdtJ']ACS4$pbp_m+^^>'G<73di:pPe]AiaD8AuD+B;toF0K:Oji"'NHu$O
KoPI_C3_?!)672P_oFraXO28,g1CCQ9POHR+"`WY65?]A+n=%+q'iYV_?YLkri6uY=?&jZhkt
jI+&]AgS[R5saQd3qP_dac<H1+sTP%pde1bt/YI9tYEEZ*X@%;KU0=Wnd;m#HG_WNtpG@/9M-
^kui[Sh=0hPmPOh22"#io2dh9HFn?-ouWTR(t.^`*McK5^:BW[Cm6%($YBBJ-H4IBBE3fAFe
3QOsOFg8QY1=/1_YPDqZ."fhL%^3o4d1J3,&?`KmThU$nSI/?,M:m0ab1htrj3YPXO\n\&%5
el@9ab#iF0Hkb!DMp7WVY&I[LpZ,TE!_,-7S2@"K;!;O&)]AB')RrhjkliTp]AhaT_<3I0Qcl!
(*j4Hkq-%rr]AONtm/X9o`qm1,OB44;>e-FG#d;bX=,*-KJEPCP3s>XO5d?GpVE:Cj]A,6:\gU
P<-_4gJ81,)>.7hhefOL35*G:ZYV4Nbr^Ir%7<J3E^8BZic_';eBYa>T'5Uopo%7g+Y?1hMT
ntt5H1;=K5)Cn+EZeFdIFQ_XBZC%;!RmJPKk+7R.tX+_?a:jA^9+^.k(k79&*O3kXNj_bg6[
u&eQZ6P/fpLf_bI%EZ<)-%CoRJubL'r&E)rE5W3?7sh/XIea<03`e;I&N<<GBr":0f%NN8qp
I@ZY/]A&=C/`4aX^EgG>P8PIIur7!V/VELC^$U9aNOZIi^M`P%a^,3o.='$Qi'J"r&4Gf)No7
(V;kPR,$,9&RH/mDF`QOYTmo^K_[]ADIYR6"@bG$O?:-_,pnQp5#2h?L_npLFOikR1`s0:*2B
=4P9^LYuDb<_$V<"5M>.[/=#>s_omDG2;Km7]A.+R!!O5LR."id8&J7>;88e^.8k5\d!!u1&&
4Hbb)QF>S8dFTD[&>AUOH(FpM+Ac]A8.?+9gU5V=*hWJh-[Y=Vo=jBJR(;\CbZs%n\J$FOf_\
*KcPf%]A67>L1JOs$L:4_<\lM)0u"sN0D9X65C;/iN\Q\]A`MaoXYjO!a"\;E/`5<9!4I"[Aqi
hWHTu-YtRM3>#uIX.if>oKNtDWd?W#"UDKrlMRr[+,UR!,+tit!,6@Lnpf<-C&pDZit:S4/2
Cdj8!)0NcL.u=:,,ta[s:Kn:Afk$rbl^;F/L^BP3*a'JgiqN-O)8OS14pKmgo\/FbVl7)Vs6
*jVQflNcS.#FT\J!a-$c)Ok!qS`5W-m:`KYZN\(hY]AVqJ(D+]Ar)i9-pjfZ]A:CD21jH1tUQ/4
6L^qH!/j0A9_q2AEqR6cQBKqPL.2TBs@[m,V$pT421:^D8#eW/Ro@CP%K$&q`[4moMhh48S_
M21f`4hd`_44XFHF`5LJQ1MkoXY'@'WP+h/O5dVle%I2-IrDaHo2B^D5S^FRm)(BfSi(RY0E
daB%[NPskeA%!(%0O*1WBl2`_Hlnog)JOWj($@bVac[[nA9#RI*T#"Xa==;<(,m3'rY=D8O8
TV9(pH14@K%hMOV[Tb#pkY-!]ALXP`]AhR_qJiSYJ*HfJ@%Mui_PEfYR*+N925cA/#n@E%5517
JHF7W.'V)pK_@,*dMf1%GV@L`UJN^]AJXC0`\R&IXDSh1_O-2uhS&^;-R#7^'l4qH)m7eE@W4
FDH=$K[o;(5@)6qNA>9/3TPP313.dNE'B#3e3b]AG>P_t*A[%*W[X_EbQ\'%\l1<fcjT,sT3'
#[rOW7B$SRMTZW&8rn:Moh,EgHsZ]Aq>$hsL()UW?ZDN[7<sVtK+"iMdHTjf,Z"cu4^.(Q%sK
j`nF&m[o%j!rm:3"=kQ;d5_t:Aj/Hob;2b@l]ARE2i3H/6;S\:<FIhS?3=AdAh']AGb42tI7R\
..?QWp9J97?CZ#IW_n0>BDIN@Lo4pnf"ND)H,MF"iR%-#(2;<_s`*-<k%Io9!6Ra]AJ%o(9Z`
S;IA:O)<`S>W#/k"*X('g=XRd(T6m[^&(68`]As[3t`FqY;=t]A3:.N1QFM$)$6?5!bq*CZ.mZ
5]A0@UeWMjg#'Ho6d?8F9o!OJ@/rmhLZt>X<7CI(Ra8=^0D=^6WPse$4+(I6^K)4'ls!B5C^s
^F77JU8mP?-Q`u*^`a+uY@:oW6k#E*T(<LO)0Nrg?bGM2SRk7eNLO`2#G3Uj(``B?;l1<A;W
%/8T8a=Qp9C(I/Q_\fi3/&V.BrE=WjU@I@1Z""+LIp7#LFB\)m&>8`8g6Xnm-hTQCs(D#rf_
b^=j8TC=hID&m!!DSkF\q72fP:,`6,1CV`c:?Pio0Tphr;K4?VTn#-i[Hajn`K@?)YWaI1ao
9D`tC_a6UA!M(a6:?.3okR+\RcqfGN%*_c'm8Zt!iE[Z`[WP<B1$*Z=W9pac..oig@<loOXq
_>Zj6:;_%_CaBb*_iRQ]A\\Gb@[QOB]ACVk^ENm2d0g@g3`m)`e:BXa_>ejK8n(g(DKs)cCIJR
5W1CY$,qEN&T>1(8P*;kttL66ff%La\.1D9$`%K%[jeN_UA7i:U((_h_^,PHI,#M5*60394@
>]AKVGo2KJ7D=c@>fI[!n9(YmFLNhNSXm8,i$+Z<49);TO-?X=LF7R+2_0V\jHn8nNaRXFcA0
/!eO/a9Y=2AKBVUNfMfrP:@OS11[Z$&#NS$47&4Sj).\2^nij#Hulb?\erp0V0%"MQPhogNN
L.omfb<T=kt\%=*Lf,cN`.Jjm+1I!S']ArD5NjUgbtjMNg'B=u'#k[ie(SKl=t!iVe,8([4JI
D^J_.?`rJF(EAgidoeMP:q_CZ]ACe`dq]A2uJJa!j\/-lXo?@PPWp.pFCZ=pE`.Zog<*9If#Z>
(4-M%#??a)X'o\F<<gEQ+:?"K!b+\6al&$FS,q>`eeJ+*#il1W)q,.MV$ThOM."b%PhW(s>"
E1A6B:;h>&%FT97rDh9nk[4':Tr[)*8p]AS(6;1di$+:HK7lTDi<\_*!OoEZKI%9n"Ujgo+L!
l(p$^a:*TW;*bhuc2WR1mPd1&(`taAMK6CVm%W2O(`]A;M4BAEq,S#lT[\.k-sLeZX"*7@?t2
%8Qr9SqC-[1"[N_H.X8Ofo+sPl%'[@k19q/,3n]A"\biSr(#-AJ)E'$acVp'$;>ZI2dAkoi-W
:I\fkLX>UHU8hmLmD#kXu0#AV^a[>S0$n<95BXN]AFH.c2t]AjPd).SYNn3q1]AQ[f&m_gW=m]A,
kWF6fna0RbKqE=!Ki!s4AH@*'pNM0Kffk=+DlUe$p&4d;Vi?$hm%aA]A2V]A=Jmq[l@=?KrHPQ
`ru[qLOE2uji$Zb`CF-mDUATL87Q&tfEY@ro!!*/[5FMdHG-ro2!l90`)WN%mWabh6pb\7eh
d4L5EjQm?^QoTi['V"I$Z1SP_4r)>I&Eo]A5t?Q"uTp,Li\\smA\[=lm"Q]A=2;<RXVQUM#4nj
%pDAgP>35f3Pa"Z?9/pQ++]AoNboXm_W>2Hhh%EgC8<<&!/$HX4toB0#/+[/QfT'W6!H6#&n_
6pt#(-E>HFt6Y-DkF),#ptnK%eM>ik?NkOQ[o07MSH]AD7fit.'7/"Rd;QpL</]AWrP'"AOHS2
N80gpCa8:gMKHdr6S7ip]A0^NfIR3qQf.gA`-f3c?P,7dAT,"G,*SgoFMSmA4)FPM5oKel4da
6^e7t=J%2:KB`t-7V$;hQ,9`dZ4A5/5B6d%B[cGdT$PRTX01O<fd`sFg$7U_SYL(4nmfUm+7
1-qVF\/iNot!cPaJ1irpWesCnuo^]A!YOhKD"Rorrp"=)`_\S1u)/`m]As<NG]AJ>0ei0'+>E(*
+QBciCYJK^G%,kD<W0&VZm8%sJ)q6f5e\$4(G=Nb/"hbl!cTCUrA"G6Vj@u,n;l^k)q>QAE9
(3W"oet5TT(1*%^W@33gI4YHC=?N6TV(@#e1iH7qf"+'j]AXta?^U2@\P\Lf[T%a]A(M3T/`I>
crq:QiGV<TF]AAtnPRQ[3@>@ldGE_gHa#*j":Cbi46K=QSU:4-f`sV[5%:DWHK+E58(cc@J:a
:Hou\+aN.8-A*1SFjE2cIr7=^pu,g-D[N<>A"g)JcM-#tKc`)Ap3uKN(M.(+d4urK<u-+`Gi
p)JL^s&`MK.BbB:?dT^3N%sGQU5NddQ$tK#kcR]AbXS@DQdk'FG.GLCJhY<:D;jqIE^sYqsJk
a>rbds9T,haN4.tJGV4BfrTWh\65dr,.H-H%91c7cm&+/m;>@`Go!fVi3DS+-iY;NPkL@WI(
&:cG4sltA!^U0bcc&5qoLA"?(PZup*Orgh=^Kafpf9Ok*^AX_FgZ6?0*tH`QnulI7knfM4X`
Ah@3q-nJdM/`"RTiq9Mfjj&u#Y(3A'P=:gQWs*3I`n,qDgK3&nP7gQOh_l-4R1RgcC?kdn2R
LMe@ijh2V-^7c-7lBJkt>@R7c_!5SQ=0N4`X\LL>Op]Ar&N!kbOI@\hd,Ue=rg^YQ5S;C&,n/
SKF^.ko^en$IlOT&M2O.FANZi(-$Y[HSaDuA+>g:4#^=M64h\$lL,r`\m#1D70&dMP`nko==
1q5oF)nT<Sf?fjH=b8a'39X&m(;7lrn'd"f&HO#iQehJmh_d-.b--Ga`:(M[6W1t9gQcm0+f
$:oFXD]Aud_2l)nYNO(#)p$pFb^[&(Pe-f:,pM,mF6OE'Nc=X(35%88XNDc.kRi6i9)?YW0O=
2H4\%EW%]A7PKK-lW9Q[/0a9Z&t^C<7q1=&=E8[*W0hE$>V(/(K]A'^rOtcZs<nWZ<hSt+uDkD
Li)3PKInp!@WQJ$:)Y7dMVs($89bk/(oJij#X2Wc5lGW9p7[O%H&X-O`3!YH5g(oL=EttV?L
B_%b<5aAnR8*kM3#>RS,;S&#e%Y?X;-^tIrY8+KMIQ9cn<;'IElQr'%Uar."%Vp^9J5&bQ<Y
`&0P#%F5/,1!-6Kp[o,^)5EuXkYqhQuX6ZgLf`dZ6`&*R6G/Aa1O%`%+@EThC#VGcTDhGEjH
dGZ>cp$7V?/MI[adZA+TGp/Q`r1g\]A)>?(HKH7\X\Dfr!FE7`@;d,!ODhHtKm`G4G/-q#:lC
9qW.:HPYEB"J%LXDX`YHBoikKLlX9AHojSa'8I#M*!#-b/OoTUlIl1@)c/=U`qOW=ts_F(ts
HIjIMYO-Hp"*^<KP89:8O-=Tu`OU>J_[\iJk4t5#qtgQ^Xgh)uBSCAKTp+[>_bXP3TV6E6f(
U,+BEg+?<!VnD_7oWIA1.c$0d@$XRt`Tehb9%)3q@:LB.!qklJ:/dr[XT<Y+>n+#[tN%39#`
WqT6Y2GC9joBUXTL:MOj90=uL%jHFT$7`VHTDfu.g@;F!VZ4l>qq+js3MLKITSFWWUQSQU+M
ILp;%p#18El)bR.^ls`E?D[GZ-Q%Hi"p2siuqj,aIX8ZfSK.Xrn$Ll/u1hhiUunXN-ua>r6M
ot-D@%`?A5'Hj;A`Ve/2(T>/;!"G<2sK[lWQH@OsN^[l63tATW!VW1Kn)E/?m`61)8W2r>W^
>1=)&n\TKm5eK(S".F&f3$g8@*u',Sa@Cf?.^)]A1QdB]A*mlKlWN@qn/i>PkB[3=Nbl6cF5::
@Ii3aJM1!^7C@<&!E_=fe=)qFC3\*5)5C@t>gB#h#Rf3n^bVm>L/NLVQHO2\u>P2?`=I^?oi
KrDZ=%#u!;PrS/_IV>fE<3C/apTS)2N0&"9n7MFL72,?bX95=h(@[(=hoZq`P7unG@47dKa0
=e\"4uI9-HP["bfeRHF^O1cb]Aq;2Ko_)8sG-h.gfRoDeVl]ASZj^>KU'r=EU^5kgI$E:5ngWB
0<@n+Z+]AA^UN0i_^pJ(U14rr004:F_D-+A=Z-I\V%aoKRWs57H@smSAkXrn"2&qpU$nm^:!J
HMip7IoeWgr*M+fdZ=EX`qd;;4G4o,LR#=rk]A4DS@E1W/EU#DL=NGUnq&nsB0j1S;Co0EiDD
[2lX1\K<;SFKrJ5?X>F\M@ORk:[Ws%=2C-OU_n-<"BhkGgElQ@?e18]A*(>B3fltBIg##N`uP
m2'+!Norbf3Nh?'s,V<$;n0X31`Phtlju9?,'\=ef*tF,u6>m9iVaj:T8-_?&#e4:`_;*k%g
=5cYL4"t%Q16J$Z#<C5K^%FTr/AP;<&iubpcp<oXrB:;P$ccbh'JP%6f;ms9"4'B3]ALT575q
@0DO?(u%HOm&M^B_FD1&m[<#<Fmg?rHGNUtd\]AH+c6e:;04JQc[q_oh2J/$pH\g08"@B]A^4N
33\./l<'B=\5rc>(0IsApbZ%Uah=&H?jX9^L=[EBPOf;Q>eqaqS8O%2n?C/NGE"rC(Y>s]A]At
Hh@WVKYs23I:pF2+)1\C?@h=Xd`UB)OBS!]AA8f?>6?<.Z"i,i"uuL8_=22]ALpUi^T%`cWGM'
6C<T$T#@R?I!(s@\D]A>OiA<3n-5\Qq>C$T<Q:GFq"m+<&."%pd6/q!3\_sm4fVY+2H<<DWk[
N[fW]A:fa.\LrXaXj.d$?;Bql!`+FJ:+RP=n3ko(;TF6';c1JH&Z+r08ekOp?^qWP"W"F6XO:
Uu##n@aKGaaeeGWr<]A:Z,'M0*t9d-Z*n!0]AM+"P/Y&Db#2-3*uENTiC3N4Gnd%>WMK9]A_kLF
-`Tn=iqST2b8`R,]AHF:<5Aj-!D]AhGN"KNJW[,g"(BoQn[g"i6K6KRW+70+%>c6T.If,GYAJ7
Znf4Mg%+p#l"Zhu>0B'q>HM(r4\fP6b`j70pc^Kkib'VV5Rf%-+0T>+'qGmBtbuDqApi?`YS
sE]ALIMpX(N.hC/:G"tUup).cPIk%lE#!n,558O@u3]A!G`4-WN\c4NM:<lud<7HkRTGm4YG@a
Tmu*Dn047IY00sfYq.lmc3=3O>l\G^@1ig+Rf#ucVt$.&`!Vd>YNHgJ7,_,]AfV3(_#Ys7oI1
#ZM_ZBg30#e+.@7E&Rd^hA+cXY<4*W8b_KPfR/!@CJl)*aaA\bGp(`Fr(V6ZTfp0GAbNoF=W
@"Nce$U2/@ZTi5opmmu-dE%N?p2`3RAq((qT@O7*G<-FK/LDhM%b@WNHXCXt4o?LdH.Il=UG
JM'.O^YepX*V8naUo6,K97Y`\HiVIlZR@<h=YAHq$0(B>NL=$s4%lXe*(Ti!ZNeY688-9L`<
.ik$M5=]Ar_.D5dZK4GR^fq8:<q-/a3$9iBqO3O(2G*S&PmiM)H%(NF;Q'_cUnV]A`W3$ae]A&M
)!/&<BsfaA5GlDI=@bCT/RJ,GU5RPJLo:m%q?FJEuQXp="^;MF#i-t[RCgV@H"8fZS1nQ!,B
5*IU4Pc+8d714opPe";S+3$.G-N'#f=IZK9Km]At#`hA3TQIF6T&bgK;-a5uT/=9AV1rpHP;F
F%`,&+A7WF+ON0j#7@+CAC"m==S?/EdS<5uaUZ<t!9>"1_:u.;WoAW[-m7u=io:l-lU1q3!:
L$YoKfI&UgugDd@SmQ4a308V]AqbQfbkB0r)n=Dc;_),NVnM/YbSU,9j*r7!q1#ADSO8,90:k
XYf(]ArV5:`@gImdVN9&?G)K52M*DY^1rPS]Aq$)V'i]A-FL$66s;8L#J?<#*`bOdGOjsl:lR+Q
_%j([&C5O7!%hb&h-?.r"ZS9b_Z=[s,NA%$5Quk6l)X:LT5b>+@!GAXs\nC!%s5te2bl/ikA
i!di,`Ues=+<2f;rarQ9AG3,Z-+bk#5i!o-&4B9]An9RbU?dpIkE&hOV?7C;bNTWn`T;LC`/I
?QQB,D;Z:/nX/,Be*.:);4o[R1WWe,(WCT"dV6h:]Ap@uB\'!9?#*".GWFZYh[]AjsX)FIfp#U
@M%T6oL6RZ&q9)#`aP5VjINIhYt32GA_kDQ&(YV2%l^(@`rQ_iJ_e5JF.>kiP+B8Og$K@P**
/*T/3r'Z70kQ9X&,:F^Ihll(lXmdN:oMa=^''PspCXnPfoJfT;!&JJFY2!"u-l#lJbkP"_Dr
tQDk!pbR]AmKc#1or59Kho6/N^TO>X>X_7=,5?A]A4a&OVPcdI2a*4D#\qa)FmLkJh>C=6nj*,
p-E0Hh4+D[)do\2F<?US3p]A"\#l815F#n%;9Udj-3#>=A%`iVlHbOTV5hXA%CTKPI29;:j)=
D#6*Z'#0sCIf`uYc-tmO['7$cn9mu[qFA6T&8RGeU#.LiN<i;^5qKMZdLDo0j73^a/mWcZ9t
ElA!.g#r!6[S#-(D[$aLP#J7P9-WH@&Ei+',CHkh8csIF(@_U<iQmY'Q/"MZH1q4ub4q?BQ0
;7&/mAiJ:R/VfAkN]A]A1Ks]A8,`Vn"`%&,7/K2:_LH=)0`oNA2NZZ1F%$[@f-[e70eESiR!5Gc
A2BIBkL#e%J;?G("u'F;Lud)g1Fbo"Q>m5Ik&,c#m9[=oE]A@+IAL&1AULNGn;&h+#BI)5c1R
FBE+MGk-C';9-0l"M[\<5"EeK-U:m\DbQY$568`*'"\j&J,mb?ZG=6#572mc-uY%+s:Oug4Z
V"lA6&B;.VgV"uTji]AQ[b+k^?Wbj=J1AN@f@.+H([ca[k8F&4eF'?)_Ie4f-+)\G1b&SQN\e
T[MhXQk`!Flf>)VAC;4<Y8<s#T*d?\an#H>f:4$aWUQh+c]ANEs5s/%L60qb4P#g]AOQ44.'Vq
4l$&$ZgKTZJk^)fXfi7r$D0KbT>Bn-o@kGpmcKLQ:og[$lYjo':3.gV]A$@`!4p7[3Th$/r[!
:/jR#+(`[re`EOnNLfop[*0r.ROCLhB%$VKcX;m2@NDYmbTO_L.-U_^CG#EUsRogmuEh0DT6
&-ob<%$E(F)16<G"<hSc3';F7r0FLIXIV.6)N,5D#C-4E]AN2PX\1q1eX$#.2bMl/+%+K1Rk3
qgM34?'?4!lcthcRE:Kn&nAps0LsTjc-5D9MMA_/9mkaaZ1J.I%W<%K,;p;5nN2-&5a1ZX`R
J-3%p9Q!14$Z_I^nO(O-OS($Nb$"27i]A:S,E6Do51:KkFaqcI_D]Aa^,8D'.%$m9E,A.Nbfe.
VkKZO6hH?tdql&UOSWin6,Bcp2*-mYSVU7Z4dU7(gM^8N2hl88RQ76hB?"A"8"Ca#mX&>TC(
G/Ljo<KMGm7!Aj97d\&Zm3,7lte^1Tbg)qKYeDNr%W9UV;cX82Qr/MgIqh)CaV/im*bON4fE
26TI>tH>ADD]A1JWtPe(u)l#!ca2MMc9@#S$e'DIkb5JJOkE=?,-rCh"c8Rr5W$n@D@9]A7`Oq
Z?VG7_b@q8)lpkMNs#s-H?ZfD]AYu:'[+E$(Nc/D6AO!qa@3EgE>^rZaq=%"02TOE-m0Yqc6h
=99=m3r=0uM(tb8S6+R&]Ad&4WcG%285b_C&oMa^L[ssXSTqt4iKXEIpc!>#M`m3e5$d$f\h"
)rO,HNA5>8,jOe-*ouXtJPZBR=Xa9`Y5SH)"YAZg4/pGO-c!Y(+;]ABJeV6?jqA8a>NhC\M1"
4CbJDuW"hFX+9BpSKM+RK2P;4OI\SF:S5YHZir_%a0dQfB35n1sGC/%QI_95%gb^.JWQ2!H1
^jp\NQVj$DP:nNJ-`]AJkM]An_A$'_h7!JVsDP3bl<1(lMlbl_,i`EogDR$/GGR.'CTogr`j^m
8ZVaiE^#lVK5VHo-%?%j3GiOq)*KoFo]ASU`S_U7>Y&SF>KZ66Gr?TUad#iNaX'r(KdB[SF3B
tm%B1W&#qeeL#-nYrTEFc-@MfSXuW?=]A0T`=<dBg1+5WgHir&c`/4A@?(l2kq[tS66\]Ak9'^
o2_,IoC\k!qWHegM2FbM0X@<NAl1FXbf+ud,6TG3NrK?]A9c#D9s./#6t]A@O,K)81/J.+l_iq
cfE]A^66[Q_:'B$pK`jcLV]A.[\VY9mNXJ2X5=jQe1!9PhDuUqCFG_pLRHd%a^Mp/(/k&MbZHb
+c=@(c>lds3QiF;+c'r4b'"@4a639=!j<XgE<j$Rb&b]A0)j6K*6&ncEUWKf8TjT#G45"P&He
F&m,V4)`2Fp\reUMC7>-WujtQ4[[K^..lauiZ=!JWp"U^9g]AQ@.k`Gp!e37Y:[8`Ynj*i$f\
nf%rP%;gpRjUNaD"iAIOcncVRQDN&:`*=ah#"QWcJ>A`R*lh>8D/&o#[C4:47+9\cr"O#5V*
9h0EoBiPNV^-YfU*TIdD3,X86))VZ+BA/]AD`42fFu@$!.S'+08RA5VQ2+L^0=4>$b;9#%@`s
#h%(RVAOhR"R0J1E912^pNHZ5`"Or%/Yc,r\R:j,Q`9dlKn2h0b0^U'``q=SOZ(*]AmMj#kKX
kfYI;PM&8@%oCBtRDA?d+hZK=u%0[s+dG&dAI#fur>q#-21k6AJFKXB&gW-mY^]ARimtDIs&L
He5DI&=TVN5JY05_'/4qY36Hn!*<BiD+EA!nI'GRX%]AMd[NK=SMc?W&>`&TU$%rhfjL6P8^0
.P]AMreQ=\Oi1t$L$;d;t7=KCZUs0b%RKCa&)#_fUlQV;1j03F2>HG_8JE&gS$p%'B:7P-bWP
RCXc*Z(1,rpi5*-5ABQ'`$4mYiH]AgDe3T8ZNjLrU+>,\-1Ono]AsNhf"5/d'.\4aM]A*Vl*;JF
9*/eq\)YN2<TWP&[DnA%6'.R$NY-Y&!uRdKo0^?=WAJnHZnb.mGItkDSO-X^*Q>/&JFAt3Sb
"giPE\:'It&ZNl".=1/#L)j86#B-AX&U-bo8\Ds?H('bVK0au[m(:R0UhIPsbKC+GS.1[$l8
%)3]ALf_Wp,F_!cN69aPq3(cBJNCc!:^qT38>0oc6J#"EYORg!C7O'"SmYeGp94NUTgeCfMi5
="d%]Ai4eO"@SgZqbum!:&57N,Tp%R%SHQMa>nQH?+?S1O[i:'?o25:9Bpk]A,CS;d/puP`9_&
-44scSf$>"up5iuEh-5-"P<Z4-&#S2`k!I^L7AsGcA.D88f7[KDn><kDBqTkA!OcfG(@.2lE
(9j(dir>"\PS=#B<`5GcnGR>P%#=]A]AI0(W^jHL$If2K'AJ7`em*YS%apZks8aK%Ni'a^YWV7
$/39,b$f%!CJm:89n6'6hJk*Z$A[5R;>_AGoJNA`,[`'ZXrMF.jGm[LPFVR8WI9fXAh'7:g[
mHUou=kn:a9PKt4<L+J1F2aq**e'+M\gPT/b25Wup02a)C%c5PJ^7%[kG$Mdj70Gs]A+FH&D-
qA>a9+j^[+7N*oKl-('"NcG5![lk6fT<n"tBF0JCN?+M/KQXTQGk(4.XZ34mQdG[urej^=a<
SI10!8`EGSMo&H/9QIq8qY<4$1pQ]A#erWLVsfZ:[nIKrFhk<0j#BCfV"2/\@T.[R^(9eIb3d
AJD#2\a&:be<hD<s!/>^=*DK:CQ7X%#JK;jdNT2Dk>JUJga``.s<3NA%KV.=DW8PQ3WPu%HI
Ka]AIjr5i]A(K.h(+sV(3+MTo=Cft>[?=LI$g<Vq812HgjV0Sm7u,s"X93%orTRoZRlqVOD%Oi
\B;U[]APbeOCV[KFbJ+BqZ!E3-kF*IkgD;[ia<(`dU;L>0BqnE#.5fJ1=P^EE$;\+gkgoV[6H
Ki^D]A4C(l/hDkO+eK/,[FWfFX#n[5%fMG-7i:Tf*l^nk-K$M@&h-b+)$2+DO6V.=O2!OqQ/@
<9^Z)=YN`rsSYrX-SV+s9k(:,Am[lk3JDp7kp90ZAEV4d3Q$-k0+1%=&-I.MaO:I.7^11k'd
sO\3/o@sYbLA&Jki]A(r3!.E.oI4U^/l'#6Qp2II)RqhJ>]Ai,d,$&Z*;Q^2sDf8g\-F'Al$6a
d/.Y=n$qU^8j">'@\mMFTk83r.7ktn&iBTb_f5.+,:Ml`mMX>CX5^#68ha",UZisDQ3l1iuK
%shgZi%il%/Zp@fYX2WOgoE=S>\rTon,fFS9HU8*GhPPM3`O+":4`!Mp669[hn#lf44Ye!<k
F/F8sOjKW/!Z>N_cGc^),k2&=96#]ABipUK!pRKf/EZ.g/2]Aq-t81=^O=&$WZPm/pV),>)*Bo
<A@@pT8s%cV*E)@CpXOWa"F/K/,V02E1n]A(8+:r'^hfC3H!=ek*)'b+a*$g:<dL:$D@Ci@5K
%*X,cFbj?IDLm.\FkbP_Rk]A6,3YnkOVN2pX?X#4\c*)9XO-i,p#f^'QV;_VH8G7Y#M-0i?0H
g)8GZ#^bIuShB?BBVi5B9uRA`KFMaHQ0XkEj]A5.<+R!7N8T>(cWtn)IC6%%,W%pd*(e!libn
)(CL>F.gP/S$K]AfNQn,Wa`j17'`?DP7CqVb^p/-uBTeXHgB4)dGEK'.jQo80PdJKsRBXD!)e
G,iZa(MtX2'O+9lmIJq9a![j1Z[52N+1)Vd0V<[@1&O9ZO&!^3TZZo/1`f2b&j\E$f6,"`W?
58XD,Kkb=SfjN&We[@%GNol,-$H2U?p)nYMoG,WTFe3u/2P)s_sRSJo?BRXUmik(gJ/HR'\*
c(?`I>tDU^Q5N(K(MC4i=[Hq"rj>eij?(`=l9';iP;mrmun",,N$[ZqR2Ut2*ig4me1E3U]A=
#W[\6h?FRNaW)niqP3a*5A.C&`_k%-4Jg;&URj;E8@)SWJ.,=m&,&8^V>$/Q6WA9,[6@?aiH
c$?DHaP,ioJQ70PHR&'$i*Y`^UH:*c92i.MqKNp/0;7n3m`'k$K7+5s\Y!8E4@W+W85p4meU
GQh1FRQAb)?$/F1FXoW&[(cn?\OQMBHH76p`33[m<9]A(E!<WT<#"CM^-T9LHAt;^&ip63R`O
M)k$g4hGKmi6:IrRh,5*_F"K0"UY/FiZG5*lnE0O8.H^rT^FZn;%fWSU@$l.FgJ#2MX$N5Nb
*LWhPhtI`nD'MBpPYq/Ta]A+WYK[B($8u(9+[`_j+BQ!*/T#(3)eLn6r-!03'BrOkl-Cn;k"g
ok'KbIhP]As:1,Olq)+q>2PPlk6P>_m.n6",bAL+e0Q7='%.=rgS*#bPGI4=.smpV.[*;W1NU
V?Rm:A&[SVZ^P]A7aH9ok:$Y9VI)P)?>i.!`gj*VbV%JDlW=H)1dd"#>d*/&[@LSd8_NmRg??
5S9M!a>@r^+9Rjall]AIEj#aHbJXDPY5;Dd_'7sd8<&N8961i7`kh]An!(:nCW*0SpI_>i-*?U
#6.+_s@+-@V5=CNceCP!]AMX\qP:G^j[X4o<5?X`I>%<d6eTp:O+'GVT7>JLX4@GT-@5t*M>5
GFK)4tsZlp@=;0bcS$0N)RP?.Xgi:h1Xd6(d@jHV^>XK"paN"4MmE)U@hI_[tU`24W;gFnZe
<ONL%[l\\6nULQJG6AD]Ao!^BqWFea!_Fl_1Z*NX\Hcp=]AF(mcs_b;AHr(_Rpgu&*q[/>Gs:B
!,[,BgVes8^Y>e^lFN%hc`^O%U%@)[M0qiEm-A/P)^VN4H8(h92X"ighFg#fD[nI8X[(+=h\
F^q4p18?6+hHrSu0BUoj,?1X8#t^&(X7]A*&@9^m^%B(;O+jclAm4qqY1ihT<X[)jgcnn`di2
$9.p4K3\h",^U$P0kUWT8aK<U;hT$rZ^UTZEG;1FWUR%M"I<9Y%gh62?6W3uKZ3"XCnSBpkb
E3*ZnR@@A.dmR7EVOdB;C_$O-.\ps%bt`2A5PWJ>Pl,6*l@+V4r=(bD:Oj-3[4lBf_Qo-U^a
Z%njR]Aki.]A'";/0@5D+9!1-?\oZdl"3QgW1Cb%@9k;mFFVI>GFJi\D#InTPMDX111]A(),I#$
Wg7H1Nc`FiH<#!-i#rEma]AEUIHBXO96c?OIY3D;6gF<uOedh_bK!#,+-EG:H"i"0&dMW"3!u
D5HEDaLHJ-Xn$GW@oX,r;l#h>#h?.q,2lLB?-0)6*<L.XE.;E$?.#QIo/^S7C0iPatYOlV=I
P+!sWWkEi@VGMRGIMkD8sq-6+3D[[np7aA4Jj?+pZZJm3[[MeFt_6Z8qAt<HqT?_4DAm<NLl
3JW5k,Pf7NUFqQ>.9i]AFldqRfN0]AU##qPY1^WIC%60@QpQ1@p*D9'1ChAN;ZN9:h@r"j\`$N
@$59"V$,U)Eah"\DWA)X=2HcW^T4q3-JX,#WcQI>AF7YEi"/(b0>h'/-t1Q-O>M7f-\MSD\c
On]A@2<(a>u#AZ*/E9m?UP?+5Vn91Y77s93[g'j6YDW@C(bGi4^Z&WUX_J.nQ,66IL'e!\`PC
t6'YJr4\q'_s8]AqcaC+hq&BD"!l,Cf^S7HJ:cYj:[2oh;H^k%g7k4#-]A%J1+[=+Ak7X4#GZu
`)"Cgm[G]Ap,C?F$cA@nnD"H0_@h`th!"4e&hp$-p/_k7n1ArUsRBJ#fSb8P#G:mS0SDbjU`'
cMgSE%mjCX^uk#+o$2[?RpM1G0oCfEb'DT9c:'U,f]AmK]AJ=6\^bI5An_Q2p!61>Hb3`/#EW!
+/mLV=C99r=igqYn+MfQqWe8\CS>E?NLF;eK;=LN_ug-UPib@QD$hnH134e9:(ZFshr<WZ4h
.;AFX):X:R2"@*e`lIm&8@WtYn'ID4M6-5-GpG!@cF(RE]A$GF[HR0XB'dN_'!71I,35YC.<p
#M#H+:r8:bV`Cl8?uNjMTnZe6:i@GViju%^V++\Y3]AT^5ZPM(Q_!JXt7&a]A.kOc\r6U1[j(B
([M^Wr'-!bc5L??>0$GH%lAB_J3j#H,,5k&$1Q6O.9Xi89TrGEKeb%i10i@]ACfhRf4oT,Z`Q
`2k'8EoGDaab"i(XJUQcNq6+ftBNJah_V.UE<s:g0*fGG$,tmUBkD/FOd:k473U5dJgt9XP;
QOPrmk;H&hKF9MG68:D2BV-ag*b+)*[Cbl$+Yf7M#nfaCHLqN&_+o-W,PSFo)=BBZ?#[5c\P
EWY&;-iCWLe>@2=gO)JJ)-6&.g>:[[dTF._4P%lP/d,o,c=`Jkm%@/Vb7ag>OtPdnF+`.-:,
UK1XeiT$ncJ6^rb3a]AcJ#ArAH!BbQb"QET(R<MbHF0BkT%)+cEkU:/%VJUOe`+D:^R(eqrLO
@%[ft2BrL/N2g5T,(de4<aCUXuM8GE:->YW%ib*R[^Uq)oMQOhJSON[uAE#TY_UFH[PWa^dF
IcLBAPIkcV\?ug__a.35-0eF`T*OY&ZXXBFK>$$'c\9>;91f"s4@_B#A$Goerh818ffsQe<L
j`@j_DuMf_ql'@&*snaUOso7Po!DYZd4)KmLLk';rWG[2$:e=*"OOR/kPnfBm3NX821aV/TL
9DEdn3R+Vk2Z+d\Xn06tY-/-.K7kJUq-fcgq)23@(/'O,2af(@\LKZ>R+_jb@uQuP<?;QXa-
FXT_QnL&,#i9JhW:*0rHcR(-L]A2%l.UW1-LR@`]A-eE',XdQHB6iu7(l=XaLcOnm-,-REP7*F
I7-D)c_k1tK).9qDUZ28=J;USlU[e\B;id<nFOl'[.2]A8u2[6`c3m2/GJ,ZsP?@aGFXOO,4S
0K1)*3<#uW[n6&O_j^;+HQCFH3e3:j,:>qDPu@?gUtZ'BEqddWS[VA@aYIoQ]A0RPMZ8(R:)0
;D5t3bDUrtHhJ3bH<.gf+8eJ(oa"(_ln?@OD0iiU59`'9t$/HpauoObrVj[iXo`iam8&iTM<
5G('+a;R"U%QGacV$ET&IgMUS4bRD^[j0?s05$OVZ9j"ef,m^(eYib*eJ@8M%Lc+=r"%tb*X
'8n!Oo9F25MrQ:k5Uk5=]A2A,%k`YPr'u(S4Q%U]A]A?Vm!uZ.<E^Hh\<ccHmZSQp5Ak;h23t03
lor74HQO]An$O"5A##:?D%)72"s\3,`o"%D"s;XB/X\J(u"TmD&g@![?l87=m*WDab2\IL#QL
Kf9e1s9_*!!P(+Fk"t(M'7sC23c3:=9&rj[r396=FX?j#b"`(fA5WiYaA4_0JmTABpNOs-\+
-$oV?Z^J-\`fP.IA>9q&!,=5#m<<YlMhrBUiY%,lS(SE>NU%*>u@lpg,j8#C5eVNLWXYY%$q
\As4*.&l]A$W+ZW^^Up03L9"^FFZ8CO/aIiL7Zc1*S]AmUJAM9)i,YV+r/hkb%`M[Q9eW@sfjV
4QGFn)fE-<,TgaLG3F`SpK3@&&K=p-<NHJe4\@s/ro;>6#K]AqiYp5/(NXZ7+d$)OkK5>-j$E
5h[b9an:NhuVCu%b)fZ$H1S"lYLp#GqnaSV]AP#*Wo]AYYmA*iB:jj/i2XLW<9U0>I2jRRQYUc
Qk"uBhkN3#>S8Tl7j.bV#,tt:8AO94.GaOpH$9BD0O_cmb^b^RB]A6$I\\Y:-[%_V]A#%,/941
d5_DR0(Oo$B^J>")5r[TSTdZVs+lBNmo2l>d.I4o4"`M_U,WhjsM%jQ7MF,ApNoi>*kV_\gd
Wo4MRm$lf^*%465B^F^B$(8p3X7$D<'Ba@R7RBm_o\Pqp`0Q?_O)4MR<Z!8dMGdq*ZI5*4G,
4Qo0'YeaU\&ofm:Y9Ooc;q_+31tMrD-:6]An)_'IK'Js_)Dsi%Qqn2%Xt1hSa_.RRG#WiYgoj
OlsRrm+,T>H/%NrV!qamq$_j0HPKRJ&*h=QROu[D!Q9KCfE[%sER!LOX%cW;*%VeF;FVdQ+P
13/XA#7KDVq#UfHtsPE=S@(/Wc>T!?5UjERk>,L>]A"Hj/%la9Rj25noiRe*)7'E8-tP5GbVn
pkgccbJq::G9e_9O=^'(Z(h;#Bi0734iGV]A[L?=;u&A2efZXC9?2%uKTCK=Emh'Zcn^e_?)L
05*d]A]A;MjY9u6/,.THtr`LO'qVK;sen)*kc<:50Fe5:3+Pi%cR<?oL_RCT(g$>SfF\J?M]ADo
HsDYCCPeD0\X<^0Xc[?K*;=WZ!dA4I[^k36#;+E.-<6U;!+HTi_N4Za`"C-&!L)s!537e_aY
IGfF?"Ri'.tWG.jZ-\:A7Fe`g:*is8DiJds%.V.HZ-UFoslDu"`8;q=N()sd4n1&UYo,*WJI
2C%-o3(3igcX%M`'t*mV;CF,g[-O#C`o1U&R@TKZt7<[XdXg9m.M!OHb6Q!V:[1(aGX<[m7m
"omN\kX(q8IX4a4#C1><a.isU4rS'EC_Q%M-jGX=ZB`<R,f"2i8ZZ\:VXp(M83hd=>3P:T,q
%D*eB<CIo-pr'T?:&[@<+.hltrfZm*q>\^gL]A@73Oq8."']ANI<Kc"[i.TRQ9iY]A*OoM6Et1K
]AD&S4O'u;HbJsW_bJ\>gVL$FGjck1Jb/EgLb"oQf-Y.'1L"9gRs[5Y,_9S8j7qG`j3jtj1qs
$r=5YF3#A1,q\"mNRp!^Q#O>Wc'qmL%bL#o(#2TTe3RiZc1WOZ6*9k,bL109a4"RoqXBjr(7
=jsp@QA-Cq0Z*U_QNGop:'[f4HW>ADr)AcN27ZBN+O='9;kRAN34Ve,'D$gcnE4/Ghb%mQH<
+3/(f+saIqR-Q8ZHq5Z)*1H3NATD!SSYi@ORP`CR.gHAUdEG2/`_LtbTW8PAT>s,'28`V:af
EL^*HCB$lK,3-=n[DO:e*UBW6(TC%#@pBtbH[CU"[J--Ep1*m8>FGXD5"G.b!)-\75e4bBdJ
Ym:,j[XB;$hk@Y.d?IbD#OEX"UlnO?I^!3*40$;*=B(bQ%7li5^PtpWhSDFY]A'H:WQfe/bu_
#E<tp-N^uA7_Y/gGRf-5/k_n0X&;BcM&b8'S\ij@;VJm?_q"jZRSV*D1fG"_T/ZEgQLo>F0[
H>7KWEVOP]AZYZ%IDl=\!ahQcOIN>9fB-ZAlo0=1\Z^.S)W'*V\r,fC<bf;85Fs*.VK>Woo0C
G'bJEF\3OW-)bunD!ZSaS'Z#es<qas*=m;Q8SB0SEH\EN&j?k1@r=#j[$co8$]Ai;A"=c'EUa
?%85dd.I!\$ilI=)F>JqDqa`42V"f=:TSSJ>Q#,r1*+eZ53H,X1)i,N/MI?s9ogF"<DmUML^
@%mOs7k_/?@UMdt5'QHe*\<]AR@QGmpVuposmOdcd]AF]A0OUH('.HhOXFgY1c#dO&41OO>F)N$
F\#18ccTb:)=6pVaceY^ZIQQh/phXcjjUh+(("bGU[iHD)I7#,m!O*sfrL4r<\q)3dkq-(8e
nNC.Yg#9A(,[KHF%f&1+b-.\VenX8mRs,$jp+Im\)=CF.Cq?(VKbao=bdrD5P5Oa\;KZ;B,X
Q"/\LmZ>jWPHm,@h79PHe?bg/]A$*n-53I!+IN)XPO<bF[jM"0VR=[aiPXp]A\]A4g_"&(;sSPm
B)tlEIU>TMT-8r5rkj1cn4IKSXJ)crjpOl#lmjaql_bZu`[fOLB%Mk\&fRMgf;XLGPW49Dpf
.h>7k^Q,4bmBL#1$O*p45EZo2LZEFC'@SPpK*:6:W2=qB["7Ue'IER\u,PA^aTN>?j&4q<0E
u[XOFSNA.hANRVL`\E)1ZP)EaU?`3%m[H,VNpXp`\;IKdgTMQe8iVHh.s*pZGKrH*uMO/,2p
.H>g[-D7;j?'a0]APgB"@I21j5`C%GcJeXueC6G?l]A5:M=`P96OK/Y`99nq/CgWfVK@8_kDWB
5/&K)i&@1Y5<%?#2R9#A9Pq_^plH(Y\3C"]AMlW3=qnqFSaAiG^:bB>8ElkjFqn).-j4pZ4E<
?"Jdf`*STBqM6c^F7+ESJ\2Fb`,@A>h^[.39$,_lehW\$T'gImb"ea9^h-e0_bgE4p`oc'h7
V-Yl?/3AXS)e0UTN+f.^NBB[uph(\bk:'fjo2;(e8HUim96Bec25:Pj##PWtmdfq9/s0,XaM
fX/NsQTnbh;IBC[F;fW2RZ,3*r+!n3omKR%IoMg62_Rc@]A\2(fIGTXT-"+Tuh1d1)7rFP-0Z
U<Uu5+H8-Bs"2J[_r&IK4cJ[Er7uQ;0MbR(Dt[!4a6[!pH`6KHNJPAM^&,O'@-#'Ch"6qLO)
K168ntt9@CW3hN#lbRe.jd50bC*E)0D8Y/p%.Y.OtgW\`T@eq%2]A<>2suYVI>jmE]AbL&&#8Y
jjiEY1n`V6Kr)QNQGBE:%J?Vm69Xhc?<%LmU%h,X,1M(WE4=M"`15Z#MaJZaKq)a`mj$Bs=S
Z\^DWVkH1j"b#bRIndfAU0'Z?Xb7CU4@p>#Z\2+3B<eJ/oPr(L+6DnhQ;IGDC>f\pgUeZ"\*
c-&_Hfe3&%O3T>Cbq`J3:Tn+:r@o^1Lb,h]AIPa<;&\S%ERE7Y*SZ5$A8T"b7]A!JgEV&+/2L"
gDATr.eYWalR1.Tb>`UJ`%iXhWHF/ShFu7Zg4#ERS4T`.IF=AhjW-Y5';LqO)MZ[^lQ"SF)Z
tF1+2'e=D?msRX>8^^<iZP-+V7p*6`!\DCmV8RN)M"dPsj:kt[#@++;i4+)Aepa4<Z7#l1]Ah
:ntq$=eV"%pfLMp>94pM7Wj]A+1h:U>s/j*239`@([oS_&d,KYV$.#RP+IUbRdY-/k:nmZ8Ni
/i$/J1q%`8=I<c;PEjF*ZGXA@Hl?+SX;"@5TL5Ltl,38(b%Rjdg9#UgY9USs)?uV'TH8&e.k
"!=k3P,h#&6aBEB8qGn!tJLWsE^/t-1m:pS&@/#_;*'i]A??tQJdAhR,O)gJh[.TmrZ)HEB7#
\GQ)6\N+6o[]AD(j`78sLEXuOpD0KBlfDBf[Sm8maunHb8EiMiEG]AAKo<[<71bGJI8PdAgHmc
B;XhX:^)CNH$`*(u6d9:V::2H4<n%qGb4I)s\B=ZQkHSJ<E_sgSo$C333+6MD1J6[@$_!?od
)UQMHZbhjdEi_[[lBG[IjKlXSf;DAthhKsc+0\bIOT"QOo1:JKr)ZWUhT_5!pIYO[1&_e`iE
MB3$X%<V@OBEGD4io_+1R+9*.\^-V\iBkNB7/]Ac.(7)RoE<H`MK90["dt<BIbHmS!1CT$@MB
"V]AkTiFNY5u7l#kb'++U$->cD_.?]AV5D2jK>0ALM(*"PUG,8t0q9u@s-]A);"]A.n7k;H*%A>6
`!Sm&@K:clFEO>Dd"eS+B4u5PNKtaILTa0Ek4""`h2Aj9MC2?7,oCA2EcCH4T0o@h52`WihN
]A?SC^ormWDOK[^9GmqoIsSO5,Z`D3FJK5>oB:DNE\/55K&..\0#dl1=VrMdogm.nA4V&!Y9P
>jAN[<XOYUU<F^:SC?^bn#HBtb*52+FR`-3,fTR8BTM;4_`EAZL/3XUDFRB_$nrP*a2+D*4d
^mV@i`Xqc&EXNi['WKVm-_VTpE^HqSP+jW'1lAs+Js*=DV3%()+Hj\2S:Vp-(Sg-u!tuL7`?
[Yua4KDUF.NIW^q1h#*g.Bk)RH%jOHiRSKgLQ"oQ2AKgH>4Y#"8T"NT[r]A8KmC#)Bm6&]AFt2
hijsGHJY1ZfQPi<T?k%bo$6ZYCoJm;MYg'o[!D5f3;AQ8q+,5oM7PE6m_XFO)\eX%:E%3\_i
UG^=O-cS\^!>qdO+.g/<iNU-KO[`D:+U,pt-iB'c#baToZeF@[)VkF*+Q#r'gLAW]AA_#d8`2
qcm(qX_'C]A-XhDip=GSMO[scWiEk5C<ZC-Q9qNq\?j*)HLq:p;&2sC3A>H!G:YQ0rSmH%#=@
@jl^[KNM;r1r&V;RPTSh%&eKg%?;`qOVt)flfhD@/)M`:>1151uM2jY4m^+H_CAD?E"566H?
m@*DRIk-2u!Vi,H"h3(hBc?qETs#]AJO/tI.?m,4??p\seDUsfT3@R<:I$C:@4QMbo*2p]Ad@_
8lA;.eFbTS(uj]Aol]AT9"+60K=./[rZ!6]AQo1/'[Q.O3@]Ap7_RE_N\L7m.6uC2:aCe^2/\3t6
Nkk^6cR)>;&1LXq=b3_A_F`N['&W:;:h0)qq:cirbW\5\0)8U2<'&32CQIS]AFD@-^kO:+_9R
eXcQ:#>KNd!Vddt8OKoVYI]A"ndn3d!>Ng'"*&ChLB$XBq[M*ejnaeU$R)+1=9R+iido"*rWI
/+n56'k!D#K7h#qYeb@kI@kLjPHD1C7kt:E`tRqb90rT=LS\51XJ[`/ckiR53./(E]A-1<`do
D'@EslP-;-m"QHfc#[c<:SjOp/q0gY9&ocGQKWT*n#9VPc<0pd`<4O#)/IMXf!Xcoj45c/s1
JLM?iV[ucFPf;blPcf"<0@7^ftX8,mb%E"-hQ<57dU/ZT_X)_A`*hr?M;gX@tF*bSSfS[Ra9
qH;MY/^R'8La#ITka#jJBpal6PUj4V.jIBdN4Z8QI-8E*<a4!L`moWaV[1b2c[a4_'BE9`di
>kN3Fk9j#/6U#$q;5fPb>Ss0K40%T\WDd4ZM0E89s/gFM&PtJq^^o^IbgH6^I2[X\+Os^i&d
sIJrYSnY:<KiJ11oRr6gg:S?q@GEXsnWI,V9Oqi&!:XgDKrF;]A<2o^]A3]At8AdAEY.Ub%V6$D
0JZtde=UcE]Am2'?9S6sslOlBbb39/`/lKS/ZpZm/]A@7PZCoG]A'LQkcmX?)P'5(F"Tle"/]Ab+
&Srt*W@$+I,a*f(I-u0b>+\//WB/Y;L8+Ulur<7PQ*V\6=>LhiY./Y=MHo2fBXj1aIe$I:'a
i<oPh5:.A;^.B`%kN(11)h&9Z@V-660qP,PFTX:9J&"-i^MqmOl?F$"E+lp;<lQGl5Z1CEJ&
rjhNjM.k.V?+]ACPAsqg3=m,`-n$YG0d$pK(*(V]AU-8$f,hIX$skMJo+R6C=#glsc,1O^)ae'
<#:f!,oIh);48IP/I_?"9feLa:F)2%EpP9aXsm'5Z,mI>8^&j6GctSWF='pHsSgZ1Lb`4#%\
@4X<\^&cC6&"LSlC?@+;YMKO?$0>2FjP<bhN.!HkQ+&[;`9jfjW*D-KE$,lt<gfff(UZhd&h
,Rp%-tNWN_Q#.cB_2-S#)pf%N([B>*KZmP79Vc%7MdcWCtLVQmM!K&)@;b81J.j'_n[+T`[<
7KS,=1lWLK[O69^AXc*%VqnFrK3(`tj"K.A4b3c.lB(2D<AWY!S_W6\ii>29Fn/2,Sg9[A$l
IQ>HE]Ai">GS"fDkGu19a47Kl+eoCh.Sl063NK98s*<h-]AaP5!25Wi5;pMO/P*1<89jOI*sO,
:'^lk!KA)PpGp;.K'fg+5aM)l='4E*IULEa5EUa[^2<l=h*jJ2RdY-5s?T+>9g)BiCk)j(N0
`Kc"3)[G+fQ??C;>9_e3/#^R;%m%YqhFe(=c.jJ/kg%e%1^*"s,4("o6l]A\//3D#<u3C^Nqf
-N/'@NM]A.5:[6@ljFb/p,60^e69jL8gDNg%:2KnK)$j&Xl:mANA_t;G`3SKg:C!5.gucQ'31
*m!YbNn1aJ14?&5gc>[s=Q+RQG"ij\#)q.B%`O8Mc#)\31b:+R$_N&+=K#DWR.G#WbB3I1>s
JQF%4_C`]AEQ&bBJ!Ebr,Gs]A^l@k'dbZ#tp/Kk]A<l>#sj40D]Ap\nK3,?GY$Q@)`Ku1kNC:&Y3
H=u+?c.I)T-kck8K3-G>CeJBKp[A'+T7%B(`s&JA[cW!XAFOOmFh]AF9sRaKR2\?0-ABICAY8
rgA,2q)s2A\.Y\]A3J$jL_nPHB**-[XD64o)Pfj_re-fbTeB8Bu4+\T0^$u0=-e;U5!MQp\nT
cmX]AEfajiiRl2bKT*#M1tg$=Z&_tWF'd`'ht-j?rd-kZgqV2(F+'YG\tA<&^/'5#Q\a^:KC:
Xh8\]A?"-dOYt]AJGR53Xgj`M[>LYVSoX_UahoRdQ5_Q201+Vq.<=Kg*cU%X%hPN*VaH1H]AeB_
@c*EVXStA_kfYq^TY,3Ke-,a4X66nqU?quIOaA9'GU1$]AD+OU#G-kic[L_q.TYHu'Atc[b6!
sD@1HNF!D5,!"!X19;1nn/"on!fU_[\\m?VX;/9n\f(K8)CAF9[%398J!T`HTUB1;7]ARmdS1
Er:tB=[1jbMNfG#b1E6jp>fS^Kabn:Y@,;kL(/Ngq[??[O1,sNkVJ'^9-`sJTI^Q"><V6JZ;
Lmu%Q"=KLiFd7\c.qm#\lhP`U3TbVL)K;N#"5H/Mh=P_pm:M1-q_3%'L5H_l^/=#Ah(4a#^U
5_FaMqlQukaKaF!D[11SZUA$-_FBtS/s</?5cGF?>*7BU=Up]A[5Y;@+)tdX[MOQm:"S!@TEN
SQ*G:K8tf7<hk>/*2fD<@_RgnOj]A:LkD!6cgq)Rtq3^ko#*6C.T.D*B(b1L4dm3ZlToK]ASJ%
';VQm3C\&Aco[^T]ApqF5T-LZ!!p3SPoA9,M]AkNMVZZk/eo#%_6i$B76H,'F&(H2j<0LrapX[
Hp[t9_5dGCO'.cb+7.ZXJjC-R?4G-)=Jksm[HGB<]AmYp8G@\2A;!nR>3FigM:he0B6N.dFZd
!9@RHF8^)5:]A9o'5+WLK,SNA-87TW(,47m0)e(oLop#''M8(<S547t$'2ANOp\ci]ATV*<OtH
1mX$tCkCuZdqN89eiOJ8@gA8tG/4Gr.RM_'eY&4GWkd]AZ]Abp8@DE\kuJQGQou?>[OG*g=\2S
'.U"lWpW4Yb:U?4H5&bZ#?K%!0BrI>aLZG@R'43d$.XP;AP\e+OI#I0)g*W;_m]A'd8Lega'q
E)JSu#23a6R,?eQR;(Wu)PhG<94gjeiAS]A&O!@G]AOMdM#9trOp&^&3M<CT8Y"8bQ#a\EgVK=
dK:9qUTiSka3Kug@Wf"j,+e2Id(e1ooe@44Qh6U2#WoYd?FmFVQdb.6m0`'q,.PDe&_AkjP?
<LEOX_#s!cmW$Lf_T,1p05M`i;n'g>V*s#lO-]A^\M>Z_>VOTbI)'1X<l!Wq@ICeJMRt\F/$#
W:ickHhA6VpW.>;WnF::CP"Fk]A"&2lhD"aBA=j`"J1L;%6I!mWL&p^hpLc&B<$%ZcZANGOI^
CGFXF.m(]A33uC%854Spq4';7?YYSm#[U-a41BJKo@:.eti77N7[C%KJ7nH$oWY8<Bs,_*1?O
4H;4[Q02c/N:rgO3Rq;!,K\$I)_#2Q&3jfc\F]Ao/+<o^G;U`n*[.9r%HM5DiY"T'/$%-OF%@
r@hMe\cM5^io7S'q_0X;^2K%(An&O9E*DAYLAQ3+)H[Z22S9q^4J?9;NAE@WeU4;'%rr'U^P
:OQFf=4cKl0;>fZh+0K='#7kEgF"\XH*YS>sHi='J3"t*,JHoC34B"K?RGg:1K0a1aCFO"8!
fG:/_D\2)sJE*q.Zh>BSXU-nG`c5e<,1BG4(IgAE(cH5K7iYoFAEMKkJ4lIcc#XbJK56iOX9
2>jiul;sU(T6u`4[r!oHS>E6rbnj[\%V1A85FWG8I%SMobTFUhWr81%rcNul:JZE:Bt&53N[
f+qL@!d:6%6g?*!<Ek(lia$6%>ncN0bdW-sE$i^Q9P"9l5Do4JM&/4EG:@'Ne_-!)/n]A+MMF
b,oQV`HhW)3>dI(SM?=E\<UB/4C??dA`idIHl?`.U:/3aUVZ:>Pin7EGkeFXA67]A&u?UT%MV
ar?qnUcOZNKk-=!bL+=)/4h)<sbN5N0(A'lKhdj#6rl]AFD50B,ZksT(+J8f6Hi5@f5g6?[PV
`_,VLB4!cSqj0ngn5>P$8W"NmL'B9F#C%A8tG5I>IM$=dp-,dpXk0_/[SQ#sSs5UgR!E\p%4
q5(Yl$6?2XF,=-gSt^ll)fL^#ET%)!=CfC)[%2#AaY5Mu9SsDc;$`T+V.BOqqBnMq(=2,@Eq
0:q=K61E4""e2Y)>![?I4i!@dE\;OoS68Q6T1/hVT\_GlPh@k/?dEiS9@5-ACWM]AQQ#*SROi
iA$>(GB-cfH]AE8JuGlh3\LT<$PTZ(B3f,oYaVZlGN=h-9uGLC8@\dinifX1&)H93.YFd_0X+
.:Pe2J%juHEQ$$R'8u.&l'ZHXnRH@`retpF6oGMj5'8-M#>IH,Z;pq<b0`DdoEC@;7Y)3"UB
nG2rLS`(Mei4+V&@c)o%RpkcM2^NuEc?<'Cd]AG@ho45MUcEZ$6Ph#laM\lm(Z9!9AAnq&)u;
[g7[V60kEQW3DQA(6QdB31n@+*HnO9p?gM"H/P(!7CpT:.qEoYgLU,W4n4%llUOk>d="o1C8
\Uqm3qVaN!-K3'?N-'00(?:l`D:!3s"s`,AW+P7Y@jH#YjQ&^KBc88-uNmm;g:2h(#=Md,4'
<HF(+9>iF=a,b[Hc(aUsRKT7P6DMEh34IMl2In2nd1Nr[U[+,!T.5Y6UTq'<LBBOMIf+Lk7D
k+LUdRaB8oC37mZgI)<;1.[6@fr3NF&P689m\:1b?dfc;N8,t_Q^p!T[BS9?YZMR0[%U%<n`
/LPp>A&+E:1]APiau8'KOh/G8-0kncJ"m_+<DK;g9nK^>;lN:W"OlHjI*E<gO3p)cqtmolHpP
<iqop*j\.:]AqIZfH0jqnK#fo"cZGN>7U1jc&u?!n\pj#alr"K[.WZ\0rO.siVK#OVnf6pl9(
$V)6(G;;)"hlakED%rK5)m?=s7?pQ)@P^OZoZl!WM6NNZM(iJ:i`>m?b8W`6Zo&J*$Y58aZ&
jO)XlO,S3#rcaCr;Gu[3;B\!<PS^]AJ(+.O^!lO?S;Wg@M<O_q29Wh_Q#q%&X#g2t$l2`G4ES
F4!YNm'e=br\_!<e^.tagDs&ghn9MekJ57`?EOagtWqH#p>\-StbqDO-toY$8Z-Ur:0>K-#d
%S98m*&Uk*]A*_A25o@PNr4"7poIqQ2AKm58>d#CN7Gn?X,2TdJ\;o%-NL$AUD,.82;5``L%6
<tOWgpt3c7S6`1NHZBY?fdLK`ZukeOp?VN,q!`H72N3R@pd]A)`AfGqY.jB5V-2b"=O__rm)b
(WKm)'_IXB2pO!UnkHHi%s)l'pZQkDc>9%Ia=QBqWZYmpj5$iU[?qEL1Y;1<mhDZ*[TW(%c'
0rE1IdpiYSHif8@nQhF9\I2%up?1:(g15QiI5"B_EqqL)W3iI5!Zr9/23qbA;Au7ElU=N2Em
61j4?ZAY-U#6^3gH_jW.rf!Z+*aFmF0Yr(%rHRg!i+Ws4"F/VAu>AkNcR.C.#0D,4t^X&qe@
;Y1_i8Qp>kbOGHk%)=]AZ2nhMEQMkGIHsKLFc^ZV6#!+P"&iRn)e12<g-i#(D7b60mM`E0Hh^
J]AB=%#>S1KUP;[XmOiqodQ?*cM*XPjDglsrgb2s:6Vq6%A+<k^n9/WAH+A>3h'>.n)o8t0%B
ZJG'`NPb6epB>r*`A0LlLdclQbm[jKYngRB9THWKtWC]A.3*f*S9]A\ip>QdTm<)f'%njWP[>E
Wg<FLE;La/[&CZQ"'Ed[kTdTk%8;[B"/DL3drNl(YgY%3BGtm@-bkEJS0EeaZn*4ik!W~
]]></IM>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="752" height="190"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="chart2"/>
<Widget widgetName="chart0"/>
<Widget widgetName="chart0_c_c"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="752" height="585"/>
<ResolutionScalingAttr percent="0.9"/>
<tabFitAttr index="0" tabNameIndex="0">
<initial>
<Background name="ImageBackground" layout="1"/>
</initial>
<isCustomStyle isCustomStyle="true"/>
</tabFitAttr>
</Widget>
<Widget class="com.fr.form.ui.container.cardlayout.WTabFitLayout">
<WidgetName name="Tab1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[违章分析：]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-2953990"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[20916900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[23202900,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="RichText">
<RichText>
<RichChar styleIndex="1">
<text>
<![CDATA[（一）违章基本情况]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
本月新增违章94条，较大违章0条，重大违章0条，其中一通三防专业23条，机电运输专业21条，采掘专业39条，地测防治水专业8条，安全管理专业3条，已整改违章30条。 太原市煤炭局检查隐患3次，共查出问题57条，截止8月9日，已整改55条，剩余2条正在按计划整改。本月上级部门对我矿检查问题一般违章共计98条，较大违章0条，重大违章0条，截止目前已整改92条，剩余6条正在按计划整改。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（二）违章分布类型]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
 本月一般违章192条，较大违章0条，重大违章0条，其中：采掘专业52条，一通三防专业58条，机电运输专业39条，地测防治水类17条，安全管理类22条，其他专业4条。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（三）主要存在问题]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
1.生产：①放假期间停工停产，巷道及工作面失修严重，中高不足，支架变形严重；②部分地点烂帮烂顶及防冒顶材料配备不足等；
 2.机电：①井下电缆悬挂混乱；②部分溜子机头无点杆；③平地岗位机电设备运行记录填写不及时。
3.地测防治水：①技术资料整理不规范、没有及时填写更新；②现场管理不到位，存在水沟淤煤清理不及时。
 4.通风：①巷道压力大，风门失修严重；②隔爆水袋有煤泥，部分水袋缺水等。③图纸及各种记录未规范并及时更新。 
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（四）未整改违章原因






]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="1" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m(6n0;r-'h9*_FSH<!p4RSopp&-2e4V*h1*]Ah>Q&89mUldT\uJo\KmCMA/EJC+'-]A'1,>7A7
$GV^[E3+Skj!hF2+8#Oq5Z>C[JO]ASo_'lS87PB?>6Fd:pNn1&.m3e^3HeT5X5JMq;/"lqt&,
iZW'ErJn8rPk6ef7=aM0+M0i.n74jk+mS9cE`f=$PbU4rZVD#A6`ZBMTV5Enp1T!)"nCHpO0
5o^J?7+mE]AnDKKB:42r?cH&H'AtL9^_q+@G&dYpX9.T&"\kHA<dQ$hB&dL8/.sF@)0.uQ1k5
]A]A!>fZ@]A_fI<J(pL1n;e?M:CJSl;=RWcl/^C,>Lhc8$P<aj!<*K!7j-[fJ#)%E$igNOE$YCY
p^61+WD=K4o"rG6l/1?XUL%KUm.1lMWR!dAjMF\M\[t-,p:nUle^OTmK;<2_i2dJ=T[S_c?/
]Al+r>GK[f:]AR1NLfe#lSs"a+D;*0!*\Dhcl$0G@uSO;F2EFier'HNCm$,?dh'U89r5Em0`uo
+LV6T]ACS/c]An!-V%?Tejr@]AY4dNqXEi7$7L2FlOud(T_Y_$cN)60^$=X[(*.K9M_I?(MS_F]A
2GD4k#_/mmjM1@<o_eY,'L`H)Qb^7!KF"GSB[BNs&j*G-'T+o@ZK=Fm^d:5!FR]Ak!5QJN9@W
=JmWfZ\*.lsH1TDSUGc>pRe:74F@)LjLE8_WQ=E05M8JM/O/gsOe.MNmMMMi[;MkW(\!9b[.
66Q=-#g3DO?fD#"rr4CJ/:l(jf+B^Tf#@*>/<pd&GmL2R-p8'[?X02u?K0X?5!T^dlaPjr]Ad
GdB8>]AA))9Pl=r(!&K5ZDQ7N7j&_0:\K]A*5cp_#Dts!>kN%8?%k[_;+>'oA31BSF9(P_L#U3
U#Fr$hT5^)>fLaiVB'GlokGA($i%(2Pjcl>Abcbd,jVoZ2N"eX>F"O?LY-OD_eCl8Q'T#9>q
]A5"O`Z>BZ<_I$^'ZQIQY94emMFDTdZ7Yc>r0k!A^2kV%FI)/(/iCM6nPPn%laAqgU4t=_%7A
_MF=+sbH^SIVh4<Bm@(kqqQ4rk^eu.eb>/!2.@t\9WaF53O3V^a)303?/EKj!3.U9XX(W^]AU
<>S?-$a]AtD]Ar^scD!M/@SJ8s`)R1"*=udK^^P&a;Hc`>1"\GVJZ+mF<ZOkOsUZ:P#%0T&gKL
"Ec=$_hfMsLi$90'_U"E)("(+EFI+a7n&F]An\MDk$0Yn'pd+K7\j()48/aje\f,QC;f&qXX7
ADBB7q]AgIbc]A.rpX&\ut[LkS%G<]A(A4pM)%.G[ej._lYICIg<M]AqZ(o#B"!ar#k1k>3#2dGJ
bhc(p^;?mmQku@Qd0P:94X"<%B2=UA`1BUL]ADWb:0kF2V$>'s=_89=]AE+*9pIr%q'@\$K^Ws
b6AL[]A(j`5(q)'&aL]Af\WX+?:Wn&0YA<$F#O_1&0<d$t\sOoZo4#*0cHA,MJGblptVb[X[@q
dI7DY%"8-SZb4M"&rY/U:GnTmLB=j,U(7ouV^?X*>dg&S4#A;70B1D1:Qnu'&oTUV9L@sS%!
--Q6%Bb75+Cp\4UdVOpH%.cVV6%>[bAs(QrS=T8C<bg(l$tF)nL8jQDg;obA6s.8oh!G,B0>
Do.P]A;O&Ob6&D=;6*G7L$5t6c;;qD?[k*3OPOgp,2GhiTo-8VubHT!f-cSQ13iEMR58#UE6V
!SKGp.Dt@FE;&u>d7SX+"t[pfI9a^%Q_A;4>F+'1TUo=J;F69B`]AFH[[^G[.9HBnD*=)YOSE
#f;8g?n%b;G+4rU\cVV(jf+&[uGEF*H*/[I[6F5WBG[JB-r1FOAF`O66,5L`rs9mW0QNEHHZ
4I18#a>L'Lf')$17>dppj78]Adea.&e+%j..UOb!b7D(hmfNj;l^-DfNnDRTPB!2V,e+ecUKG
kgC\jjm]Ac[r,?.CR<H2>KZQXLFj3BC.\\O@RhSH[YK]A$#FAbpq]AfDTA=dFn6DWoeLUmn6nAn
?DepW:;gf(Cn*&.s>a]Ak:2oH-$b.ZrE,kdI:kUqY2LR4]AfVj6g8>L#PG]A]AFt%5*>-QXW6'SP
RD<i?\O=h=bdr3okk^G-.quG@/GOPq:f831\1H)9*+L'r$jb6ppHZ7gZQiJ>I90+<H/PD`<7
f[_ouP0_Ab1OOdG4^3Vc%kQ%E]A@$'8o3^:-I+hAi.*.M;df<qQP<eU6D`Lf:jUpQ18n5%WO@
(Ia]AJOZ%@r0.EZ@BBBZZf<j^SO.*WWN!:KdJB9u3[*[jenN2aTL#DngCCGmrWhiK:n7?'5nQ
4t".UV1qZ).1=qUoO=T;FZ5oC+?5S6$T[!FL-/:JZ&4]A_,G9/XH+n'6Vc;=+\a'iLKQf"pJT
83VTLAFfBs'[Io/j3QX7&@6ORHhoCmE1fHt`8!CdH>`.n/1IZ<F;HNB\q+pGb-DcI$IOF,t-
$gf$VAH7r5Q+c@(8=%&4g+>h-'VTsiq5D>lDj`T..R;lf6t6r]A0l.#Neq4g,p@e$\+<MH4Bh
'3I`WLq4>Y-eBJ)=>P%S#c0WmZ?0Np<k&q7j]AB*<GCF)'#<ZO>MpeZn0/++Ijg+&>E"WG;%S
DL%P0-D[jqe8WqlEu!-'\]A'SaW,CcNMVY/_G3F[;QVaJ%%ca2\H>t?K[;>kX_,s.;)eQlGX@
:lt)Bn<3h#K8B6!e9cr.)g-on^T3@E@B@9#/#e$3Y.PW8sXX-$Rran2kYt?Y/LrY??M2rYMM
U5a'E4($>'hql.8M$;_F?7BuCn2JU[3,dW*&RQ['Q-c'("iAg50<V@\aZY;(bWGp@q2tat(-
nh-@N_h[!@+p$HpoV[(68J813RA^L\QJ\Cm,FQ_=c15i\6%2<#0M"JQ?[jL?c*gVNLQW';Zl
50qn-B8_q_DPB&<`U%Nk9)*:0LTcq6eK6R>,)BVYY,EaMB-!FS$7"X6)<ES\+DDNT^H<9(cC
PoGK;Q!6r]Al+_*V68]A/k'&fKH>DV[0HbMF[J%17.74j\^,9@fEWpeT.LO%"V:E="8ht:O#on
u=,:'3#jcd+bPLSF,FDcB,=@Ro#kb:lO]AYDi62Ag^O$N4Y`fB2o'`JIM\,H97TSe>lP/a&b8
'WiXU_W.OernD#aGdq)i$A#!84b4q,Ri5"[S>gf1[50ai.)>*M-'QD?P_s4'93$4/'Y0Z\or
f3s!%[,cU#,k?0-CiF%;V[QZ8&u]A\o,$1L-4bM$53Fmp6?k[TO?]A&E8Ad;Hq\lU0"jVoc0(/
R`Zuf0k4"alV(jtQTalE2e=m6>)HM;C4@YPD*QM!cipt`+%g\<)?q`U`Bc56sBg;94_*"a[p
<XQ1_f4onP(Nc9EEchC6_iU34iAL]An8q![d(DKj9r2FOF?LM0t1MOkua"F#4(a62gNYT(kID
:Inj2EFU[sk6+WRtP_)2/)r?"aN2Q'_EE`g=>]AV"KP%o@Hk(8WF0LT;e4NK<$St<K-i(E[&q
$V^u_u]A.R!``_?:L?Y`(7DZ==sbMcNDT38Yd.0+36H\+1Jk3h*:5?Eci+cYGNRP\DBpAJcW6
W!_2N.?*$U!!166>p)7a6W>bS!EX^$*r^3J5aqQGA<0h39OAo8K@(?ANTcV;U6-Lk28NfAN8
O&XE`4hZ7?X[7#oSO/:X.$(m$#ZJ9Z(lYMS._ZQ!2VnrCGaA!`3Ii38r7o/'3t6MBI:eFVS[
+u`PU4!76+'a%+FP\1V,PL"&IJ+iLT4"%E]Ac]A?*f^$!3<<lSB>hP'kM5odQNckHQ*(u=uu,s
_0r#Z,*ub75]AW@a=MkJpNq2+CCjk1\^3SKtN(oc*nc3.\q\i24ElJ3#>&qVAr>RTL.h&<iM&
JI*!:KGl-(gk>Zp3%:Qg^,a5.?]AsD_@ngs"<Ige:fHO8DN9aR1liM1hp547":Y(IAkbI$4JU
P`U>.5"7ZZs>c(0s<`<)b]At!rpuE$B70`GmC8mirqDQF`L*Iqr?8c;efI/KJF#.CdVMM9.4t
>)IbT@A#6YiU6B(pe2Y>,\OJ5nbb.Bd*rQXK;EVJ@u!B<mu;)or^($LQ9s5o+BqhEt.5@!fT
-@OD@-L%>!o0^QMm.3CHPa3aDQCMagnU\u:rs\T3ik97t8B.5Q^I/#e4@h`t%@i_+8H)SY`W
fqURJW5OCI0i%3iEY@k4.[Qe*R&i%3;o<l(-Z*<h0e/`R=trVEj;*"*h3M29S4MI0ms<_,_j
iO1AH[=bcsi@UO!5>PkK5HUks`Veim*Kc\rSAp>V*1&\ji:@&dYec[270o?Nlh@pS".42CH[
"TCs5Y*(npli[K!]A$g%h-92ACuLR6.0c)*!!KZ6hMsbe7%$gaRPBm\::_)MHJM[(?&sr4`_p
GD"_LH"L7kiKO9Yp(GHN/+i$-!(NeV3YZ/n#g=\_%kc(;&f0=YJGacVZSAL=UT4%OA"82Au9
'bhl>[id[kbI?tpOe#7Xg/d)fh\O"@/@BS_Q'A^j3+spt7pd;_hc27+jK(BM%K:NqbSi)MiN
\SGi@DQfX/5U=kgO8B26]AB/=Ar2rX]As6HrrQDMC(.c\A[Ia"T$CBI'J^$^+5-!:G!+/d<E-E
1<Y28to&B(lGk-IUMoeTpkS*7-;pVJ(fR9]A%[Ff[f,HAC3r?O,*D!SYuT0GN'+2B(uLd8J#*
uAb:3jS[\hJ+cr1FhlE@WOQd;#31goF[hI/6ASM0kV&qn9S]AMmes/WZWco-oIm'1A+lmP+se
imi=D#N[d*VpCl%HNn)sXa(JLpqX-\7$4c#?47ui.\d//V=!?o0kOiq[W%(XpU#%>k&d>K;Z
JKN)AD&V`!NEnB]AdhP#605SJ_6U[\FG$-$pG^CNjUOomjcP$=T$p"g%)R%H]ALLge(KrJoZV5
9_`V:='Rae/Kl<;+mg&-^p>FPPG@=*(8!kYLnn)iM(*_d3I@FhqT0lW=$XAoI81_XhjqCu\:
m_lms2]AE`%&^@.ZoIXh:,PO.g7RfLGD0jYi,H@I%ka8=_"OH,/%T@<dCKCaasS8E,"Oeo4FM
YQCsS!R/L?%3O5:beML"gu,sKK(38#H_cIbl3LMjn,11'F61t0\U^,@e@d#.4Q!QN82>e3BR
6eZ:'=VZu<AQ1<V9Gbg/p]AU"k+oMue-OP/n#uAltX[@CH)N(eu>@'".<O14JA>'_s@+(HUEu
#3$(3Hh"tmnb!\S;,t*/YXAl:8a5hG"*]AS=@AsjhoZu-73IG-F9e#D4+hS/IZ1='gq*NM`iV
Xm]A@&1<5,0k'"=N?Y<,jqL31R"8`!;4dY)XbsOYA!ea4aDiBo?MKVA-2Xgh5iEWfD>KJ?@(e
';4\4iFmh[B*P-sKL5&ri;H7BUTRt7\l9g0;h3(P<b:?'D&ETS>ldqQ7B_N<?)06Ia:6SM8]A
QOo$S^c+eNUm5[F,g_Z)G:%9e8bNC9@f/+j>?iF>QOOu?i_L):a5k@JmAl0dCo-o0sokkrl8
bhodXu>Cr]A549o[(9$31l1YESWn=;>0T3sg*SWH2XpNbWd=@?4BQQn@Tu?X%bT1`Z7Nd&52W
2J$>t)H-._AKGp@_oIW3Bg#%YA2!aeG=D.p[iHADQ?2M`":p%F_dDtXg5\_Q3.Q5?GVEbl<n
Qkd<Im'!qu'D7OH%rGN]Al^^%>\D(..bV@=Lsek44hFpZk0$<Sb#=)au!+C/BWe4?`ZSW!c#Z
G_;'st\F#dhHENNXI\Qq0'j/ohN:`1%0s_X_NtC-\i'%NQ`S8!H@/MUSL@#i]A/QXOHSSFp*G
>CA(G29EMB[`9iYL5=8s"AI3N3_M8+ceLZ1Nr,<0Kst5GYl^sbejBp7=S0;'k<jbGrd'iCDl
8*,%m>,!j[deQ@kbVDh,!K)rd@dkQMJdW/0j4AjslG80-/I:43)DRlE;BcG)$mY[UqZFc"\^
4-RtEQ-HTlMHd_AKPjQa%_meCrG(:Q>VBM#-pTh@N1'T(hFYRTI)G;"G`f0d$A%G3_/lVOeB
O\P`n9TMb0R'@FFrg(W8W/aGZg)=-/8<*?M1D0Kp0HB*f)'BqeX(&ru&YWB7,t#U"thscg*U
>SL"C.54g?:3Xd5`Sc->o((;=/:j;.*oqRpei6U=B<mNetdJh2@-4ns0ro?8;.HoI]A:3s-7r
f<ebIJ3/^/I)[@\p=\[5h4Z6+]A&-e-Wp*H'Ug]AJ"Ie'2Tu8sNA=D$)H<+[Q<*as#b31M6Z9@
))bnHpJA(-"cm40JDNrL7Sk/=`=Vh1>mc#7:"p5_R!J-q;^Ed`Fq]AQDSgq]A@8'F8pX?::><H
D77SZEolQmn`eNbLK=5mC0:Vc&*jt\>=kdc2_VTsj0oMj//o1JHet0*[i5#RS05$f4qP\/@>
2?sPTfH9^7EIAXf:fdepdZN+ujX"I(\43d_l*4E+6,T]APR14s!PsMT$HdJ]A\0%TOfsD&b%tg
=2)Y`2ag\QY)J>l.DrIV?m<Tr94q@Dic;2ESI,)3F**:oS;>chcUVMki>PaF*+k$$k+_f$o5
XO]AZ[,YE\C7C9Z$AR(`WYuY64Zt7d@[iqV'P)<UE-6R;17jK/Jf.+(RX=SAiZM.1q>W6nA_-
bieFefg?:X/.VX@HcG8:LDdRu62C<q6!.t.*Ep'G3.SD74JT37>4W65[]A:<D@er2kD<j=$O2
m!t\_SO\k63)&-@9dZK=GI;M/fQ$'3`Tci4V5nN=AZ-&]AFq48UD(/2e%"r"P[s#9Z'`XBcgA
^75XSJ,5C=Zk]AlX=t`\.FjJaWI>f7R!2;.4P8Rc*RM`%^Q6->+!Jk]A4'%K*%*\l'Oaa^Cf'4
DV\QoQ_qmj22n0Ve@.1bOp'&^M+!<)o\A,rmj15+'3PM]A&GJ3.;Zo@"),l?B_PA]Ap3TtY75i
LnDTd')'(U_@*Mjn9Yc2D4n;3`%Q?h"$F2iUr^6&5F58Ye*nIeYBpA[+UjcDn#?SoFY.@<:>
QdQUH1bHL^i$;h?@?,lJ@^%*S>$DSPSNCW96MD9^RH6[EPJ=1d\C>$6%K80`>tBU"nRUpd(H
Ius>GA'K]A%j*ON9Gd_.JqCJJc(T\c83u,@jODB"s10/:N-HZqAE=).H>Xj-E'I<HcQ*,.V:k
.=k>4V"XUf@fE8kI^C7PTR5[\lQiJq.PB_L_XVe\#Eo5h^FR`@?:Wi6cslFJ3r/.i+&Z_3+7
U5g9g.%[ebARJ*4XHODQee)PR(9of]Ah&QTjOc<0oZl:hAm)r>fLPCDb-X/!UmKk"1"=?_%M_
V"B"]A&[pJ_n\[n!b%iD9;lX"K&NdZs)9&i3u%[k]A%B\H_O-9\ho'LLH7>3Yc^0^/pjVe#>MF
8-"OSVWEsPW>YIo.fU18L!q+Gk-(mt`>pVd*3Apcbe2Z$MMJS5ST4@O!:%b;<qRIT*,f't>8
1\$Y`_`HWnDVUuQ>u_$0n2+]A&\C$5=l`B]A(hH_648_1pcllT4nI1::q6TC:ieTdn&n'2*`No
WDQGp5+U175iCd"G=0k]AlL\r.uh88q%CpmDtJ+O!')dZBimif/MV"5hAMG^3j4'd(@ju)[^^
+*0pI=6bHJ6aI)<k_2,N<`sjbiW2iqc?%J5)L;+J87__<O!\t3EG'^5tWBQnm`,(WaO8raGj
^ZP=k9I/-du.c466g<To"c`hm&,*rlo4gV"*f+1;P)thH0;VW)\X#NRB;N5ErYWShqpLh7f.
?<N]A[5^,emkW-PF;Nd6KZE-hk5s"V`b,;eN2Wr+X_p\d'RJQDC<1((LbUoQ[4H]Ac9ulHEoVO
)@;3K'VF$kq&C\Zm3cOX8T9qm+9>*TM?-oW@98t=+C5J,Z*E*/XT[Zm0lSqYhlH)-)U\,u9q
;rhdKr4]A;6GqCm7-ggklR7(hGl'tJ\9KESGA(s-_,Cn(BWJ<lV*b\iVBW"Mc*d8L$+o>?E7&
TiLnflMW'OI#d*KghPuc;]AfN4]A^2KWKHQd=`<a.IR9RLLq%0ZC.EFGm&MHPu]A"bD?63cAsF;
\39[Nt>]A:(5ULj]AAo-h!PoZ@N-nUg1\j3VKKk>mV)9*`chfcF`VG8N=$'JmQ21lu2TD&rHp)
kk@t!u?0FG*GTu7fk60$n!'%)'e^15#e/L(qd:[jFs/!@&M+[1").n:-p=;@$Wr`L%^`ZFnj
lp6>O?&4f]A_/Pp*2;#G]A<#q^rO]A]A4O.66I\^2./]AbTR5dAbk=Wjb"(i93@U!UGj*+:2g-tJR
IIs0E[RlA*Qiafa8F6s5uEI-Sc`%9kck]A5f08#hcWU.0-Hc8NMaC,1(:bLS;C+:+!+&7Bs44
eZ<)r^Z!1le5'fPWEcBuS[*f`$_<G#C)Wu9@._s1>R-\JFMQNUR8`VU8r_S&A.pm.'bIh`2N
k]A,-PMFLL8O&#N]A.i!T3<$i'2OZclnEi>R^r:Q[q$pZmfE`rC$F!PPZaR,gC-dYo]A7tq-i@_
'l8!JTT:n7.S`O,Erj;u"fm3K`lGlch2Rd:,68IA@\.X5$0:ST<l,4s-M`4uslEXNP<4Y?[+
^Ire]A`[@d:KhV,$k=K)upp2=&Ok\f;@?]A->V_2J6@%HR%go-_J1Tp1OXSZODm%$iE@DJfL#i
#T1'<TMb.DSB4F62cj>YmajXq((R97.:`@W"==F;#<_A`b>^\$$uq&aEN(!=eT\NJa(S[[?f
C':XD+qVpSUgeb;=r<FGP@ujq8[G@NZS2rGH8&rfs^R4]A,87-8+5f8h5oV%b$-^;<$oq]A$O*
\H5$ppHpZegCNmOJP$b#BB=e1NC6^%>'0'TXe;%=Q,Mle_12<'c?:5:tZ"<$Q5>Ep?d:d`-e
"VmV^UHqT-aT-LDD8YA1;7FrgemQ@CTCI%bO^POANaB$j-mU:R1/22`X/IMSP<Rgih\$m5)I
KGQ2<:n(t(/1^@.%]A0DK,=e2[W2Knd[*2:R8t!0PLZV,TiFs#[c!_G.d'sUL71$M*/8Tkc%h
$RG?n+b6Md5h4j+We;lP@lM3<>8_f(4:.p`GNC"etLX_n[<Mln\Ybh$"\ZC7Vn[7l%rr^WHq
##Up3nlK(:%g,,j29e:=UNW[)lR(/I[A74`a(KGu0(oA5;c'$V^)0?M?O1uM[<;=\t^2kZ$+
i[;\@4\rs?HpM^::TQNF=Jn;-3H/Om89V#_QRtXF*/2$jSd"SC<D@AGO,]AGkL8pPL_<<BGKe
)CBPXhF:\R=7_4*dS>SN]A:rm;VF-^/)]AVaROt.@89V5enJj3"%OWl[5;D)ee6G&S@X/A`32L
AN_YE5HEe&_n64J,Q0o"GO_Z8IrUqCab?u*ZO>u=AVKfN/W(K"1Q%8/j\1)-TRL,H;WOd-:D
#:SUN+h]A*3+Ujo_Md*4m?i\W"jBX\PhRkOQ$!O1KidEEi2RE+4d9g(CZ\aTgLY8LR*5!^R\m
IRI%>koPo*kqC+_mqZ`8e"]AN^U?Lf3e@/0>3W`t8j:f\03/rSPmk$jG///`nFnK'%Gq8]Ao`*
^3j6AHnIhIG6:n)>_a2/p[2['PH`5;a5AW-r;U^JUH'4SNAl;OkCn0&*A@$X.RWaP(3s:etd
':;n(GDDX.@7l6[E,CaMYoa,>\K>O30eokD-V#!53bmMKRQYef;ZN8bY>*p9Faft<-d-8F3c
J=?ZD@_sXi)-jQY^(;)lq^&m*dkqJTA3l60Eq3b2`g<X%`KYuGFb]A]A\XBH(YF)8A3;pg@H.'
E>&#9'_lPh8!e42`?`-r=;rMjO!LPPS'K(]Akc]AG,.$cSXJ6[1PC&j;g=B&:tZ+e_f,?eLp.j
+;dXMad=7^P=8j:*&p6(IX??;Aoh=ckR*(j9rE`V'Odj;%2kn2oNo4ZEIh0mRQQJ?Y(&4%Gn
"2]A$5rWn-m7kB#l)5+tS=+:Uh/'EiB6'0j_IrYo<nr-RbF58+hr,_M>qlIUVY#a&d!KWN#:f
Eb;,?\acGf.c4Uq4M&n;<<Y3jH\rHe.hT3sRNo5p##kDnLjC?G#r\>rFQ@gEYED^#5'+L^'6
I1trISZBKL1\f%SNbri"dn6lILMYsF'L[VFLkkOD1L>gu=)]A8*QM,nAS(>,<#5"iPWhlO5(Q
a-5YjR!J!(B0!VVGZ\VONHU=`W]A[fHq;-R>71WMqcti\B[(,3C2!Qog7DJg1C5M?d<P3!-\e
5!ae7L,qYsp^g^0Q+i;r!`bp7-)1GS:/@E\>jnmS3F4j(>Hc7#.<;RHG+!I#,XL&icZjJ>JY
7_+'(fr0R-+e"!ei0KC;f7A*Bjqckq4@kU_XgJP,SWt9RO<#fc1V.t=G^t<97W>XF>BaN*..
N<YeXNMf_<MG*c1;Pj?I\>IdVn%dWu`EB^q6bN4r3L[n&<u7-EB!d25o8!L;0kj3'%A-^so1
`nee-^Jhh9.@]ABN7A-i[jU=1u)L%uh+;o8Zm!#se4dl>Lf+ZCYriL<imP%cDnE5&$_=+>q?;
:T`LG.YbIu239/h^iW`r15CbZY-hPpH,t,B'hedPjlFWU'!!@]A89!d_q`R[tV)/I]A9psB;%2
H0KS2$FX=)eW5%pn56i6;`jZXU$Wi`lGXTG>[C(lL,QrAfhae&b,D\To-nWn]A[T!b$B5a.Wb
H^4G57[J7"JUQ6eqCp3XNN3;qV>aJR0FZFL86PK8Ff.59_`83?qa!5%=5Z3j@tN8&,i&X[Qs
7qFlD0DAeQqSYa!X-A<BbaSG!9/VX]AB\XR>eRYog/K)FB"Eom'\)Nac.<TdXI0^$GE@+Q7%U
K&5r`&!4>U/_>&X\S:6`-JX.54pe[9:sUhTZ<HfJB4:&hSTZ=>=/hh#5/F<V.`*>DMG7d?]Ae
5;NC?RbJB:b&Ud-M)]A*J-6FNI]AMbMCc1^rB^<>1H[Vc3bds!"IDdMYbdCLUTkT?aKWONf+^!
0oV,6%n@kElcj+as!.l-&OZVanPr156i.El?&+X(P]AoTnPCWe@m+S!e>8`[&=Q%Aqf7ja9;>
>qCb&UJjXdG-Q!ZH4Z*2jrde(K_Xa0M8E9V"hN=`LN/U5V"ko)98Kd#\8&mO*t\p:Hs,-lbM
Fr64?BgVP/O8*3$:3\]A;IQ\"TcA>%nu6WtsMU99cbs>5,@MI_%L[jV-3,aS@Y98RaFi.pT4V
Jegr`g_^6?LL)Z-,.t@YKdR/r9<C5<#TCO:'/`Wi.t&DVR&^8I(`sd6kM2AQrCYsqL1.qX^%
F4SAC@tl1u6fc;ci&I!]A_1)!Frl+"MW5FM1KMT@KV*VrVhDsHK/ch[qX/Y)JaHH<e=U<^@'V
Lc*P8ke8:p)(:@]AJq\J3XI7a]AN59,^nBq(5Za<'%W&heW]A1WJ8ELu#H<Vb\-bB)tInebQgtQ
(N)CVhP9;(Eh9XoD@%t8)qm3lN6NGAXn\'2GcZ:AR-2W`bSWQ=t?e+r:p%LoQNit6Z,IgZi+
XAEnEk\T=C(!K4)Y;3"`n26>o9k"@oBRkp(7_WT_[8Vt?_[4$nH+14TLs2DB)X#XV@&efCR,
MbsYMi(UV@i98cSO248CiHJq3-/6Ii*9OsS[/EAoEE3E;WmMKU$'es6Ul+4!'VCo\gY_khS6
W9TT;S"WZu]AL8PB0Ou1i-PSCsgM(oZXm0T*V'=deGYj&1FD_J_4GqI+0?3UTc4u[U&R*8h0l
6T'X]AU7-fn[BVNb7mV/,LlXm"W('gG!?Ur^E3'6Y,;\G11Y2:M``'`KJ27`F[JlT:)>9,F;p
HI\PBBRUn*S<(D[.-W"Z`E0!PO^e_QmpU0a`V:5@25Nd*l*i!o`BJc1>>=5P$5E&5Bq0giU;
f:Cn\Hh$Jg#l2R+6V3Mm7)I)ST3CQ.`R<;!$+J1@]A7em\e8h<D`qO@b`s5n;>:OHHXY[1pF,
=QY1F]Af>]A_h28nU%nfA6jdhUpd;@2BQj07,`qY@!&_NpY=W?re?dlOl5*+SW[<U$__O7UniC
JH]AF]AC(^'KE'NRJjeI3PmfPZq"=O4I92Vs4anRbRCE.e':Z$k@r_fB-VdYGoE=Cr^qiO<`>o
N35J_CXZtV,V(!np+K@?ub+3bV+b`A`E<d".4tNbuR9&!?a/0`]AAW>/[FT9"1ah/Z,-68-h(
0PkPW\lUGHr'hjF86eoE^RQic-8Xoo@<-:83C10k'^X:m`,;l+?W32c@6]A_J-/a#`R+90ftW
Sld@o)-L,J\M-ogr9]A>/6^b&qcK?l]Aguk/9$O!jr:SB'<d=*dMe#1<*si:\=DXr_Pr]A0uEOh
.mW4'ScHR:AfB]An]A6u0aC\4eS<Q.4N7"7CH-)NQ*3Oh0$<:X'VHXsR0.^HSar!sn3Ikohj%=
R`,kklSQ>huFAI1%3imeaej]AcItB-^M+-\N_ks5^,5LBR.[)WUT0;+03TA+#%f=6G.RcH/JD
8'qS$bU*YPGp?_F=@=s;K>S6EG1>f*]AS<I/cpnlAjHbNig2@*Z[^q4G%P&;[=oI=g^dG^\u"
mZ4*HpdViYGH!XI40#p:WfF9k9XKTE8XIOQcru:g-C:4\C[!!!4[aa'BV@Lq[T[o%!]Ah.LLQ
Y(7[OZZ8H5($;(<oij*hIiGA5;mmg=<>^A?14X_i;LgYM@\,:VJoY#ZGuZ.;]AG3=218;t@Ko
Ni3l;(359)3ZZf+qebFoj66EPX:UELGZE#\kp"uLY;n153W-gd%W`uDM.ldt)#WEl5.eAr%^
d$TMN&=b'F:>h$2F>e<oHqc05Nl`8AtO'D28FP!F/\t]A5\XKX0l,HF.pbTI4e-G\!co,&MA.
C(ZL.+)`N69IY<#VWgNI;Q<^'8hqBk[LhH`Vh=H3+GgX\3?0V-IVd8hcXbr\&PM^Y@/r*Ou=
G*h/>anbeYJ9e%;D4t.26bY<SRn7UZD%/]AC,@:(#7AZSOF)E3McKGY@$oumMhNt68rmKqIH0
B=PqNBM#Q+'na;Z3-)"@b6#SdZMU`>6V%h>heaU%;l(<,l!6"4):"a2+((T(I."-Rt+Ki<:"
#cN1,PU)oHJ**':AZ[O3RWYus<+ShPPr_W_JZb+)HG/n,/Do?W@fdp*/'\&+jjLL8<?[/(&,
^0iVr38j`Zqs:(@!PEn&4Njm.5HOQh%dZ*h#hmR9WHoBbg7m@A(V+mSQKu%P>G,'MiFf'ZN>
=/M,^N6FW:?CYd.<(NuH5/NZh;P;F9fS%G*:@"5d<?SP*/i5O0eC\(`+5:R`oZRm`gor]A%)2
78L^fq'YA?*`f:00;u!mO1u5\f57+g>sGjNQD'1Y4d@4#Yp(k9qk[E_FIbRlK:W-U4lSl-%>
8cbhSTuDEtap3aeR=pK;rB&&_n6ZW=1"aaS!lrV&T"4E+eAk;og5CF:IJL(R9qNd`RqhCC<c
eW5+=6=4DpTo.:f3d_=<-&j=C<&m9G#8H!ojn;k'HuMA\@Wi=O!#e;SEb6r.QY'1'9Ad,OUl
XY%Pi=j+d,WmeR&N;apaW0h*\UkUdNAAAHDt5oJp'';[qtX/Ga$pUHc+7Df'F(`VK`EA;oAq
>9e3!3iYh3dAHj3!dc*hIW*Vf&3(b^od%p&UrCtPjkMBWt@II:F?qT2iEUK$J]A@G?Gle'">i
FKRE_*e+O`VI`+AMtfm[LI3.>A#^sWTuX0S8rQUiZ#*b-]AuHaXftg_o0!*i%$WQZJaZ\'fSX
[JMG'E+pGtjM4fGR`V:Va7_o<i$j2RuHo*`%RYYV0p\V[>N,sIjj5e([:8i]AI<;InN''Se;"
g*oO1ZR_n#$or(,=0ue74[81+4#*>j&koEg5M@8X?a."1*Fc_!"X+;in3\!*@5\!dDiJ9?VL
da.J#=hdbZU/C):0i#2)q-.S;%NX%)WjqIpBClNnX`@+8+5G\M_lt9Q1fn8N0pVl0MMACYc\
Q.[c6/P"rr[.m6*WX<ZafnZ./37tYG[D#0p)CUVR]A`t.h!/!QCjfRl"79cQn?&E^B->:dHH^
'8E"PkDhn\]AtTF!d8m*D>0KWcLhf9M<D'oi126>*1AZn<G?ICcIC,`]A8Md<J1EBjl[o*+;.o
h?[)CI/\BKm6]A1;a[h,&<7d-V?/%(D3G%'l8p3:d7F*m%]Alk0sJ,0G,7X@WnVSMA4Q1Hd"ML
@eE5$AtsebC>*&?GZ)3Kb5T$\>ddNkNCN!-+H#EX+EM5J:gJM2YH-eIa77HJJ5P]AZ"s6&&ZZ
$1V9!6Cu+jPVqAU4O@1RTU=bro0VI'iTl\nXn$@JEZikmHo\B&!]A>B)BC&UL]A9El'3u.KH\P
ef)j]A.@;ilk<G]AI^H!69nK7d<miR4CO.M0Q4WP6V@In.]A."UuDk:WU5><q$nNeER,smMiEdD
0HLYZh<9[9_NZoCg*^rK.?@RZ[Af=LK(o>>E$mE&#<Ut)Ak-SCc(cndCOojhl&N[!>H2>kH'
-a=eT\`:7ZBF^UR<PFBR]Ar7p+Gt*PZSV\<aQji#$sL"a0cm4g4ZAf`GblW\,F8U2E1lfdn*S
bmfuTKmGb0\@q[#eZ\=i('U%NQ%+.(Z0`VP/ipo+R6S<\mG#")4!jUVY/JRuZA*7JHUq"qA^
HK?o50:6Z"5+F/A&MW<XW&e0!6rF\[1D=@8Ku+K?hem\hp,'#f:3qrOtOF:td&/"U+iHD]Ai$
MX_YW-"(?OR5e(Ja%k!fRIS[L[dOZs'%6;t[JbLb[TAs`>p!:ND\ff7<dG#O.kN)2C_+h?jc
%cX/oKm!-=`S%JriY5i3C:ARlQpE[-.IZtMeker]AEU.)7==2THdL,;)r"%b;(k%PYgGM3(O#
Y-JnZJ/"c[-1Xbo.$[FERfC9$7K6DO0CbKP;I@Mh.NTT]AHncG.aj+NhJc>H)d#"k>s`mKEJ(
cf>>p;6C/ud([>,Q#\jT;$Kk??%':YDb&/Pp7(0+f_5JKqdJVI9c?uGa_i>hhoX3^W.kr>0$
ER">MCgR0f)S2_Fn6n(60tM<#)qVCk>9JMjo-JEZXfS9"m\m_:VDcmM03^X!^_8'tc&8%q3[
67k9?oa"5%)0hjh_LUg3oVM&]A:$JOTkP1^;7lZUNjc&l7[M"aN>r;]Ak@*sOnP'A5UB)rh=^e
5FND$Q9fc3rQl%2jf1+N:F1'/MtdRL-]AD97_TooT&_c2!NFfYDJq1Q%D)t$j\g4>r\,*uOqX
:+R>c`E>!aCF162WJk4s3FleRW_[ogn/QF):eSkpmgZ:>&EQI@:j))>4C*e42,9o[J8P#!gg
0*o72<A'L;-nW17m0:n<^,B6]A6A)p5&^IjNT_ANAhbG4\jS^,MNSg?HVlf*@6tC+oRQ:]Ab^T
(.,9IcJ9*;sn";$+f&A0nU"Z$,Z0#p[R!'C-rSoXeKeEe@XN&E<jsk%+'&i!;KFa5PSS#HuV
:"6uS;^7Vg%P(P\7OD%.jXI=d`mtA97hH%'MH+%#Dp-PofC(R"1<oS1#c'tbghh@E*f]A)Fd.
DPoig?L'^QtH@tj;6,Tl7Puu`'1"sDCF^eAV(F^..77Y.sT9%lV0Rdcci8fojNI!]Ahl/k#Fa
e[4TNdOqWu+C8GRe1X/Q!47IXpY5GbQ+jF=Jo:ng;WjODW/?;]AW%2GWD&Er!<T?KpV*,R..G
@Use0s7Q0aY*$@4/[+35+$:fnPV#_pEmRXFldj:Ub)NOnDLrq&33Vk+!nIkpU--)drAuDV`X
:g[Ir9(fSE^ql&+\j"`VKH@!96Yi@k9SnJWJ_bc#2I+giTO98qE#9GYYGBVg9=-N.'V"d]A]A"
7KfTkNh8*5N>FcKfJ%+=4M>Z[IHQ_Oo^`^3BAmO41,U_WiFo?s<8KUeCqZ8S$Up'O#b]A';Dc
8bQ&hJX%=8h'9e/$-q96N):_2j/)^$8a%^$L-9B@>TY.GPK_1G!46e)YQ/L`RIpUHtkq-8og
a8p<*f(1_W*J/B9irO)<>omS0I.)\:)#H>_bg)=+;#Ee\OhON$YLna;,D5B,ZUCqXK`GMBH%
##4JoD(KU$7@;QY=:M<hF9nt4%?gjUHFVomHZ0*pJFgqU>[1aPY@8srmd>l,&EKD0d'RC+jg
!aWI)^Yb]AE[3<Yk@n?m>u5*P,5gdf_gBHR'Y@%`oBe,M#=HQi,><C/"/R84uHlB=6,UZ@LfQ
ef6!mN2(94HNfEIJDHsQR]ANLrnVo2]Ar*EW<nE]A[ETJr<RRKu*q`BF'PZ:U<%C"q1+sMuNik%
f^&WhgU]A52Ca0*00%(sA4Ma/5!eWVUACIMI/TE`iM2oq`NM1R/[Z;#Ug^89mA7<Y=b1j!Hjl
10lJ/'q?05]AK_W>kg18:]A/<5`*1'#bA(2mTBqWaRMSS=;<ehg$[INJ$Zr't2l=ii5JC0H\2+
.W8gEerq!\ars]ACWm`c#7OR#rXe4eIA3#+317)]A=\D<:dUK+#Z!!jD.eNlDShVODcJ*h$$.l
Ya.hmN*!DX8d6NO@bB,@S;:X`7!\Is+rNcT)@0A280J1!&XKLIL&<aG'TZTP8usl1n=PPBsJ
Br]AKGM:-l-*BcZ5FqPk.P\(<?'mp$m>9=(2">r[%h9(prO;".n?3A=52U"CjcbOiM#hSaDBg
U5#Q(hcKYhPRr)FX/m&?hX1bR/Z+cpNdi,l`u,d''\O?JV1L[B4'nn:aub=m[u;P7fQ$JRoa
%D$7X2^f7eUeC0c;SOdPY"AK7Pp$Lh$;WFeYXT_XeVX_%b>4NR/MgrW<CkE=kSY?6Db=iH`Q
k"^GL&8\71I`sa3C.JAqD1qM>]AnXY2Y.piOp4SHj4.U9hX^EskrD*UWi9e8oO*"GKmn%X:,n
L--PJKuFs&XpE+i'*JAY)ZMH']A(2CK._5HKb1mje-l]A7*%AONdTm,IlpFf)g-!W$SA7P'[_$
2agnhra@A)LO`l"1Emdg*12/[AX?:ajd;aNO.Tg8s,.Ku#`fB1^P51g#10"N+F]A2aM*@k=`6
`5@lFJ%4Gr<&E[KXsjN1hIH0l=duTeW^`\e(8S"&t;enYl:VrX1D74_URm'a<<"F5J6DY'KE
^`NHEk2OQ4)*hLG-O:HVcBiOQ?`UG/e7s1g7>)^iu1MA/n]A78("+QZd0MXSpUeI![7d;T':d
nN!i6QD!kO>5\6:6Z#]A^kZAqQ'>H3Xep*DH>DMid"_pBhNh#d.?Omp_e+_"-"7Q:_K9Su<j-
l>'aSHt:MU/O6]A=FOP]Af,4&P0_T1"^Wq5<=eJ8o#0f@jZDs8n750#G<4/MF>OcF?6I=>h$)C
=br;_]ABH7ZE=*&*SMQrGlj_BO@Gke>L(BG;q,k47Ws%W.%UBr0SX,Ee+$iG8*fLa!7O+;\=Z
>CKo4MS62K"X1)Y2Wt-$5*[NmPo\<DJa`$4p[=04slIQ+/*AKqtg,0Va->ip",Ks:<fb)CW3
k,1m#%MPGFD_J[VV*44T(;&aojK6=-W2^Z0\@qO.FTO`*u7()nZ'UnCi7p0=Zt_:b$man%pA
U]ApTu!pGRRo9[tRoM"!E9\Wkdo*84-^eOaNB`La!Sklh(dY'JAo?F?3,0lChNJ7%hGBre]An,
$VNa]A#`+G_SDb^@k4r>I?hPVt,\K-de0eTmEY!h523`U8+[3I2(m(R7S*+K]A:'t>!t1<juZL
SIP8okj0B[S9CoU#COS%*fB"%CN,[H<!O\@2<14Tk0jCq,M&-_-MF-2tn2P(B"WtoG&.?*"p
Ye.MnDV;E[lY4N^F(;60II422UM8B$6bl#o>l<H$1T%0fT]AZ&riRReY4(YibT+umGI%Uffua
1-%-Hd+R8Yfu\(WC]AKo+4KnWNJ:ErnQd\]A\bH^Kmt8mY6nAkiblLNc^PeUPF=b^J#qQoI%(b
aHR$V[h743mktU0[]A*E3g-]AkTi;D,A`r$\KP%Vo+%gqrPcuMSmY7&!&_$BH/?B-?(;">S!(2
\t#6B3;lT"2XVgF5"np>[MZ#)f)G(0Wg+aZ&12D0-0n^bm9cc"=sUpalQR-c=:%b_Ud,1]A+(
YojYrX*r\_lihe6gNArW^7;s8uPml0;7;^RqAd=IH%5SaA5Ib9ZrJiRN`VS@"JY_)eH`9;_Q
TiN89H#C.HsLEP0l!+F4_T>@)i5LK(f'F++\g5@M@V$:DZ$afF4>nRl]A\[uATH!GJ(ZZ9ds(
-1dHFD[ca%h$Fh833O(u)((+8`<0drX',Kp"ndlaDioYWktW9[:M7MPP)O`tfJ\]ARQ7VB=?!
366J`K7Yh*JjB6mKFlnQg`&.:[7pF-^KX:!N/YkQhG1-l^pM+]AWP/*Wb<(El1YMjm.1kh1V)
ctZKc]ADJBq!Viek`8GpKd6.2'uPYe)I4i&Oh]Aop(1W%YTo:=imOu)3':GI/ie.pC@,O%Q$V=
IXr^Z([Qfsa+oP3eQk?<b>)+3J(aK%$?5dHar*^@nUI#A4[P)U..<r_:j>.<G!CFS"3W$gdR
aFB+T_+]A&]A)jrc2d!1R5_(nVp-;3BHe7>HYG'$F6(M/,Q<6)IqF>`mMuEbEn[5Ko`9!F568@
X4jh'$Zg2`2h6:D6QcLQ`2jajQ[J?"u#=shh$M%*n`b$*6j4H3bda>hEa]Af/Q2cgaTk9&**(
VmDs4nd*KEIdr6ca?,nrq>,POrpUBj/-2HGQ8On##0DA8#S&Qj`;!!Zh"P0qDWh"*&FWl%GF
!a2<?;@4:e3^O?@gT3hb[+R2WZU7A>dlC[!8MJR7rknKu;;.GFek#8m3iho,r`@WW&3d.hpG
+L%"q'(hGmr3"c$G\<A@C:#ql^$FEkf;XD6?AABjN]AE[#=:]A<`o@LTc)2CUlR'hBd=/7bR1L
tMK$[C[I07RIaH"q%qX:2QkS0tK22!cdCE!k\#h-38[1O#Lu4RP*V"3TI9?57$(i8,sW7GgE
#=\dCWF_[rqi.]A8+uFZ?)"4$MiN*;DWj=Wh;Bk&CZWAUgS%Y8<G*?'oTPOr%CXRUnB)IG?JP
fK1;`P3HpL]ADX%*`I+91iCE>WRD@W-#DCW+Mhd*[a6os7lhfK>`6XtZZ@D,rrT/Kq[D$hQRu
L"1"_PDBN7Rd@UOE;"[+-4R[)&X-Zo?M!/Qo_.IA_HY-RI`qNq7Y0I!b'jd"J[I1gL&+?a`4
mPGb]A7d@5W3eWA>)7$=hl\;(!0P]AU[X2E+_lKUn;*`mDXAZur]ADfOnFN,J+?`0LU]AoTchfXR
#lj]A*j6hgm-OGQF2!pi@P(Q<7f#LR_MbL^.c7NVZE5AEo@p)Bp.V_iOG3ou&h,A]AF%;fJpCW
:H)$B0]A-4Ru<kMR_<8VtnM8CaFt0g.7_CA@9!$HP!Y/RJka<NGRjZ`u%LDhJ?kZf:p9@?Gk<
^)FfjJ_]A,'7,B5<<njO(.e<ujh;O<Y=A\9)pXKX+@`EF>r-6d[L>cYtW`&U1"cP!$HNu<64P
_W-#Vc;Dd*nsnaN^2/*1(DuJ3eu*n*L&]Ar*2@#<S^dY#@PbnIP&\*7LXo/Q!j;L#7;s\Mr$/
AY[b7H]ACJ-%O7\V(\3Gc`["3((PF60mctVKE"d@kC"#ghV_a!oKQ^]ArUFD7k[lis1IP<)F;S
;6+r";nq0!Bj5"1in[%+PI?4%`=H7ps-o?L3CI8bg%X?<]A2.)@+eGcCu6K+#JE<Ap\VS-d,T
$jF_kB=`)%Kr*L2>%@5('E0[j$8V`;4D(Al(6PpO48%n.fM0^Mh!d&\@jLl@(7e7r%9BDPY5
VVEL$Ggq;RG@F#-9#ZPK;j8-2L+\[L,^LhnJt'NJKUctZ:6t;og`D4*a47$LlClF[MODd=0i
7H(p@IDSo/^<1n]AI?OTo*?N:@ORqE@oHY9!%!Dm?b2*M_@JiY`f`Fpnc[=5512B$QdBk8BY6
()6+UsU(t$l]A;RBo`)fR.6`:J3Ws%=LcGeg.[F4Ai$Z_4/f:2&s5=AO2oFAS.<@P4?5J2/N0
"5d@FsD7J9I[_C.6cO_dXYN>B[_/UHV7.poh2l-^Q2=4d%@E(rcEgu:PSI!lk=g0I&)m8\!O
er8Ha/ODEq)^.6^cGa#62&SikuIRlgUDUp,]AB+*'40k(MN^%Qp8()B0gf%Xl`Fk.31H9a@bb
&&=h&#FXV3=bk\&!2col-H$[Ue*cN8Ylf>c=>B,g!QBl'&j>9V%[4Hu7V_$_l6adV2\\uL7r
(Q<(m\\W\l%]A$,/ES!Vk&N,jr]A(&F_hGb6<&=]AYG[^N8K`rbo)0[82S5M4-MJ8C0e-q#,5BD
?WG$KG=_lt)5uQE3#\(WR\(R#/4Ermi5CWHcU#3RpmRTSQf[t>fD633E1-@Bl.?*<=7i\5Q1
e6Fqhe`?hk5/_/^7EOM'&uZm'R/EX_Ct@BY^\bHLlZ6mRtGROCntRSfM!KD]A_9ONSdqgS:7O
6cBT/kL-dKl*_ILm?P*c%5$+dES:H[IDkumZHG/-*+InUmuL+o0aT^VMh/-r0=6>FiO'E$'=
P0hLZFus_U`G/E^[?6Lf`%8h/JaU4S/_oC01E05$?8JW&7sQH!/)6Z*pDE@%S_ANm7i'^EGD
KXADtB--:^OoW$-6^o-)[3u@;R.m-E1.Rk9A\lcu.RqXa;"1=qrl9=-825pO?*.Z)%DH8c&I
j&CP0<ao^jFbM1i*W??I\)g!J$TTI<AiL7W]A^TU="!C(N#m);cb>Id"um5eIQl0NtY:rW:/.
J5gd+2V#if^tKuStN*Fpa'm!=n$]A*#-AR2')hBL?<2`VnA3^\8\MStX]Ab-2P?FG5fgFR]ADms
'68%.-X-eNJ%Ljto3lBC:H4\gtTqVL;;^Lt-A;;l7&-YPALrR]AE"iPCu?5DjVeQAEst%Tc!M
^`8ntd]A18e?L<S^B/]AHRD7p%4U`9o364"(+Q.[GJeYEh_P$.CYV[LN]Aa177Hph-R[Nt`i4F=
N=s-N*a*8&KLE2I=@fREj_Q2,KZ4k&PKGLnf:1k5I4V'l2p<&D&!^,\/ZV.+ik]Al.6q!^uq[
$=YDK<kAFW7*G'TRhmZb(pt;1HN6#K5M[JT[Peh82#A2!OF>^OKE"CT2?pSeWK"(4>F!Sgdl
5k3;lO%I91Srj[mX!`_@+.3'hj-i3hl0sN[W;b'mY(0b&9ZN>4\1ZTQ5&GQ=#Y+;@pT,/=G2
0<+[7RugE.hmB/100B-ain?5'l]A^Ns+sY+mNf_P'8Q+&6CrSirWY=96*mbgZ>?i\:^5T3Tc"
C=c1>QYPNU]AJV7R_\HXVd[BJu3Ui=tWI-\@oD&J.R#Ze9#`'W6[=3]AXQj]A#2m.?:#A/-W9J*
jB3Q')"9%6Fk:acDGR7pO62O?'$q65+A3I"/W/Ul)gi:a*@?$TeL+0-,4X1(\9n4;.H/"`Z>
`Q8]A'O#.p8cruPBB)<,;.3Sn;5cnnE<E&jW+GlB%TJ$F@LNi-S_e,^omF9Q4F&""3\B1)8s*
]A&'EPSc<FG(Y;eT;&hiIUSe2iR_DsB\gdZDqe(t),;u1)=$(Zfm#qoP.uQ]AC3>cu#hL^FIC'
+7#1P?+Z*]AM[:,f;F+*X3jrA4k^KXV96TK$.V4C+@"\XhYkcUd/V9@a2fqmMCo"W#!T(Df;G
jn4f[&SFL=3rI;'6ebh#7JX*%s"m9(,"SbbJ>=A3XWXTpJC6#T,:tp/J-plV+YD-u*CDaoh(
[@*0Ye5U0[0,er3!HZ?@0A4s,M<,p[<lI\=^A$o7!k6qOE?PqX]A(/eLN.\QWK:NlX6e\7;<u
8.k+!e"#44uD.;1]AFh\PuUT]AA4Y/Y`\g]AstfJ"O,T.t`Z60@jVP[2K?!%<B0JY:!r4j4%]Ar`
Y4e=ZEq9Be.dsa]A3?eh'*O9I8@)_&7<"7HX("[J',6fMNQ\H3gVA`hUW"!XaeLUP<b-frhso
T.p&PhE%W=9$I5?g:90u<g#1Do2HU^=\ZWd(t-F97Wf3[&\&hXPNB\V[ul\p./4+<dGlk!D#
1N[rE4R>):CN8iuVEA"`YYMK&5sTEm";sE6/OjD@Qm!urg[=aP:ZN\A/>'<-.s$/G/`?$82d
SXZ^-9\M@<&MWqJXtr?h*X!\=TbcFKs>N@+(k['>N91<iJi*V8j>ULPT$!/%i(Qhi>Z8g/QF
.5I]A9;@(,CQpS$Ge8R$oP8<5Q@TPM1QgIqHBEkW_XYPjhiYE!L%h]AZ]AHs2Ir$ZKH\^dhRn@+
nU/_*o*<Y$V-N9%g[YhMi=PEA_^1^>Ss/ikP7b+6Thecp[WT\,@Bp&Ye#/HL1qQE)A`&i0ZV
J?51YEXJpY,&-.ZTTTZE]AKj>CN+.<t.danO>>>87Dq8n.X!i/V=N'O:;$iWepoDOClpgj>[8
;5_?h(>i\W/=.$u&"&8r9S:WFMZ^d6`6)CIqr!RI#s%fL35qF^B9!DVN2/>#'us2Vk.._eaB
ZhNdncNCR$obp=P,"oFr+OJQ?N4Z^ub4D)@I,OQP,/P66*2;R]AqX`ZO$Uu$miUPmp>qGO0p#
PWrlZO2pPl`Z\Orq<j!UH`rS;LC6ESiTV+GR"&6mao2j\Ej"lCf-0k$t9QBHPq\3M9Y9u2JT
SepPj,4F2A,5f<`c&csR=$6gfuep<$#J'YAl.Y\Db.+u*[D45j8`hT?&T-eC9E62_lrV'$+P
,Yc6HD[%UOWGY06Y'A#RIdADu95eA/_a)XQIVQZT:mnf?!,_]Af=ASN_<g<LK(ZoZQ45pnTMW
C(&Rg*H'G[?Qo5u!o/gq"rN4s5dI=H;-)?B;qT?^@LiFn>7M%i)3RF^#o@tSAF=U8`9r_^N4
DGuK?o:AD?-VsZ<Zdm'U&f$L*,LaX>r>48$s'H,<'TCYuN**&50CS)ac]A%(Dk?0?Q2Vs?K5s
hZTc>S.lY996@p6$*0VJ(p0f_(&WrF3(G(H$)]A'siV)pb+j9C7AeWtWFWs]A3E0nil0GH8rlW
nEmmA=T6R462%HOBLep@scM%8H7C2_m)R?J=5AnJ=>ENYW>*W;t6JRr2.1l383Jbnb]A:4^>J
2":U=j#97B9UZ\75?)']A/eC'EFaJ*CG>7CCh#R6)eAk@pE2F^t"AgEguB>+&%Sp+hnu3&DnG
-kE+HjIk2'W=k_n7\J7MD>PMq&_pIXk_Ti<V-g8,4KA'3f!r@$eL1<<+V\Vg3G&JfI(Js'E5
;C.V_?Rk![Pp<q7OmR`ZCVM'c$m<B.&T^U7jXrD6Qo1Co.HjJ[XN9'I>h]A7g7KdDC/1>%!YC
pVUh.T7tSP5YJg99?L1hQD0XT<4Isr=+8d14n*hYH`hpVd"f..#7_GrBe)a<7,Fh&l\9gUhr
C5$"MO(HpA6sIFTYu($'8s=<jnJV0<LY'f.Q70c/ErQK+a<MKN):b^1T/QMF99nd\"pD$J]A,
bBjZcZO,T7/^Xe5R[or8@oQSRls$9TG,kj\=k3Xp^gHAp#W9b_lm!XGW\,%7>SO&RQ(EE!oT
(r\&0K"D/b/fR5d^=M-(J5GKS']AaTM+@d[!/(X$0cX(H]A*2AE<"7u\tX]AY>mD-XJFg$kn&m;
mqf14u@#I%"Q<iE?C!&d:]A>Y^%28+7po%dMXk,OAK):\aH+3lNV-3VSepM.$ugdp7GudGnE@
i)629f*9SbX_"?Pbjqko+mQj(#3H?hZ#K$k#h6>o8$EOWgbRCY/BI_Y#DmIl9U6Ej^[b_ItK
>:ol?WEqI%FYD7!T-G"(h*EUTp+LmQ"jW[b587J\Y7D0*7htfT-Pmb(OjtG5_#lY+EKfJBht
=R!^c^80e_FpT*BF.N#MY_d9,e`O\3]A5/h@;Aor"6;I>K8eL@?;na<mJcI`WQ%qDD!_kM$r=
E]AD;-9gNB0AgK$HI@iHr4Q.r0hAl;/Mn9eMOu@'<fiB(6TIPmTIblL]ALLc.\*?8\O!f;Dk.I
J9&mtMDq#/p55oq(j)b+&<E2>Ho*4>'sQ::6un2S?]A8M(O7F4&n5i@;RNt@$I0+p<u5\O%,)
4CW_>US,KQfXX(qV-G^A[l"T:\%rJjP-`4*&=K`PS*GmkJ]ALVe>:3&8[Un?6,6)EI%f53?.>
,#\f(?[?lN^ILD%N[<]A.fc-I^7T"Pi3I/KInP^187N#4-+^H"Qb6D#NUO4)0["0;.hW,,,@J
&7.8+'F\GL`@g%ii/iJ,I$S/'@g&>S2DBb^J8*b.c;q&7fMSjd<Z:Z-LS57B8^Vk;\9rU-FH
@"?#pXg,[doK_.IA`i-/n]A?uWMN2?R5PQ]AW%IQ#aP%]Ati2)kpD)J@o5I^.F/!jW2fjp84mA>
/-D8IR&%VNpn(,IAh;GgHt"*db;5rid<B:MsIEp:\hjJTpnlAsObgc4B[g6`^c?UN$.Gi=_C
Pki%^Y+VN^C_8PG_@P?a]AN6d^pVF+NhqaNZ^`@LN<CGncu[$m**Qo4%sCUXK1ghjjdL]A`*-J
3@55gf`7@V@k9okV:&Kq_h$S&'HF>eO8O\D:M&R\gJQu^_jYf'9Hh@W>(#,kV:pEWe/=U',S
\J`5QGRIlj$)9-/lHo4RY1>m,WA&T4Cta(GmaUc)%fRj?<H8QHm%6of0baK+(k<BlG5-+Gp[
ZNsT)VnH@*?D7QJk$K]A_k2'H1gM0oLIJNC+JXcIhJW^5l1C!fLH`qh6jG63L\T+A,F#)9jk=
1-K]Ab7[2:7-_DGI_!-m]AaA>K>$f;d>dVn8*Wr!Y:[AC99#)N>c[ekjJ*DLK5jn1).jn`8`kZ
G8qb8sM)BR\LF]A1m4k4d[D4YFKoI7t?1[U&SFckD'-nMNR68nZ$bZD\`PLr/,`=c9oOpp)%+
oZW`H0bGrO-C;JP%)ne`Z%_r^RRblLk%s.6V5q5!1@-7@$J]AbYq@h$40nDa#%?-QVn7ckcs/
;Sgn2?fb'fHUQkBR$D't=6mNYJ91jZH#SfOV@Km)D-9'SLVQ]AKAE%0aZ3>o`usWJ[57$A;>Y
0MYf;qWed/+\0TWWR.lpA3:(bM$(-*G'ZcYem-i@_?6^#6Kc*;7sGA/MLW%_e+eU+To._trW
P@J\=Jn.nRBU=Z3FY$_-EGG!S`N0-pROq]A6!V4AE`Yg6LS@Beu,Q..98/:k86[ep3aDWiZ1]A
U&U(t%UWQa!:RNRA%._,>MPOSVo)/KTIoko$p4Zf'>n3]A.`JZH(EGV@2.5gB9cm#fB4pSXOC
L+DLAn`80YEoPpQ/k%t;'pGrNcJ,FcRU4FYCsW"-$3eX07B#focj">39uS/p]AgqMT3tp"K^@
ih'Q=jt:glN717FA^!]AgtGR9:PCYVO+@S^QdU6dN6CP=b2-q5k/T:#+04rJngjf0DZRr->"-
9LnSpZZ=%:['&D3\hAqPcaAK*-^MME).cnEO9R.R82BObfiW>kkIa)"8g%Y9/jGEB*#8oXAA
LJgP;rL8E))idQ+1JIlY8\sUDu\R<S?E%c,J.&JVn4]A]AkutPb%phu9lE6IY)MRA94p:_P$4B
2b1&NQp5Ul6Rcsc>3Z:U+Fg\s;qlKTL]A4"Jj]A,;OJ/@@4@\\;tsPC+b5eu6A&*)ear(m0G9n
j/$QQ;p1G+ps7h-[qlM@IXlB+csXUQF0O5>HE1WXO!>[;I!Df+>Wph=b6-%PMW$m<`e`77'.
QYjYWP0"e1fInS&cGdNi0S:1AFZ1TM9`)l8*IiloD2b:\C=0d]AFlFItk'Zr7M&*U6h=#\/6>
[4b@Kf$55U3@I1%9D0Tb:(q^Q0_4=j&Tc3I(<D@/ZpR=1C<VtSqZ$_\6;/0/MJ%BZ_MP6g*s
?Y7H+Ag57?))<@^fJ)%B!!Jk-+BtIk,MgU`4\L\o3P>`6P:,#C,L+"NmZ;ijlsNa,O:H+tIi
I3E5:t4AHC6LP,T,_;hktQfHs/KIME<ct;FH.O(=DDKFm'XXp#sg(\YFbPOE[WitTLJ$el!a
$=3"g3n]ACH=^Bj)SRdAWtlX,_/^dZoqSg-2C4D1^`=F]Amo/mA(#P>SqYrq/rS9Xk"W-\;/FU
\@l>cXgSps[\S3c"YOj`J]AKJ2O_hB0O`q"@#B?'"LqqT]A6AmMg7J)85"?jLg#":omG=Y,9Ak
1[dN61GOCho8U51I,:NtTTa#V`G4*ZeZ9d6L3cgjffq6IpC6I&.tuO`?*saqOB);_kNI:@<[
63n)Ak<A4,*&bY4>t$pZMMpk/\eh.#`er)"tYOnb![6"(Jc2mpt8AZZuB6LdJ)G6M8Op'V>j
[NFYT?CQ2a,5t4#9d\rr(Y7[QO%ksNF0u*NJX$L^JNfV]A<l^UWuIa6JPG3bW&/lB0c[,uNT9
/c$rN&Y:JjPX"ZVHatEI69VJo0B>AF=*8FOMO(l=PS/gjSH7$]AgS?jMr;p#RB3_B8B^jfLK0
G#5/Uk"f'6'07+PbLlI;:?3rEuH/\_u!qr`pE_gT@O#m6fP]AQ_N.*d7I`dR?q7RI?aT1pJ+q
fs??u:-r@3Bc1nQ4h.temZQo=nTU::0+0*U%R*$4nFDJ6*,T3.mHr,0aLGc^_Fa:-qc(dE7q
1m$bE2VUKj<*mF2fSFk<401S>qnu)na&`NL"%%98<$V,mK2&mi*cr7%.\!$U5nBHbLLMJpJ-
(pZp+OeX&]A5\Qb]A9^j>FJD8R7fb#(U4n!&D2i*FPSB]AFg=fG/o7*(n#:G#13tB<q&U`W^a+]A
Z@`\qk"U]Af2:\<*b'iU;#@DF]AC?nEP-LYZ[Hg#TnisI@(61:c\QjA/di$c@W1aV/kg$Nr\ds
]AJb3&5takcprXb$d@+)lRlGh\N%o.Zq;A8(tJEus7R"^"7;L2=m"Z)>0CVi%XfBA_)Uf;qb4
"kD6;#=!(I'\'gi^8>JBrG9ZJ-qc'439PI01FIde's]Ai![Q34(j3M1QGPItVcRFfUV`*ZjHk
ES1SMHEieo=7Bp:Et)Iu^7?qSFTLjUj$[re'^\&F>Gg6$?Vtg]A.k;XhXtgYAUUFA:D!q`.(N
KHMK]AAI/C+mY<^_>V.nl>6!&g%2k9+rC:cT%.[?2\`S*]AL84Q()]ANS'-S=eZ#:XB.6/pVsdk
MpA(r^&#B)A5%iXOTD=g:g+(q%IMQ5SqTK-S8q+fio1p%MiAjPRc\M82LEK9:G*Mp=sWgP.2
BM`<1]A0)uW.4r+G@nTa92a=!Frp7P1kneIdgX[E(m.ib34_[IjBMc*OE)haJE>G=/c&#=pI#
%J`1a%W6@Y1O\V),94=0-shIRC=G'1#^:Bb`+rO=eSRuKqXZ`uPLGlG?Y>O-,,Su]A$,Nhi:]A
?Mr55[hArup>HK`@bf0tXJpIoDE`*au(j1S0%LmYrifia,Xa$_tN)`q9&2+T[JcrK<S<1d7g
Vl<8nk/YDCGHAQ8'KC4KO,43"r09LF8:41F&q8I;^)#\CiDpPo]Ai#c*ei1RA':O&^T!(E'!#
U:[Vig"BU'R.JmFddApn#KNm$]ADop8tQK>o?LlkWc/M0H2^pc/2o_<'L[C>1RP4G[G4]AR[[N
BRE;#Rj#EWBl`#QsolLUPi]ARp:1/UO=12Vk\.#?,sKO0D,Br^c*+9O&(f&"WHS8KB5HpY4<G
O%q9sJmNIe=.'`FTAq9(eV.o*';YiV6BP_mDB&5m^]AGP]AJHojlBfncuQT_#SO")04IRfcEcc
HL!?_*VAb5e$:lD_5WlViY<NEK8_-(&s1F$GA?M\cu3R*@eP=8b8*V6g#`>eDAoXs'%hh>!g
c1J?I[>gFqeddlsp#$MV!F]AH]AErmq3TIb2W9qOH(WQ]AS]A@+pTRiCEc5_7\>eBB>(1cpu":(q
R/?e&d>Rh!PNV_$=J>N@tI\##7d5G)?\f+?\Ehkla)oQiV^&u+-(R]AP-P4QX1=U6>6d]AJQU?
:.ff[-n5d8>#M15XN"[=OhW=57Y<%3\e'#kgT,!A%i#YV\$OQkac>!T6=>4K\ZV_:q-g'3lV
P'h64bIW`Inlo2q-E?%:@CTW`<;Kh.,ob/6o-Y7&(!n>0-_>nK2Hfi!Sd_30^<"F\_r%1?<E
o!>HU=eUW28.62?"/Q8Y7<uJLVGds&1sXh;<heC\@`<V1D6T'B0J_TJ=D!+Vtn//2jD[<3-d
\%u0^j1&Tde_hh+816;A7.6^"X6h"IAO%R,^SEQI!@&X!Q8O9p,"tJF=ZZW&?-..D%Cd9ZUE
jqBFFNf]Atfh\1^IKQ*hej#L>b9f21IF=q'>&U>2lY5?o#)o@/%MJ`?,Hi3:0Y8,ZZsi3MqbW
[Rr=88LUfCM<NpsQF6Up?'M'\*fSB>op9S32sgS,Km4RL[5cf:Cr)maV*$rgt"]A8ba7kpQ3W
k[m8P\'SY+$(I<UDoA!r51@f$3$c)?F=;\\AhdB_0*k0%N0RtOn:\AKorcUVXl7'h9\_lhq;
"qBkaZ"6W1sMW:1b\+o#!ll<cEru.f.>Dh+')PUL^`i!"LX46[rH0\L^(W)%>d4P@6k%+5E8
<cOV2RUau3.`ca;0e:@4T,as[0*]Ak`S677$kH'`10/s89/%&E3;[#=La,'95)<V(UBap*%%_
!CQQlp1s8lTn\51M#/!1S#j!^5uG@17CLtC@u@k1R8XJiGhr3@)@/*Ag:_9@"e0uhF#j)qMB
0$J[X[Z)D_PtcRm(bYna3d-7_u%(h8e*9TR/H#\u7u)WF]A]A?UgkbG?oQ5/KJt8l&[Z]A2!!7]A
.F^AW;=ZhIk4:5t<^QFu^MJ5L86P5MiKHpdq0)ah:X5Q&rX8Ls!?u9f<R1*8i/&fhVo,X?!_
7r7k]AL!IN?0edisGC_Q['>$Y'%G8`&`S%$Ne`0oqpaQIX`3>BgE">PKX0P?[qOrK>aeH)]AfC
mji7[?Xe&Un=W@.+im!(P<?S^7<hn+k&Pkl$KEW<:oo^@SYn+OP&H<,)M2pg^KC[Lp)h`'RK
\PS!V!/ZNdF%e<V.PBE?@ITTVYD)WFMk54m2o;r>()$aa7j"_`r98hrrW6mG_mfeXmgEZgiZ
rs>r,UFf)nj(M:3Yd$&j/Sio0!?'feADNrL8QfoST=0i_E&R\<_cGa,]A^a)L?th_`[N]A'+@\
3a!R'hBNrT.ZuLps/qC'!-,TsQGNFF;,h/9LT^?$r+D$/2ufUJ.SupN5%tInKdQNQcVXUq2A
Nf'E+8C!LI2&(V-cP`,VeiXoZ>iLI8`A/Z."a(c]A[Kdb(K<2=]A[2bB;g"94Yf;H>Ok^GeGCq
JIt2C]AO$Cn@OM;u+'XKUjGrD\Jcf_%-2=3Np);5NUR`7$FeqJCkZhm,*FQi.c#VU2Qk'VEM[
FF&iAkglr4RIdS>:_elQNJ;UBolil/;LY^ea\--c1/%S%X#m;?LPP?FhHDZp,8>2'fNEh3Fk
+@N_'L&OEIUNjkGi!]AMd_En`5KZqlrBqc.t&Dn_:]A!6$]ANC4<lD,HJRg"2@!523(Mr)2&b22
+9<@NNJ'>GFCX<'f!P9(J,TZI[/9i>g>HF[9De#iM=[@ZJibVs$nF%?06/7l%0+pJfkS.@h8
bIl_1G-PoX!0[F!A@I%a>5?P7V%ALX9G/;Zn30"PN7H(jPg+*3:=Omodp,RB:7R,,=o!Lo@%
_\mN8S)a?I^8,?)gXkbcL!MhO0<Q1:!:2I6>04cq_kT&Oj*iN8VO?B?emHEe3:MsROP[_T7J
-r2&BY%.8@6]A*Z=Ueu\[:Hl1hWq[=<Ar]Ahr!b:pZc-`JK0$sJ4r5VMHLVOWeeF=kp<at.D(u
JH-u("L'Qr;Vm7q#ej2ZiHI]A'*>">&fZ1YNIV[,i.8NLe%'Q+WS#3_ZqRlhX(cCC@='.:1?:
?1m,SUpq\_)&$ERR^6K<pXj!)qs50&)fZo0:)18(b-Ch2VeW:EZj[p%T6m(C<YE$o.7Ze5f_
HLhMrSD.]A\h.ihGOg:-%JH.d'&>3'CJZ.doCnG*dm7"L6^d$j;OaY/n>4H-r>EqO5\;,N27l
3;$rH]A1B(EQAs!bYCab*.3d(6g\=r%08qF_djpLfOF#HJ>N&$6!S=804>5E+g]A.OT]AEk`-Y(
p8:%Z)cGL&'^HfIQSWO$u\_)qqZ6c1=q@Yarg\]A4V<+g>)]Ap-Y)7Pn3AqXK+7pZ=U(2<]A)cD
MV@km"=8`&3oA*YLBW`/6;`nrp7Zq`8/N_Z\oe>:[o'JjR108%6*:`+#h9VsECSi:L0[GGB$
J%@'dp44J1kIehRl0=r+15Vt]AeM2O`19>@b(q6@p#=]A"]Ak%\,4!,GKsacq.abI')R;'p+ri:
Lhh]A"%(R7n5)*LY<Q`:Ns1U<ejU9C##5mrn=,u$@S\3I_kSgTb=T8l&XZ9/b^Q>m#'BXfs-t
2`<Tk-!^k=]A@'jr;d97*">%l$eU4T/6TV<=>L$(SoMk1)s@mSPW?0D%^P8_PT-PBpCjP7VW?
sDn2B5st1?^!mB"i\1"eOg"ZM5_9rp*<-sSqR4(E:#]A)(16u_T?h[R)SV_s3U%3g=K5ce^^c
DAr`EOR58,;qK$M;*p?r"X`#gmig@=Oj(aH0ZlEZM:lPDJs)Ebm.kK07Ml91OKDdoaEo2Y]AP
9$R/u7L9"hZU(a^,LL:aJ/)Vg3Q<PZ6h8-6Rt?p4:>8fg\joS+O:iiN;@NC9R[j4+L2.OMc,
<.)\XY?3FFErHXjWL#\:P/SBKX=',F^qR2mJQT:"?3-C&[927q`!FkpIm1bl/j:D#pC%]A+nD
#.Q#LBo*]A:H.E0]A<-DgQ$@*[Z=+pl98$5*cS,.JB`/fuYV,u@16i9\X;"uPP<Yhuho*$)J,(
]AtIulChdlE<k]A_Gb&=L5+n(G3=C7pNX*EFmW6'`PbZWj<%_V8ke\s^)\2?7l#)nH#es0tcl/
O%pLMcu(bp,1kRVdm!dUe=]ASrl?HVi*ufl1f.^)ii0-"RMV!6c&?`"*lb[6i<,^(p.*_B7N9
Ku`A(Mba:k\[d["`]AUl,;`k9W0U-@tFp`hYZpNW8%k[?9rZS<#7WEh-[qQFgm&i,V/`So&C#
/0G#k2@Olt\uN5^lXnNW\D)3=Y]AJ-Oe8d@5)!`R+Y7Wi%dlg>K]APF&Z,5%qfjau1=u!]AHC"#
!17mf>4WgePV4T6@F"90Iq=fHUH@m8TB".*Qn?Y;GD<)m6//VJ+;h)m753p)Wa@Y=>r_1sF\
VIHM-,-:6&W`LHcS0n,%^!h3OKi)@;'ID'EobIk+a)hRffgoR_$%"M0`oA2/8UkAD%]At:DNl
XTRaC@&(p<*"ncMr`"<>0-Vp5u4H2_[KdHnB"m8JOu9<u=V%AppA?gn)O,,PUU?.Ze4%^m9+
brr&n\/,?14(3Kgd??//5m_Wl`+D(P9?KAS['i^`+nZh=Lt(.d?<r9@5KA.m@I@*V1f@EhC#
UGaVgBcIXL1mf%X*%a6XG$k'Y*@8iEelO([FfbDS!T$ftF4j"aK5bOuF]APY'%ql(d.upDNq%
uH)H,.SKcn!d8e(J"6Wm1aW43VF6$Cq^+Zs=TmU^\$:_dip6H4E,u'C75!A%i\Jr)6E",cL*
>\1HLtQM`?/"K<>'3(InVgduU]AD8^/3%D/:GXWH-rn)&",BAiX4Mc*,r%0SO_$9d<h,e%=.d
9LjSum@bn0A;"\4KF]AGfike\XA_Zi$fAqnC7)nSg(Zdq_F!C*.GB1!?#DWLtB\&#P>ePk@0N
Dc`_"15<]A$9B;]A3d[Hr\[j/MaB&QUf?XK3^n/>BV@C#4oG60XMN+Y0=4aE5(K#P(YZZW7DDp
l:-^PN`8:+pW,Z(D;n6#&hg`/YnOc?KeD]A<r(f<Kp_$4:tCPrc>trYT,?N25G6.L&g7mKh;N
mp?[f&BA$="-]A\]A,8!Z1>#k=B@?bg:#?\jBC#8iD>CtO(1^1D9lYZb&qn=J<6a(9e:2lHL37
sJ$X,eS9t_aNLrK-m*UX)5Gj'h"<IhNEVSmX*_G.2l:U2(`11YGuVf0ZhKP-V?(/:qYb-:m5
/\BB9iC!ICE#M@?,(F8E*DOQ45*IbDU`]A*@&!2fTNU_i\cAm/$&<:0okpRpjQ.KItSI0R%L^
.FfSCdDZ#g\u6dsZfbl5VZA]AY.?^;Y-^e8boq,@R[-c1[2#+G.!;Vb"*lU@(R_Nu_YEJig,>
Y[6^rNWX8b0%X;NJq>.1Y0k%RP':rNTNmGVL8#gmcZca]A-UT8(Ir:@m7K>Z!/ILrDKW:;J8%
\LhMNeP.UC1NH;^H/jEH?[?fK!T+?=4>H9K$A?WpSS4=;dQ"1(Kl3=0]A3S/q/9X+$$.`S)lb
Go?NKtVScD0*-\7/]A4]A\pZ6aq$Tp+7knI@[>':@6366"l*p<?mIb"Ad$;doHFLtO`P7X0HRg
ZVQ!V/iV:0jZWJBH/=1EH[+O2M8B,/p?2rUjCAc]A5nM%nm'9"W#5'b:h9`Y=PBWisI>]A;+Rh
HX=0>A6<90D#CE&F5FFQaZsAJn:qYf5.#!<h<9qcX5,U1F1ugaDmjSj'j<a?XCCa4JgWu0Zq
Bjgl@X^=s#G!>Y7kYUp.Rj)^9MTrjfZ<*kH#R."2l#Jg=08jE;rL1,>P\rE:GETJl$D4+35O
;4:dau]AQ0_u.Na!hk79OWg/iJc\8c-j2JI,V=p>),"r'g'0m';B!Cm(dLhk1$1HE.@(Tqo[C
j@W30l(@[F,?4H@B-BI.I^%hHiWIrir!o;#Wmt.mW./K$RpKG7G.MW$.S2!oCtcDUIn,@+Y*
p:V=RJQk98Qla9c0!:V:ma%4D'd"^9:I6_E<<1pJREl>kae>EWMTlD^h_1'H6j23eCnTg-H-
/Q7J4P^7VeU6)A8`00(-hVmd)W"4h*I`i.T'\>'_U>j%"&_Qi)nsmj9/]A&*67t?2*rAr+j=>
DdhLH4SYZ;bW(9^XZ,cp!JpVW3UY#]A-4*)W.5Dh9K"eK>FOBFLOun!M?.SkB+1W;!4+7^*dH
RA7Y!,E%WV7&hIk#/:Q>'!"]A7c/Z-O.FCfVaI(@pu&>@G(Y?T;4*'G^TEoT(aaV<DGEZPn\1
[BP;>9nWOo@Q6H]AhAg7KtliU%rIe/=FDDX[EDL`:9`KJf*@>1,/lg;n\7OjFWH[>GmE?<C`@
AE=jh`LRLi@E8lV>,_Ig0gU9W%&!rR=5lm./@8YiQNC;9ht-9-uRg,c3!@DMslpU.8a2YRJl
b*d[NR9_m]AN%a@Aeg2I#_8&Hs%'^1U;S080h/uD5q=UAJc9CYI->L%tr%!)>F*-p&5m.3qZc
AhaUC;[%e-CaFUua+kZJ]AI"^O)7tmG]A6;R>sTE0s9)m<II[,0`2]AqpiZ<)o(RXr#SF5qg8XV
Sh&'>QR*6/QS?S`@$tS8c0t(W-S-Xt@+iG3dL+r`rrpH`VMp;6uA`fg:qo8Bn,t'LHcSm!M]A
el-q1"n6\kE.gQ+8S1HFF,Bb&2\[O$XeIm^ZhSt`8lFDl;8kR1t`:?\=Ki7E6ABb3S_RMHis
o2]A:PjD-l.)/#VI)J^)I8#_:m,%c]Arj5h4o7"bR4KAmfp%6m>[>N"RJA)mK5X5$O5Ko4B\+o
d1N^f`iPN]A4d.S'\JPtR%e70E6<N*C[NndQAGObRZ,9)RJWGp]AMY'm0ZCJ'9$dK3kb+jlAmI
1B*JiEJY"dH*orTVp.,^^R3oQE^gaJjQBhS;G;;-%k9B!f465TS@GbmUM4j\9sj"T=Qq?ELS
3#nlRVAV+tlSsonFb!G34MZU]A)f>mc/2H4!QYp>j?r<<L(:PR\>J=W\]AmrP+jkCZ<o+g+Yt?
KuU^rV8R6iL1=pEcRcp"VSFu(Ff9*51n!@+N`enrS$[9ce^%.Qq7.gFTg-WHq1/RQ9SI@L^]A
<>_*YmcG/TYGC!AhiXC(q3BKZ7cO6tWrr:X2u<M'VI'O2G/CDo(o5s=Pm[/(D`9lehq:$;&o
e<-rAUFpSM#Dk@uD*aU^;.-g!f9Irqi<fthp>:ihK&ij._+clNSDP)D8%7>3gs82,-pBt%Tt
+WeVo[E'IHUZ.K&05#9t>+^n(q<KW?<nYbId/Si_2.8fj7OnJ=u7t4Dq4.qPH4?[g"nT,utg
5ctt;&>ojc\:3F-$Q+KABMW5?U4X(io=k(=rm3X;pYb(J6d.!+7.>M0?]AJWLYTinBKN#g-h\
N:aC'Q]Ae*r/.CrXiO?)Dq>P>!BsJ-)u-:@;R4rBK(Mgee[aakXFi>h(L]ArbJ4LeMT%hY$^6\
;j<KdN+$s)&\"Q.3UOs-8H2[ZF7RX@02F$"_2;"n<AJ6S4d=Lt8e#Vr4NV)%2B:.C/0G_bWO
NHT@qT:AP*><q7OfV#"lYH\;#._Z.jY==LMIQYm0=0kTbpAGB_RMr=RS3""OjL0:-66B'KC$
a[ki$WoFX:">C;Zql(.q<2e*&Q'F>qb]AsI@VWEnrc'k?2+0K?dPKK%[Z<P*UrUk]AsLW]AKf_#
qH^+[dV_$7:[NWA=+&@.Al!j8J#q-Lpg4^Pg80F`nR5.O1q0'gRT0Z*;eJJi8OM<R+BKQD4d
k,<@hG*/:pa#8Wa+BesQ+n#N$0Ko@I=A;IT!ngL`h1j$44u%=:`^d2e(JlbgogR1m@CEXo5-
/iOSY'pZJ24ueb(AlUB;T>RJKc@DsDUQ]A%AN=`Uu%W81Iqf&$JQ^S$XJ&NnCT/nQ.p\/[d?X
)GZLCi*bsqF]A]A3M2q>o$dhS&V93%H^-8m,#pdsj\M?Zi+mccrhZ8n:RBo_pK%oj<UkH^Xi<^
#M1VW2.Q%"6oTk]ASGO98[Dt:/G([mKr,Z1u_rDYO&UT!3V"V?n\@tLDLtie%*aM&Rr7%G)uJ
1o7,bNJXTZQQ#32T;'#pqNo$[,WI,GapMQAaIUHYDWN4laf@%Q;L,=keHM=2cmH?>3^"PZId
X9c6%m5n_gFT%r\muHH77h.c?S[Io(,`\7Lt-`KD&8208nEE:-b`FI3!@L,;9s=^2dQcH)QA
)NHtduI]AA#lEi9.YW<E-,\E#BnC4(4S$Zm@039Oka:i6<e-1/s`bd3\Dp\sb1X%efSoo7$.^
q83kcJFR!Y0\:qB71"uX;bOr>pYJsX-dOpO+@Jg6\l.OmG5g%[r3"T7e?%Y($GJ$6\>iZt*+
\k;IM3F>CS)2HX)h2UeihaX8NM)tO-/_!,(oh&1O*(3):/_q0=`%'r&7/Dqmr>L=jTgR"N+'
dfuhO%YJU8^SiAI]AGP53`WN"&I6u*k3hu_)*+W1"?I:I-:*SlhS3DnY5>*NN6)[-s`(1A[6Z
^%tL?bh"gJ&';bHGH_aY#WZr0lA4B@"]AMD&YeG!bV);7XFm*FjcEJ@f^XL)(@5u,E_@Fqc@V
d6ZBJso<jJ`a:grCkml;#)n.!fF\/c[a83R\CF#IE/He<bF[\^l=_R9;(i"IqVW+!6n3U0m-
$53We;h@WY.U$.%b1`<"Z-L`Obem>!.^MO;:UqKkk5EHZPFt0O:/Ai*H/\'cqe:MIW,Oib:H
o@AZ*,TWRrhj"_q9CY+-&9U$^c#54=9`8C.O%^2G^Xfme[H;F4jc7ZfOZ2TeYdB'Ar;5d(-?
$?0(Ac^0,q[q;FotgP+V9&qd3oFJ]A4h_/"+T9+8+88pSl]AmX!Wj]A:T[@aA0NKU_k_6?A@OE)
PtKh[jCmc*1VMi5#j-C"(UJL>Jc_`I4bp]A'42BCp[pnE+#IM$Q8Yg%5M@ueG0=46d`dG[9Ap
Nf5.LMB&1Oicg)M(e4r#rs6k&kE;P?u;]Af_cbfsX\e4WHB5[W,+bWq_mRPIgs9X9RuDB$3Cl
b"2<o,n^Mm"?8UnL)ScVk>NQSHTsRK>5h8S]AihkQ-js'DIdC%aG>@_/'%"?9!:5.#Z:-,\%3
QDg>^?<fhDm:S#B^c11ZE8+MdYe]A7V**1R6)cgB"go^nOQ&^ojjBnc"@9d)bW7Em*^\<DJr<
3QQ?$]AlXORFpj8_+C"XB>"gPXZMm@U8M1ua;$I+%=GFLe<9Pq*)%3nsCI0oakSg6Q;0#<pf5
OeFps+Hb>E_:qPb7)SE-I)4/k!^/6F/'I(la?`Y-TL=2beT`"6n*5U/7S+RG&u]AXe:<lRgtr
cON*dmje_Ml#qr<g+D1RYFa&;[L*NW+!f^9Pll<3u?3T\dZB#m\*^4s`*^]AbqoX3&=r-XZ@-
P&LW<S)Dj4T]A91M\_=IHI637@j(jP/=aMZkP[%7sNL(+@rogjRa2k@fG]A?T9M7jDk)4O_2X"
nEDa[:3NeL`gLHZ/`6J=P2$s&jR'\BBYT;QXkV)'E(#0bb&h9PsCH$g#`lTgd]Ah$HbWf_&qt
gRro2C_&c_/PD.Nd-u%+h=$huk3L"-g\Wa2$@TfGrblrr-:.M>WRHNjMIsTc)"%J_;=n3PGo
g'HQMAO1-9l#t/2EOO$Ef?D_D[r#2aU=JTYi65uN;YNR`VlZ]Aht=]AT\5\$;`a;k$=t8-j5YF
TN<W0N/J+?i`5>,jg0_NKOC2\@j3dq2I:sf+0(^<2a]Am\mQqZ;X"n[k;?#u6Ij5fF=ZDVZ_N
DQCf7oI"4RlOaU;GXGiC^oF<D^4(Lnrcq5-kb"uF*gUVHF14K^O`-%'K#msckD:;)>.qR+a#
.>H:aI.Q=t`IW$/X2cfUEk;'5EOH6hLpV&"\@-"gKS;)N*Sq5>4\K`3IG\^T:gpMl\J[;qng
Nl`Ym.`ueK5>#.?%F0(oRqWe$Be[-'ceQG+3^$D``;g4BGfJ#Qgf?KSOr27$4H^?P=W'\/I9
Q([\r7ZIUJS9GDH)H!H3/i0Hk.nfPF;]A.=ghNs`dX@Rb:Zu>*\k.t7U32/MNmN,`n^it)(^n
@`m`LF_!O'-,O7ols7$A@.r5%_`#nD=(`s:ULX"g@;BX^pj=Z[Z:&:KY(&8eYQ3f4Wu?8URQ
^_OPkV0]A6X;n[6-6H4Jc_e+seldMdJs4IMi]AdH%urO#M1NKpR9d*I(0:PRB'2"7oV-f\3SqN
!2@@^9j#*0PZpc2Y=^3D#AtKDXD"`m3glVf8@rA/!"\QC<Qp=sC,heou_fRhXb&r8]AF;Ak'c
B_4[.Er/_XoL[M*Pn'6[8+'"R<mXa;*l.At4+'\:!.RrZ6R"GOiHb.Q$\"=(9k^31MX7Q/V6
;8#Va%>O2q1kIB%S3ukZT:d,8]A2et$J8`hQc-^,D`%VO]AE#?F=ae!MoMc(aa"eNFJX_"c[-J
=CFT5&rhZ"GB18K15e7'Q"oK/utE4566.=r^.9daQh3kYZNr^Sl<G99oepMqAr^=_AhgKQ;C
/arFt@(-XFUE4\tpMi/=LKfHt9?7&]A%<"VpNZM3k@:G#V48u6i6p-W>S;4ZuI=;c/'PTgbmD
IbY=^[^.%]Aqh@%6B_QSU&Fs]AV3)sKL1Wg.OiIg\(L6e+l:H.iU=;P(6P]AMrlR;j<'Ej4*-?_
HXVO*JS00i!2sIo]A=j(c*JX9/t_>'J,;"tst@"i3nS@,.]A2*m.cDg>uj?e<Q1.N0%8Y@1Q5s
$bqiIk<XWT90hBHguG>DNVa*6lCJ6N("6%Qu]A&p2<"P>=T5S\B086]Ai$<*/WdgYQp0u<8I"V
'aZLuWCO69/knit\f2J"$bO=_E0n\krLNK,*fgHQE`HX'ENqq5,l.6:?uNQlPc_.i(a/FP_#
QPh<`)%#=mM$!iQL3'b-^33R)YF\kK&!6kceNZ%ua\1V"d0@O\PnfD4a6j_eBtH_AA5fL3Si
]AIspt+MX"6cRgo5e!GbZ@*#Hkp`[EoVm"VC\Gh?YQeijU*MiRbg8#Ho,'EA<;LPq6(-aeZog
1:8FKA'r0Y[)d9F1Ich;hU*?!S1SfF^01/e*]A./&2oo?R*kIb$^D#[=>S5YH0rOJls.!fnpk
))Ti@A;e$^N:4h%n*8@V(_o[pE?PVTh?ki;GI0Oc&RS=HPp@o?H1t#-Z!sa2UhOAXhT6NWIZ
/_4$?Ks)bm3Xr9A+uPU-&cgpL@+b#SG>+3M?t+6rls^]ABZr<a?FGcDG-Cbe,ju*G1q2Miug?
HMK0Tc_FXfgk+Xn:;hL>8]A=sNG+#Bh5)p\FW.@l4JkbLO=%`1XY.Ltrf,sdL>g?%qZ+uInnB
T$;M?Dj\TtYr&Y"qLA-s8095s/gTkHHZeQ)\e!,%P$"n?%D*gh0<OguMe5E:upb`VdU9^[43
$i2083Y9?Z?cBI@B^G[0Xk:QsU)G[?IrCn5^Hd?]AT+?"ggJ2:o9kMns'!i?.5R-U0E6+(V^X
<<A/jHil>Rb>ck);^E)AG'Cd_MTsRa:_7u\IZ)VG.RP,RtFRER`(!;2ji>Ea_uh)DdG<NqeY
4[LItR9MBQWB0'GQ_+'48Wa&Vo2Oq<\u3`#T8X#6fB$B'nc]AJ2A>NVghiO2RO$]A:4-,MBM>!
h_]AO5"j=<sRprlU@fk9A)9JTFO(57N<qMan'rMV;^r,AS$<cPuXlbO#pB<IeMc8L/_2j?pDL
G_=Sk?3WYL;o:G:;r1kg@/1&gF\Y>hkg+jt3<4K>%%uD5bogU@2!^d+VNF>5DM??`GKW*X2J
]A"mXN_p#@JupeF'!I&i2J]Aj,tig4hMlgLXejH':ao;rd&mpk5eeh]AJppOr'ZRe<VkI*+^For
P-Zm``OR*OWG5-N$cck;6o(N,$<F@2K*+Bar.J1<%$,O:3sU&nb*jml7$9`r*+<BSq2OfS_n
mFH>Z:A>jRZ-4THGo*msGergqG$;:u?&cT`spmP[lQfjGp;>*C<_W/F*]AEXD\@Vb*dq%G>&K
$k1HKHAEt\NLQLXZC&;:r2^'@US)Z0GD[X`r4/3VDdkq`kYC%,!klnp3c9'dh1$fIr8s^-?2
5W$*ok_Vlh$-/>uNe[#_>-"CfS)@R-&;^lKn&LM#$SUh$f$tr(lTL<iFb^?`*gH&g"cDLlrA
b9RIif>K>WVK]A3!cJRGJaAfc["YN7s*3:"+N^4%,Zfn[""\``5BJ7E5T7FVnXbh^B;F0NPR(
K$jEPTr(U]A>hS!O]AI[UG1+<7P]A`bD4k;ackhA^WDs"emK"3n9RslleT"I6rN4SS"RRcr48/G
uVb_!I!'4'E9#Cd(O]ANd)t>_?1c=cKDH1pZD1i+-$b2.D$^.6'A?i'SN'ZY<n7+1<1%*^Gbq
-4"lkBbh.B6G>ZS$[!Qs]Al:%8_Z*XP8"MNe=:"KL-.8`7qq&L\;6nOhqekP%1kd7e-4uQZ9;
mj`+B!,4N+LmC+'j+%4q&Mt:q?h6dG7&1E<XnLjKm*f?]A<t+9h4l<dE1'P"fLVN--8"*pHH6
OG0Ae3[3QpBkBO(`&79A*N/h%;0T>fTfD]A2foBC`XX7ji61;AZm$Ui&2gMMp$2"gY(`WChs^
MuZ#met%654G39@l9EsG'/f!?c:UjldOgl]A(BPKh/kYYp/?J1c[<j&Qu#d5U[KL1cEB\7,0S
)G0bmT&G5euVc43NiDHaH]A?PC1)?sk'kH>Tn7`[M`N'"rRm#$&^,CL:&P2ZAZFgX2#<gF?P+
/"u*:1pIMUr+._TIiF?und4MEo6J7/iA!E]A4\2+4pKTgi%-Z<E]A#b1b++C]Ai"X49(VGiq:Tt
kD>W6mfG9a_bNQ1PN:IH!Hc!1,F8W75>F&YHi>)YjBII@0iu_Q=3PfVd3"[<1K-C1/`#P@Wo
IWgaE@9M9P=?dKiRbknBROlB.oCuUk1mFG9&.E)$c)IP32NWnuqgGINGRm'$`ADSU8<.0%#a
g?*7Jd=s2,.)@RrFsB$;Z@mZcQCg<,o!./fBHdWju%mSdO4hj3B!\Z/BeBQY&4m`I:?]A'q.t
i,bX&-a6a-BbFEn$F-NH7?Ggn,2;9(-oa$Z^$YE1lWSUV67kL]AKI$cuTZnOXD`_0Z#_pJgk:
Rc@_=H;iJ%@HaA^rkO:b-$O.MhBNI%YZ>pSVj&_+:>VMe9-`?IP0q"RqK(ob?NoP&\,K/hH#
taqr5:f`1!?m6/S-05`Z%(A=a%,TWD"eYhiE,Bl2G;X0?d"#?8=-ne=[nXh<")6pJgXQb#R8
8S$r&GYKdTl6@]ADsK=roi47I0(r8^*<#lse4N45KE,SHHsGjcaJbpCSN*pe,I8D#dim#h>AL
=)Jh(Fh_hUt^U@)kVQ!SS>"C$7`UoMgZ^:(s[ma%!cH@'cA-3]A=1Tu\@K`T9FXj"PYg6K;dl
#$a+elJR6`JGI`TEgonhAl*gO.OUL3&_S/>#S0:l!N`0-r%>?4L&]A"#DJoAE]A$l*Ujc=%Ck^
J_ra_p_Y9#fr&IPoBfPb]AM3+WX5qoo@#+Fpl^Gu9_KJ=WS]ARMR:>qXiRJ/4-cJ:t.,IVHKj2
-I.X$se0(2e=r4!S`(['hghGV!]ALWsKm*Qarri!cGQf7=UThPSp!?m21gk8QUgdVmp"&9AhS
lQCB1Z.cWH=$aEL\R/^qs?6Z+sn3ZK.KNl&/n1sf`0(B:<'=FDqe":*J5F@,r;n]AI!\nKNu^
[t^iKZ`>sZ11#rr;3fjUjlB@*Ug.6]A)US!#3@f?#>81]A^H%=NGTtVsSW9UKJFD*BC%InjrWr
,;4Y^1)`pK=6#bRl1G4M]Af!&$%qiK+^8.fOhUi]AMN6o_&>uA"!AP$Zsu\8,`AG%WgBI8'#H"
%B@LX!56MoQK"S1MI8C3nOf5#gSW_"/CJR*X[j!abim41A;[BT,6H-*Qm!3Kp_"=>HLke\.a
_<h*5h,('`UqI2<28;.jLX8oRuS<Do2X2]AbBFAs&ND``CInd'7au@-QbKQ9rA^k.sZ3V2Zs:
3W5=I3B%MVu;f[GMpPYm/,XAuBRn?/VS:2hK1(9:DO#+6NS2pDe[HqL9D#BukiA=:#,MH!9'
cASS^,cDL`*QHGOGQuqCGf/'qTre34#Kl0$]AWGHe:?KG/q'qo4"("8%CC.uXgQ,3-DjU+J*S
Egaq29o*BYa1VoBqkfeX3HQFD:Can]AQIK(p]AQ,Tier8qO';j(uHsN\`9K\/m$S/\*k4r$dX&
X!'<sn;[pHc*`Xs#m@:@p0NXsk/?UG5;4Z44s2+7=1h>%e3Musj'I0\^*pJJNW%A/.>(48I8
87l<^/rd[M>t2JO<^-ZYp@eUKPAX>%:m_G3KPKpZ*Bb_K4COjdFXmfV/qKI-lY2l7tCA5m_K
Ed+o8XkOf(GK3YuEOh4q1iFDUp-^mfDleb2>D`)nmiR:PM`%V56m'hN.?,L85T>uP%?l=;AD
ub<9"U`?r1tDsC_C>]A)!UhX9CnCXLRkr)r6[6ngkd]A>'H%S!(Coa6&qoZ!uH\G-GFe93$%D[
%d[E7Y_>'k+UJX_;XlcctE^sHPnXKSJX:SF*[\CRfi>a[:PH-YU<k7kj:I)OtbnRZ4+)4FL)
2!lTR\^rkUc:m>=F&^$BHlS]A-Rj?1K)ijQu@>CZ_OL@G+DqI,t^(g#grDl*ke6Dn3BsWs<rL
$/.q*m-ERN1G`Ne5's'BE0`G=4\`\pY^2m97IZl3*mU<_J<opNeEZ==!ee[?tHH*Xnf/6-f.
!R2&Ip.[%T&B,XK6[rDD[V9pRRL^ZX`11)fGh,@0u<sabgBpgJRT%VL\?@X3:(+g*?1K*%S%
MKf>l%R)-V(Ut1!HJV26#'K*TljW-ba1-+PuPQb_iA[\pZp\[2gl+KVYA,%ii,P@X$QrFJBf
n(FQh*rGVBL`Ip15,=XuP=&N&qKTRY'X]A2Hi%bKnN?&ZT!t4bWMehu^P*b*\1;SGHncq\t+q
r7/n#QkjkBU3Bo;ULH;P!VG)0Y(/H)!F:]AEZ8uSB!M9,"T-cXY-qbTl.'jV5)$GbH6`Y;Z]Au
iomp/suJG..$QcWe3O41H[]A"4j-6B=VAR[NM+?8c+N7<C:7!$Bs:dC?MTIbR8)0j89XYqalI
GOtO1a-:G@'WPL,@3RmUEY:jK=V"DA32+gglMsI'Lm*%Wmgh=$FOu>1YXsih]AFTbTOf=nBe]A
:[gP/gjSrOe^.q5,A/:AfiuH_5`F<Gf577%THWAZ&muj7t,?i"O8GoS,$d@`nuA.+*;lbiNU
pH0/k/:&s]A<L&9o[nRO\iO/YV/5gt!bD2a)?[,%t&T<u!:WWA#A<=!<Cro!5A\<2L-`\E`If
5&eMnXTKUC"^2gj-no8^[ED^BOpS[8#PSK,m`KWM?s'7-%6\G#)q8JH,@18ILE]A'X)#%+8pE
;ea[.-Zb4-gHGV0a$$b3O43#Z!IGM(HKDmsKqi#9BWbAuW5r9@R7KmZ0,XYjG6&cP9q5b/-J
)$2S#)7^(^NaZ(iGGg%rS?:K#,WX(HGr_b:OAEDqtrZ3P+VoXL#Lqo0.Sn#@8O]A8ll73?d9V
fnc[#dY'+Bk_K[oh@6E*Zab9a*oE)QPaE"bpt6t&$]A*#:R1YB<_KpOjg!bsbB?&`Vn_rul=T
;;"-3c9`<fP]AqG2DG4WlngqpCg:(]AhQ/K84A<nQ?N>FfI$n\-*H_'PB%A]Ao'Ld59$f>MKEM2
!l*'+JbGXVe#(/,Pd_MM"IB.ien%YP$H@[q]Aa>tW+Ua&\'R/uiaH-I3I?F4Kh04SZJ#@=%[n
1Pj^W&M:,&\0fWA3(T"`ERU!abWDcA0_T?JXDqWB.f!E&iOPpqK3A\i=tn&WF#O"Wl!XTK0L
*cu`:Ck%($:%IT.9GEAM,`C8fZXP5q-F.[^kFGF"?2fO!NOkP12_aOnL8FZ`aXZ8+tV322bH
=:DP5Z?qg?'(-:&JJ1LMA-KV4@$20"*o?bB<f6K4CN(N:$"R"6Yn='50I>WX3u#?m9?dOUet
KaD)Gt-Lf]A0\,Kl_B^`NP!NC'JeL9Kq:#J(BdI>iO!L:ZduRB-V^f`dg=2W)qGRJ&6a?`81E
nGe(!,(4!VS"+DC+*a]A]AAk7)<;T8?g.NIilo%"Vr8rXNU:%LccITP+cGPIt&c8EY`(F$g"&)
9ag&"LPkm[pq<%&nd'#fp#iUtg5"D@6/nh[+`19M(i)IUq=Vk..LR$SH<SU009%^EbJ3*NL!
<Ug2tU#EE`#1k:3q/:U`D=G?nqe>Itj;aQ&!/`9$Gq*h"fn']AP=]A=1NR:%h:3E*FIeX[&TpE
.;,p1q@F'NEY9k'b0V)f(rOWNZrIc'W[W^n_VBs/=r$XaS4J'Ao0qcK*<V)cFXeK6HU'J78J
ruC-?[r-XY,5X,4D9E=$Z+&L<ApP.3P76NsZH+[KEmN6H+;RqQ8Yk%[-HE[QcKLV]AeZ86Ztd
n^WQf<cqkDg4Ud)1RFWOM5(fL;?)(5OZqcle<1SU2n%b?FlG^GrY]ATGAa[a(lL(S079ZBoY'
q-$J,\BGq5M(>5u8ec<=9YNY+8h)XOZ7KO`EgT1MY0U:*Q?/F1N2XKNB*N*WcnWZ^<RmMZdC
Oj)rSA%2sdDp-b7p*kg<F9AntLgXV6sR+@(J;'_E,k#X`Q6tX!/No*74+YGZ<P64@7V*'63F
#:"cdm8EP,'b3q!tcP>$F!(L@Rl(F2L3j-kim<MEJ$;1qR]ArkOOh"Vp\2s_C3ZIp8jcRfaY&
@o]Al,HB2FkWT>u>_(]ANM6HU-?p!>_M4)X-.QI1[0LZRcF$Cqr1&=62gIk4CI0j)]A/-8lMV1:
;l7Y?k*WG`fBq/6M).&G>i3)@K@rmUg!HAf&cWq)mhs[*'=EmQOeQr_/g-n:6pO#%((^KY!>
4Q:Uc1Sc$QTCb,#X'sV>";lKd),!K\dmu8-pjne,Te8=8fi$kPr6]AhRch&AF22=bfnpVch#A
0B%G*XA`+Q+A:\"`Ul.Cjh..>Ih6YQV3+>)a+\UeiS;hQIK#uDMT<@kZPDr;%L=l=%BZRK=b
<deFS,92OoZ$Rto!*(uZ=$DjH\0qK\Fm?s/--FJ]A:J*u08?u*,$lY5-ie19Qr+D\jg@(G_e%
mt"@-58^-"=UNF.(d^9Ul>S=Y-"AR<XC"7Fga0c(*lE_<jjQ7B%6*Snu_48p_DX*L5(7Ze("
;B9TGF2[_VSJq;N#t"f_95]Aa>Idi&]A`$eHZ:JV1=S=.KUC.CXmU4MAa-cKV'Q13?uRpr)d0.
$T(G[(;Vp\=2!U%m)p/EBVCncds/Rbj[/('!1e"Y[^+r3^F"4ut$h*=J&&s&h^!BRro^+<'g
[iKo^Bjs:`=&e(u@\)ET>f'@fUBZ3Gq_$Sr:b@*-h+#'s1c(jH\]AO`a9nCp!Fm[A,,0/(Le%
A)F-5Qf6.rs(*X'?G&3>[2(@NT!7JZ'OPHkO,^#;!%uN?)Th/n@d%Bhfpq3V)ts=gS&_No$g
s31qSt\1,'*RT2,5?*i@-YHRXmd8CbK0]AoggWdEjcR=Zl$Cb.0'<VUM6CQWFY+h6Q8uqB.d,
P0cef[7Z;Zn?T51?%R)]AZI/Q9KO"n+%t`]A2FWpS`*?'lulspSH*>+@\Ai.&Y,$nVg^I#@051
?RHJeE+;=m:&;)p]AWG:,AUAIR3bu>SQho"&%GR5sN2L1:XhR]A:2']A?o,1.[0pHLp).Mr"^d4
:Ga#4XN8).X/A]AMNNLe71_^ER\J]Ar`'\T-/PER4M8r1-a%+L6EE9Q!5EQ`\A[pXDN7"k$KEF
OrF..@P:9[i!$(K:gaAUn9d\o1+/mW'bc"nDo"\kDUA&S7;JJBNVB1cKTNEMJpSKYRq(aHKT
0.8E:FXk'[$)qZm%s.%&BTLM4e@5VJV+#1B]Al)9@KAXH'>O#MLRPpU#tu#`m=4V5cA>26*KB
g[sdUSRrVQ4/,4->3`t+r1pDq[6]AqL?'$dUHDJ&@1u:ib6Z+[^Pe=g)l7Pp>!=:2q=$Coq)2
Er+>jd-W>=5bEr=(Fds"P\=(Vs*E$1,F`WR_B-=-!YYN8FT[eMs_2X%pX%I45!@Vl\\r^,$Y
L6([=iP.,l<g"07$(cR#D5@E:[$Ga0OeEIi.qYQF)NV1tVZ\AJQ=LU\Q@]A1Tt")o1u\WZ$2,
od)Y/oG0O[;csL.brW",:oMV)35@Mc)-ee863GprOn22BJ@t<[li[7ZK9.)?3<20WacK:i[k
<uNPgiM:VC6V?O^XtN>R=*iUotqP$`0B'EHt<JkqIXL_`LTDpQAaT4]Af,.ImFrDCVrOUWL2f
j)gn-Jp@f>\6E1Ur=6jmA:7c9^@3!:bS@(g"3498-s4lBioM8aUoW]A<QdZ3?@6[Su6CW!V*m
J\LfYj$E*Ip]A,nRM,'GN9H#l,]A"P=!Mc:8pl\LE$")A7orVOA)83!YSc$O`)PA0hZ`NrB?3(
IYm+Jk)@[Ni`HUEi"M'^6*P8%&Cc+ur(Q>%E'Q&d()[q2hS<H,*F3qDlKdFnp6#t_?L%gT`l
GKd:,CLG1;.#^JLk,?rdGS^`j_i5RUBU#>DaFG,ISd\A\E0%F,LYQ?UQ.6E0D'bt'BfH*csZ
Wn1;@a'fVE$DdUg^Wkn1Kj(0&0LA_ZtqVqJMH]AE(f4+"a?kKp#L-%nH<,A9"m";Ngl<OJR7H
%\lP$'tU0@J`O0?a2L26>]AjcZju#B'1%1sm*>[+tb7#\q5?[>#SF;I@#$:HdcMF^I:)O9,`#
`qin#'oD=C5u91Mec,/)8N>MN8L5>19Ncbam'ak;_$X=c4M+/@Le.UZ9FK19!P@-Wec^qVKc
iY2V)/a,rR#0=\$:7'Y*F1o,ur-o?$'UCi]AcE^LGS]AYQt\OnqLQ?Sq.R^Sc.H%(^Xro[6oKf
.'!2p\1MLeD-`:^Eqjs]Apb<[j$mB[H^YiaRM"U9$p6V[l<J;A\$T24/`ckW$LV_O;GQ45kO"
7Jh]A`]Ag9^m/Q/1#E'R&$WRg8QJGXhUZSfPr11MNm$Dnk>csNj%@V&*Ee]A8VskU8X9)A!V9\4
ld9WVheO!'4$$2Cb!JqGW/`C>bYR%DBDaUA;0*.):?NC.@UDoZG,B;,>-T!PhoL"Uht->[R?
T2MB5Rphp%ZG!Nqs"55k:#h!=>nD%Fcm04^6Okf1JQR3paFl&WlqL;S8b$?'G@f4J#H/F5Je
hd[)n<qfo-sb8jq!Y(-$@bM#40)[^tQCespjlS11u@)hVSanL,(4Yq`+JmZhZ#>*j1LlAtB+
,<3AmX50ld#htHA?!WV&l9[,.fU`?Y/I22b)\l/%#1M$2n(6IlBf<J;<haHm)Wp(27E8_N%]A
U,IT5&1`DIib`$2s6L+q+Q1-<[Y?S)2*M\(6DShjsn-:+h6Bsg7fEh)sPV#5GQJR9\aX7'WG
h]Al>@ap*tU6Lm;G9>6t4<T:'3:>`se`4-Gl!S7VU[DkiF7W.J):]A@RFK42gP%mfsW'DbDA*V
YC-)P:>,[cMeX@q'a:]AqoCJLKY[j*((gsF(NAP`!Z9!@X`t(T"G$)P[\%QjDml@akP`VUJ"f
fhfd.$4$3kqFS&KYcT1F@?5mO5=V$!(nS5t4<mSFk#9^e9N9S(=1SFQ]A0W^QfMnD&On(8$no
Y@djnc;DCf-5#f#c.#!*pG30Z"gWtdX9sJUAS3,Gi6V;ZhN*BfD[@([(nhYMdj?P5IP=Qr%g
OG(1C#l"/QpncGe&]AQorT$FDW&QLk,t?3t*C@?gHokH7K><NlF]AghbqBqV:fsKdsg#o1ClN$
5hqjbgp^uKpCAAgP&RrHSVaLA(\2%(DbJJ3KmH<pb1D5c2AP*@^]ATh1A]A:U1QJ;ZFNFN\PX<
4(FHKrdb"c5k:Ve$3#\&FDB_KSGa[Gu*MAlb3f)0mkWkGNRK[rX=bf?7<P2JRhp#-5;UU,9q
=JX?C'#2L]A#DRh59MMm0flo[q0eZunpTGWNiU[aMb\f[=UBa`kXQHME&Jt)JSFWU-]A`sukUf
:QF'Vg"*rh?aZe-A@_$^Bd*)SgVKV"k#fVrVLJR5"ied#(TI"fGab**H7^+VBb,J:ZI>g@o"
:9g_iVTg6$"!1F1]AMf90jm6?5G=Z,bg-gZ:9%81j)SOnLNth+;YR($nW!Pf__rL6-!hPsAR#
U5Y>$gmZc6Pat%$dlbjMZgdNuTYTjUoVK<t5XY\;F3f;=++=0&khH*MUt'J:m=DmMFGQNb(n
PGT=CG<iM=nuP30a[gfb[L#IfDap'2-d1X%>oKUB;Lk$0!dI5^"L"Zb0#3fQO$40=p:id5r3
J^B`DH-EF'p]AghlW-(9P!KWe*^Xa:tT]A)!(oD;VBlkW?tG$1VlE8bs)LOekie?6ff(1KqW<f
W,D26bYe'g<,`(+V)VS$HB`$aQ*cp7e-a1bM9fOEJ=b7?MC`(;U\i85Mkm`B6nK7'FFbs`.0
AYr=#2XQTa.=rM$&J)1UBJ^(V)Cm@\!aTYABETG$l/"+KG"-0ns[al10:Yjc$PpS7BI#pb/D
ged]AL0iQlg7=_6K&o?*u/K2QVp%FDdF0,"s1`&Uf]AuV+;k_+K]AF^tJ]AI#J!H^7&q\oB1Zl.)
^ed1C!@E*$@1:G"=C+BXU/,7\WJR/J.%oiB=D94pq%iC:<M`?`_uA.Y%.*(YSVZ/!N0IjV@,
jG.cdfY?&7.,-2bGT$N8nNBJMhK%(U&Z63$u%0'bfb@msIDb(kO\Sl;iO4XmR[Y'<D!JcESj
[pBnj>k11G67_Y"2oAu,;H(l@g6r:I'[(M]A[Vin0HI^M<Xc'+q>3kWJKr#7F[7'N0amHVRc!
)eJF61!DXpOcTpab$_>T#pmFT;fHEtatW9VE3:aWABMQac/9QdSacFbolhgh7P.k$WDc1]AWJ
;M7#2Y-.9n.V<_s#/VF-7+$N"ccfaj^#V``l*+N\0Dp6#6"<KAp]A'P?4/o4'AS;>po.m[g4A
W'?H*NlQDckP4<s#G'Cp?qe&[1?=^D,5`NEo6doP99(#uSB[?g(:dQ*88WG]AAuSYj@R/iB-e
\LU-O8.:J=+`7N3X3)H7D;1I:jDs!HOR(XJjl%S1Wg_Is>$^q$Mc1rafPgFjHm\J@If`"c#/
3*J*N7fkJL&Y:;+9(XfU^-gY$;;AOq*,Jqi%<f,8(O5T7HQEFFV+Pg*n[1(V84cL&*EUG![F
`ULJ(3FF2MTshknBFcR"R+HUa&M"s>IJi1Q\")TWR5`Q*ESC.J'a:^:EMUIZBnfpNfnfZi?U
F!L(2_k(`eg'HFX.:lqjP*XqcVn=_0-OZ7l6@3DGo`]A`7%,iM6]APO(n./T7P>29$P89+(mBH
':aTV&6(<a^_`(@/1d'u_2@kZLK&+&$9Q?9^ckD)":=Q4K4-QM`p-%ZQWm+"N,JfjPmc#l_O
Qpj0g?.XlE\$5<C1d)nc:dh5&:*hR[:nS,*(6WAOPq=Zf(S(t]AJ._+4$jd@1<QMYa]A_lE;2^
O=Rolnh]A;qHY@9a\M19N1EpacRO.;(_!\-3F[)U#H^kEG[6.HhRE'XCEOLSTcSYTT?M?8+W;
q8Kba2?$NBpQh=3IBrEmFQM*:_F-;mfq*IkTod#Y\9SZ9^Amo*#f"Gpf]A-Pe#iT*_bM(s@7Z
`I&U(Wb<EK)]ADhDHWQY`;1TJ#9^'iDCuQT4+X!DG*sD<d,66\-LZJnBfe,=ZkpJiK4N/CQQT
mue`j8,He-7QOhs7RO\p>>YEsCKDHf4tDdW\lG#`N+KE^,mh[N8/U3S\[%OCW"1?:"!F-<_0
12WL["H9s"QAfrX8?p6Cd"+)9Cr@b=(o>_c8D"K<*`YA_(G![Pcfe,3nc/Ljmm6EQeN-#;GI
,OX!mrtC;]A1F:ihS]A.:!Ii97T=YA.(OH^^\5-J,XnI8C+=?JH[r#/QWhPF`=t_^9!jY9J2:4
a&_uNib>N*r86_dQ"-PeN-[,ZMWe']Ag8\MC%>aK+Lo#^=8om+2CI2U?-Y/iY0m-,)(L_b39a
Pe'2pn`t7,Rp=,>)IRR5n>,L`ELkY9U.8Pi(W:pQB*6"o1N+tsZamgejEqNY<BSj41i(em1j
a3P3d[VjLF92B#Uu\!@,a@!Zq0m;8cZIdjEnVlgD$6<]AYNf:E/pHUQ0=>-E]A%+mMMlU"1cHV
@$)!\UOT[XYZ2mV[l1p=FZR/s$)i;Bo;2>,kIqPaR63\6g8TT\W2oKWnhK&;3[;[?(cb6E+7
55]AQrHnA70fUP66mRkRcY@rm6#_m2\Gad1L=qL^GOqu)KgCo?Q>hgNT@2N/36g^\0r/ae(<$
(#ih_-RYe]AkDq]A+b1LZkYuH>OI[JUt-oT@bUc6#k0a]AI1-nogOaVQZ)%IPKb`09B$PA\K%a'
Y6^`q5nG2#JUnW(R3n;m'\S@//BiT@"0Ud8(T)]AAq1e93TuP&?9]ASVR:m/^4I/6O30KkPNio
T.cXrfk0/n]AS=kP7$GF#En#n<9HL-[a>T6:?IFMNQXcpP'`FQ3Vl3K%jLm=f&3&[iFG))<^N
q'9*@78UXk=Y3>A41ZJ<fG=JKH[D/0lpo3X>;SKUQ2n;f^8sGEj209-Q)L6<Zq&()jrne8UT
Kr:7qPfH"n:X.dm&dX8E9<p681EB@3ZI(CeN[b$J3M?/%PB0Cn(&D\e`cY=9&?I6jlA>Mn7@
;RLBOjkDqKkJ>2&RMm"9__>B]Ae=SQcWX<ShnVdP8&qq]AF&N2^@BU,QV)Sk^7W=Os[_1]AO[ng
9'_FkH/EA5eDSA/-8')3>&p$S$0D(D]A;l>\X_0Tp7)E3=-Cd>N>eNWoo'Q`fiiC@>*;@hLYK
1l[q8e@5W)E\tR6qi`;*;WR>\(sa"t/B.cun`LQJVBYL+N.=A1s"'6j_/[kmg=+?\>QO01s,
G]AD.!eaTU0QK?9de=795;q0+n*C*00h>.cX9q1<B_+1.?]A,t2O;&O9`]A:U'9m!`?cpkQT7V>
c=)BJn?WhCPX!,WOQgcBRr@;6'[&,Ghhboq(>^&>Js6@Adth!CZ[<mguEjn&58=WFuBei)pE
LBXpE6#]A^9s(CG`)`DhFd(,4()[3jd[jO?'\Y<QJMtXX4amT6Ss#SoLqtcJ_u&%:>SnZ@QP3
iT%iip83sJM*I]AQN8]AOrS4Bc(BE:Eh@s@!GI1&Pqo'#^mkMe.b5?>+cQ;B4/q9HOcd,*7/6g
&/4?O5Qg,O.pL<f_jV*[Yk!gu<)&nC^TO(VEk&Pm$Hq/B30%eT:Sd8U-pFY)R!*!bb/EC3>E
<4jSkW:i64;f,hgjG$(h0Lsquq1mQXUGprc=OP.iQokDhs^%):$o@,F`.$#bSJ!'H(e@QkW>
dL.F+1*HsH:scjF`(:Wj&k59-.!X@EH-=P"Pk9RP;G_Ua8jjBg*G66[;aYTT4L/crC^$27^K
\`')4o:*l_!9gD,!0P%]AV5Fkq[:_pH^(C)K6;Xm.G3MBm\=&sZNF^*@=b!u4'HU_30/(aQ:2
FTG"ABA^E0GnE_nD/Ke8'EZ6n*II4;[SAqP_[:m)M(3s=Z[`)Z_;k8lk8jo$X"GP;cCjON<e
U"l-.>>.2aJ2AjfI!#r5'Nof*/mE1u1BElu;i8lWT*o+%[[]Aq\m*,3R>\0]A9'fT[rU[,Vs8Q
`I8Y%_PTBlm1$YbE&/F#n55[pZSd`MBBD$WC"3E=KqV7lYn^I6_rAKg/QCVA_^,`+BVUZ^jo
+WTU5@uj0d/_7ISFmTD5gNAG:^mT?hh1[QW5r506]AI_r!*$0S=c`0DNidX2ctI<:m-ikWS,#
c;`!!@bg2TYsaTOr-a*;<^%nWLN]Ab_Cc"\A]A."_$8u._n3Z>&OiSQW+Oih?K+c*U&u<>TV.=
gkF<)4p7kMC"QkZc#&pF'Jd'CnuAWd>V2b6`glqc*^pp]Aq@=(/,"qT8^-L24-f$l8^e`Pe2!
$:2U4jMea'p43Med.;l>ag]A2s7.h<p`9mGCGM6'c?S=[B]A7+^#5:pdnl-0gN^:UR!kd:)+f5
X6:5(LKeDLCf4Qa%^DoH.RH,Y;*M4)9eBrp.HQgZPm8;b82a)4:<a))1.d['o/Cc83&Wi@2C
oWmK`p_B>D3UKV+%hd1E6pf&A$p;IN4Nr7A?me2/DL'(U*8e#P&0'#>)7H=fHaosiGAo1gZk
MARMomEWV(DaDo"L40BN?2nM&Y.)_p6.ab'sNVJ*3:B>4Zl9>Ci0gDlDGOl51CcGc[p!F2:r
G(%>tI9<cLL(B?NiC$u`H_O]A&HGuuu<QeTnfd+'Co9anAmkLF8"9M/&<90NY<.(^VAW7^=NH
6e1C2`<Ik_3\SW_Zd2EYlH!)UW+WH[Rp(!Y9("Fa^?8C3%$TK);qZ[c!Qe7!H6;E[%U.bXqD
C7NoO(%(j;=L03>-hl9c`ZTeS5I`/*@D2ZscV#ob:FJ+WL`enCXYGL6pVU7YM(Bc8!4)S:g^
aP+@B*%S*kS`Z2bMLEC^WNnqb6fidHJ:t@dZ,FFY-oP2.P*mF>u`$GFtFpiG@edf/;+2H"#]A
;Dk6Rce/Pg%kR?pc&k_T@OVlf[!IT@oi-V8Y+QJsr:c4!jtcU0%B:<O$@emt_S520C:;:7>L
H=l'I:RkH?fWXi_P>FU4'[U)6UM;1G8ITqUQ.Q&[hk`/KI-4=s.akTtH]A<XlopYn%U?/jp[E
H&uYJ`0f!W]Ak(%jkPs_mtPkH;-#LBA$2$O(\_7C*N`K2jO$?r\$*Rg!5X[#;,p@pp$Z`/0+"
HYN)gUc)/Z>a?QFsr>M=sn]AA5o9ooMXPE<).pi3pj%17]A'-Vdd&R^%^l.jLHX)?&hH;0W]A@9
*udVJl7'5U$Sj?-Dg760&C-?.68@Vk.X,MF))hfB;3i#+S0L^+7]AR;S#9`i)Cs:s]A0:*)#N!
)4s*qbl&&bK[e'R@=%%8LMs&aAFs/f.ZNgg>>RWPKKabFnH]ADCeK%3+NgiS%s-kMZq;lt`GQ
I\p>%_/3B&0;Z=V+K,H2IB%B#F#fm1Q:(RLOOI$`II.(6*\'M9gYMS?gjf(G61F'"J'S52V2
gbpqFc#Je/;Um=3<:<7gn=oC+AL9/g;[?#mVcpiT)C6;1ZK`"`g26*30I=nuaK]AMpR4+>gmp
/Ah!1C_L2"_+2p0,rFeR9m9rMu9)t"L=(?/A(Eju!69"n+o*5gI7J;Os19krd5%&-R[UHRX3
q]A7a;!R94#CLZ6i7X[*#I=!Rb+s+%kSW"Ak"WEO2ZOl;?iH`(("K]A`m".(X]ARZ8l1r5bZ*=X
GKg_Z"aY\Er/?93c?U%_Cud.,DA?JsBa-"O6Bcpk0g*rupX'0*C(?orX8'5gT.4UGsWY"=(N
"Ts@&\tcA,"W-nG)"?VH`DH#%:g8:\P9]A#t@3#K(F_nYrkB9=(Vpi,^Z*O8kHLcKrJ`)(nhj
dPBA=sjPqE.RBcmM'3ET1iGKGf863UmLC_3TO-3RuFPUb//QkcG4g*7!OZI1&g2>6Kcn>@,P
bfIHr6lJA_?.6a@d11@*J39AB\>dn7mNe,qe><^D[a`qrQ%otQ]AZZ2;]Ai_^;@[<dkNAj'QH2
m2YZIJn[]AFn@[-i,:ti[fa-$YSu*uMuuK@E/sNR0@cje'MMV+'s%6(*sEGI!ToC5;BOA+3TR
`DX^[]AHPnRu;\[L6PM6QkUSAk*(>PXZt*2h,"&P-mNJZ3ufr;0P"9d2(k9I=H#Y&2Ze1ndV_
LEjNf6=2CA+0ss.o2OOl)+4rt`^)P//&/.3Sh#ZD-pq)/`)-WYi>Rp=g.Y;&[/0?(chV`_dP
^e\);:^?H+s.60.5tL5=K`B3!LQ2b:1Q7D>-XqN6Ft=U*:]ANU-'QZ3`8`Hck'Zj)TR4jn.ac
N9Y$mn9E31K-5-$imlNb>oa-30^'i(I&&hamTs*8nq!JbO*utqG!1YT@JugS-lhZMqceI<S(
O*Tqn==oHSL5Nt;fI7&n]AI?:Q!mqDG`s3p16pTg/3scr#6AeK'E_^T06tdp?b:3RAMXt/Hgm
4u"d530`k@T"W%_!pcHCS.9fNC7PZRd8[u94]A:rd1W@E?59T.V5l>AcH?`"E1JBh@tA"=0B_
mL[0+S=orF$#(@)5'cO.dnq7e\>LZqj_usj8>mB[0LdoM:c.9p-*dGfSN;Lr23>;-Z&OK#eh
]Ac]A!Yj9Q\\T@TQX+Nj4JCOEf1rYd?[*Cb^0s&PSaBm'\AV[.Y'haQ2$ipk._G0rMPh`*IaHM
=Bf6o/"t7F.;='Zk23:?S@V[?Hns@-q#r3qjj%?LM6`oS/,Nu&a?`s:)M%L7Y.4Q6lM4'GAZ
"#Yq((?uj+-^El)ck?c+,O@54r-X0>hNqJj,2YLZHp$>:1PALlFFCVj'88Sc*MfJN&QnF(s)
D&+$%Z\@#r'3[.imk&<d[;ic#)CdR4If7K<f9d><\DfjHXD@dB]At6]AC$#E[%oG;r":dCHcDB
Snrj#7F"nEB:UWnX**"Kol+h7CLXj'LTIX51%&:X/R>;qpo:);"_-^YbJ2+eJ'5.ja1_pq@K
0CDWkEL=[hD\QBsSP;(gnWo4Rh%>_jSBs1\"m5"08>kkH9e8%HCC`(`1ofY0Tp*6Qm/,#'d3
!':_Y9/FLI!KAr=MrGD5dCK/b@9:SX.;s;43[j-G)lR*,Ylg4["`UUE-r=dkC4QKHL)<s7$C
rhkL1NPp(:!RLODEYeelQe"&2.-VIRr(Yj8CBn(Y2otjO3MrfaS9gpITV"K,I]A*2^!&)"'8]A
ZdhO56_%MIBADm:^sUcQ+lm=0-9S9:cfpoM*K#5uLA2C?_]A=D5W7$>fg)J0?o,+pH`M?qJ/=
(UBMUE?Df=V+PmXg*B9u-.Sn@bcOTQn(7,%2*IRhcMM00fTsUl3qC?==F>Bh)Z_\SF0R$hX2
pT@G[0W89K;Vg0!D3C!AYDe8__A%ebD6Lk&D&Y1LKlicI?-U62Arar%!*!7fgQ7,(E8U_`Po
?e9/3'[6:keM<qt?=/cj[W),Mj"qtcrT1T!SnOCeYAh$TGKhe@;(qdC\mq8GjfZFhO_DPaL"
)>PC^t;r6*L-##(k,!JW=dj3([)cP?VHPS[`.Dc`="q(#)9#tYI\N=j_6GPCu9\W0ug!A5ku
Jhrg@5jX,F-bj5q8iW0Qs7WS4NnB"*F[1!mmVW;T</AlL$QIbu%oQNNC$%ZDMPqtBK@fTX#t
Wa%V6L2`29/@XC(@-G7@QG*M8#U1Mmj9o1>oaDu1@FaDfCBu.O9&sLR`.YA5K6@dB)hg07YB
DDGKp5ElDC%%U^3Z$*`:BYgp.Ju)\`i16TqU"-[r6X[>`H)BU5keSb,j"8R.6AEpA3ND]A-:+
-c"FT'A3\!;lF]A-dB6%YC0"XG%jQ?m[Jp%h91dDTE!5VZ-CF9akn87>!e1Q#X6'%cpfK*Grk
AHf_*"PNp]Ab%u$f__GVDEpd=GUoKjI41";Bg2/3VNF%Qm_b8#gM&I(9R_8@ob1ph7bW5=N4c
M_#0RXpJ;82sfh(5/jus#Hs-mdOrVFnUfCUo$5eu:uJO5V`c(8.gUR@52%;eUNBn9C@>BYob
.qdR\3;JlW_GD"@<iopM*BQY@mMFWlX)Et>-D>1*H9gj7@J+"_-VL[%F$?V_1NW*9`62H4QO
?TKAs:p-;n!4'[`AQEjQ<+6qI">(FVT,>HCMgP%506&DmQ2uc-&`Vg[h2DNfCJU<91>@eID,
d,oKd.3KnHJ/@W&@3_ma_Fa-)oP(1pub6c3L!%R)8o@0k1$/21QYj<W#K)JiE2"<7aoD@!rD
@39NRlJFR/qTr`!8I)US=.C7EooPj0b?Db/k*cOI)ER!XPck`Jd49nZg3U)d<-+!+aQOberG
/2Fhe@a.=%qEd00:E`E&#PO^.R*8E/i[L28^Tjne/>R=L[ED]AV=Na7$Y*G)6blCD1TfG7WG8
S_?C46]AE!2Ta"fi=_;+`5pf#tDeWun7YPgl0eg0tFR#8C1tNqX4M#:RLq7#:[F"Nmp?>H#SX
C[JBb&*^1nq^i@4[EAK+5!RW>m.=YJ<gI>EiAci&2Dn_T>-q%>VHk[kBGMSe\!1\BuOS)\ik
5'+]AXb$;j&mj"hjQZ,W@?6D5O=M8k9>D=O.3#9=KA(kqXdc/IatESOuIE9Ee2#L_GtIDqP6'
>:;-kB`SUm!ED_?+IH=1b6^i<ApmlC?R2?bHFL-LjMZ4kLJ-s51XBQ7t8Ko$8=&Zf(ENn^R#
uB_)d*IIkND)M!ha/pke093lTd\4V!^f[7_'f.NT@Z`n=l[\I4>(j;ECZ:?N)Ub(V?g%@/m%
&42E\+U095&sG.cE*Jqb13\Y>(9kC'"2)#B(LC\LfZJRrDK=Q&Y0Q/SZ^=A@YHlkDjDgOFP;
^GV`QKP;h/51&!qr1234"Q$SpMNkQa7'%_b20#E8a7862P@MXC%[3HUO1qXqY"$'2OV&n&=8
r0=oI&1G%t5QM.1sZLX7C8YVO(Q[n23qIrnh7=HTHS%8-G(8BqGNmWKN`R>AI^I=%)/'$OnN
:3+skMF0!e]Aj3)SUV(@IM*DjO,IAfME0>TXPq@fIuQl^r"e2YNUEXQ.u`.JjL96o0F7tM^94
lWak6p)8MC)%DpK7CD`UhO<W6\78,qGgeN0C0cj_<Rc%EBrLi,X*$Ep2ogW$'X^[\Jt>:,Ic
K'Wd]A^,mFLMemIRl+]A]AtCHh)KNnD,Pls0N$kRqH4ahSbjpd0S2GXC!l`p*#FF"IMJkAEYc`F
;O@j>>Pq)0rM0no^;dbQ"A)Ij2n/,u9iZS+l?/:mkJhA5`.$(U;=4nkde/bf]A/,94`Gn!Or:
M#'Y?jHlGRTl;6;FU*h?,<GCKHRFkMr7j!RP#V_fZSC<%1>c%&^2oTdR`&hE!jGMfQ2>uU0q
Vdu-G:8_qUEJ65Y.2tR/),J"`2SfAlhJK$VnD@op*Hf]AWu@2hgMO3+?UZImS]ABd01C[up8'#
#^o)FRokC@^>+fDiFI7IjjBib_X\F(Fd3k9\>_nk7QOun;mg$>R=-$NW2_TLZMm)f+Y83H'k
B%=;]AJ[MDpDmEG9e.ta=),Q5a;G(tCF%(e`%L[nr]AAhsXEX+8.0mG@r(u(N.U8-I&s&>^[0:
*Rgf[TS@P@XnLEJl3d$.`\Gf_lS#k)`!Yr?UToD0^.h\hCM'6'gG2a`%aY3Jh!BY2piTW%q0
D@*cP"#@aGhB`Eo,W/bTA3J/S(-9)/WEg?R;b2Sf&aa[k!rAd-0TKX0fd(3mAn6OKuNVgT\p
+&YLmdFj_LSG?f(ROO"FaCiue81\9i:B7;`7.%uJ&C]A:C'/=hg85,W6u=)[W9*$JVJkpr/1'
_g6%,:@JE>/JZjjP1,auSK((O#tGT?Nr\NUA+$r"_,'psEBWEY5fX9tPh,`aG^H"XU@X<%d/
Sim75rd\8q#6%p94cE2Mq*?T2mCgV-=pjRdQ_FXc=NK#,^pQ\iO.;7-j7C$LgJJMeHuhj*Ur
+-#cecVlcU;^<@kRG>]A?*Q^&uS28jQoLnU2tVTkADF"S&51u'c#XXaLqL'@;hs:56u?(WU"#
0Fbb6?'OVmlK4FH,,uruaH6[q,25=#cE0&YDKQ">AQ$CBk9jP#h0:l82.nrgD)qbmOZ^m,2i
r$iKJ]A@R.>sQ[@&LB<l6.VG%EHIF"M5pVk[gl,(YM4ZtXEI:S;PB0\W@.8>;`?k)Ti3(QN9Z
%oItX>\eB>.5Sg>>@_>.s'2=7"->Y,:a@tr4p@2kZB(eQO+3#LoPX.GK(^>k$tA4/[C#%"C"
@aCD7qea6X<Ce.M.a0Mf*S]A;8`$\u1]AX;t:a1>JogW%X(la!e">W$ppKr7ih@STj]AB45+k#j
%ZB&Hac_9^0_gE[Ar4rjmLO&lht_2fVbtSE,Ri8t+.Emh?BBjs5uJ/o]A:7iHMI@<1,Zb>mb'
2\VaEcS&Uu7pQ\Fp$""P(Pp)Z8$TQB9F1sGrI*@t%*Ue#/KCk=6r!?5qKq-YBV*KPC!?$AKP
.5LRY5ctI#mD&s&lqD<L.Vqg/+[NTRUEX+7&*sT?E[,`rZ4mP&qrI6jR,OQ+e=;!gmpBSQ@9
dL5:"(E?g.>b;uLH.IL3ua;]A,8lQ37Cu5oBZ$/oo[&q*%$&[Jj<fra;Kah<!c_k]AL-VnM?*1
g+cgtNaQf&;!pOYb*s1L.V;kRJW9W6'$l^hHnC=kH6FiUjrZBUL8:njS';<0+-K+RN\4i28T
gZ_SA@*,V8Om,As:\RB>Kcs6P%,R+2UZi_j]Aj:?Xs5>:;F:1K'.,q,a:f-n&VJ@achk-*^7+
NM.cGPO/!IK<o1Ob03<9^>\YV*Wn]A+2d1fFr3kp&JIK&"ZESc"kIN;;^LD4e:k8EdI6=P7=_
:(g8mGEhMiS!E'_R3DQh_7P1#UkZdlsr9Aq'fCVqN2qWX8US8gPX%_Im\!N.Qc_?QeX+(5L-
<:X@An!pf_@5[#D;U65(6#p1;n5`p`<XeV6aR54d3>f976;q=t1)T0/A'R?cMn]AW'j?TI'8'
^k?(-Ge!!j]Ai8#sQ.=86_k8hT<GhN=j@hMIii'@X^`B/g=26M(pNC_PDipgH/DmCm;cBZUPJ
NNijZ,pul@aldkSX4G)Q7#Kno=0M1W[6L,^]A8`7A\:TcBoIL30CR[oP%^#n1m"(aH%pq$187
\`ttj+cM'0'j4E4l;0:tis%K`*T10@0E(B*"n1]Ag]A7\<p(a\6RO(5umuKY`_PSAZ_,fD<)dO
j%u1e2,El(!NW%PdQ\jYp[f>Z*&OW^NQuNp*Z4+$">4o+]Ae,G!k8cCI0&pJY1^F.k;O,H!D)
k^^"(cK[RcF=Ei8e>)WC]Ah]AhB"LG[T,(Q@%F1G=_e246KV-+n[M!$hhH:2AXVM@I!*T^1&VS
?+4<!'IfY/OOG7>qV9[UV%eEJIB,D'Ip$!i-gV/<-lU%/]A<re>g#lEOpV_jZ)lM'mT"d);DA
WJLS<;bf@$W=QOXID>M7:?na?FFo]A>(k6Y7C./Pnb_VV\oYZFiZG%43S#od."l"cZH:/p#\8
;/^"p#D=.c*]Aam5KJ(u=V"gYJ%k^hXm"I]A767g0F-+lH;[C$BS'-+:AfV:dWQ'^cL"o+p)]A1
HHmh;_44jeqc4)rY@GFG=EqU^\WE>+,/%X=&UHK#LoW2fVu4P'Z.Js"/jr?^BAS,[Pjhs>d)
Gt"CG"g(*DgSA9u7W.&e+f,i)"Z_=_.q5ZVNi,l`i%Ld^9A&0FR]A=9M]AWf)KuNkP=,k??a/f
,-^0S-r6hUGt9^.9#Te/-qb>>5)@VQ@ica6,G">M^@<7>_c5"pc4gH8a"jijo`1qs^k*`+E3
!<d9&"a1EAeLdZl?.J"C#P^^>97fotl_.rM&VM->PQ>ZuKEE*TZSQ?'A4N6hbaC@AXk/1+_K
WrjT)Q7M7:CH+A(#.?;J*<q<k*.W\o$^&'f1(pKM%8WO(E2:JgAHen?6@hCrk#o$M9EBu+)E
H3VN_ALo9ILrQKOLg`d[(K=s'Knk)W_/:S:"[mNGgTQlL3?L[#C>g$eEo-_h=V/hO@0NB@$l
GNQMR<cd`866%AaXF"E,FbN\c8!_:VUgU5G`%J=M"TfYEDM8_<kE0QJO''=*'r<II?<>TXl2
G=\apjWofcMW1lFDZ8XU=&)4uW_^^S+:AuTil:7F[=<Hh$B:eQm8@SA3^I&Q?ek5$)$@KC<m
ukNpp;FL1,V=b9[KK4miHqE>:6Gm!ae3b(m,hjYKBO]A_nWY(mhI,JWuA&iNW-fg.gkM`#Up-
i0BMI^h^KBmic3l:*G:=D(k5s7e#1<hZgeIUo]ATWu@o1SB]A#<L4X4E^/+J?^6455JOW<Mjl'
H9&![3t)o<GNCZp?Ho+Cm]A9c\]A*g-,3A)(na&E`*$^F`)#/EBm23PW1YUV;i-Lg63_G7>EQ6
7>NHaHN2$m7'`/*7J'E3AbS-f4D@pSS(`Vgu[IHJn`%faP.IDSHikISScaE<q2m5h1Em%@6H
P5jWF2nW@QB9J=#l.Y"6o&\QiM1<%):JU^%/2DZ?*_kOo)&Em;[[ORt#El?/p46fDN%AD&fD
qn;0M"QMr%HN3(Xuc.a[BX'&9+NEmR2qRma%qd/PgsM&`6Ne-k@=Y87qer%WW[Xl"]A+e(8le
EOWS<!K7s@cQk&IXX]A848/):?cjSIIaRjSc$CCLF8fO&!>7J@`$\dIN;?HA/hk1VnLIh#+]A-
g;$TY6a4/?n2Hgf?%J1nB<7'X\0Z-:<s]A>)Hfj2lAsH>mQF(qT>ckHD9I[td(\tS<rY!^N=C
]AiU26GbI<l;aG!B6-mCqmhh;K1a<U7%:,O\gAOm$eQp*&Pi?MRIDXf/]A]A9KR'hXU=-M*RIKJ
Fd\tKS[r2@b@*-#GGX<+!:mt'P^q,7=8*uuGqSl>-2=Lj&quOP7PJg4)R))@i!UuigAP#T$q
UpI@=E1R(TYMrg#5ZUa!,H1YK9[ks1g[Q!gq\W_E;)ic<h?+4g4A#U#bTZH_kL9r5T*.lRFK
]Ae20C^FRH"V@FHUi='#dmLMjIIY#I7CoB*2,m`FA!K@GPo.ap=ar7?6^S!Seu]AG7T>ADgmD,
^]A#-=-N4U_:8]A5K85GBC_u,+lao*n$.j4`O1%(JPNYi+L#Yr4W@1=SUXf!en6*&[rr5oZdJj
Z-@?j'?).#GLl`^6,"FU,[..2]A2e]A':d5PVq_!nX`5\&2S:Blob=$WPmiep2V7In]A+C9T[(e
kBDQ<B!h0.s4<"H3/U&`((XtUB^qoNRUD=H9H\_b\[$%$:ie,`lo>I\!_e^S-\2DX01$?<&[
$Oio6r"CnfLc@TOP5(^Rja\!\h[!-P^`[2,REYS>+IMT7H$JF6[@,Kai>O?>,O\%$4Ier`*d
bMCu)jcW-,G9g"[n(N2n2=h4Dp!e]AU]A"P4fnKT_GTWT?<f&C&p,:LotdHA459*7t^d9+_ZO)
u#UmZ^u!P5nlpJ@E@'WY,P,L\G*=FhGq-#cBu=LGj(io[<t>gYY.-4XB`6^<?HAIN!F"blfn
S5rp(g3EN]A2s`Nb.?Kd/j[chT`S>KjAJao_=>?_^S#GN1j88Q,HQr?N[12tp=5X)X'\JVXCa
.E1FFP'#,_%O9O=Cmo#Z/lfZ2_HW3DbTerhNu>mnX1B=N8#;a%Ic!WMnuOYLG,5/VlU734G`
TCUB+ZIa_LO'#Dn#Fp%7[u==f_<kNcndT^@Hh/:[,3`1_HTHPE&bhjgPZB.7Q]A,?_;o\UQH+
Gs%lc=$+=oL0sS=Kq'E'8fiC?EpHp0\RK8q8MS3j'lL#SFYVfl5/34%dT!-K8!?uV4r/)L@6
hsbYEluaN6%Q?(IEcf>A:)kR?IlY)`jbC2lDP+oifsn'G86&0Ll\L4eE6/&G1%X;0$FW1$#]A
dC"5[jH5DOWhH8^K^=<8Ed6.[46Bo;oJ$k!//WRPWdR)$uL"',1OJcD\X-Hi7_Ij8BBX2C\_
U/Z2`S3uUQk7KZp5!QOS2M7iQAl3+qpZad"@:oZk*suhn<ZQ]AM[,gr+]Ant>I9=Ynb@Yn0Bpl
_sU5m?g;6sMoF:ge8A@L&1JjBW*u>Xc=[$)VZJ>Whfpa0+tsc6E)Lpn4en(A-Mg)ulf^HB3Z
?-p[;fZCIJZ8[hqYD@.-["WWO'D>3d+o,o$KU$eEO^i.'.?^FRJRNO[kDe+62AaAi^#tAiQb
\^m#90l,jrkG0rZCp2XEBd$]AiHE.]A#h@dRGC!4La0DC\1KVis?6j]A/GL7XY``EOC'6*NsC@6
[i2oP`<lZZi'GDJ(Ei:b/8IKbokZgO="!<#E!8)`;9MTNagG]A`qOZrDL6;*(or_0kG8>!Sf9
64q"T6gu=)J`ML8BZI@OO0Si_-int<r\l2C\?"CTbK(siZIa`hRDHba<0O#&?i=Gh\BSY$?+
T>rN8jBfX%<,b:!.2*m)]An^^'tr0iupqOce89]AI5:\3s1.6n%G4e`#lqSL^XR^f@YD3`.6iF
4mg8&2EEjKfm+B'oRm4HW7<#;<Joo66?&7!8N!c&_nb.=b%4^.H^9YGS2Q=^NKl2"j3PTb[M
p%eKD0_l$VRtse&FSE6(e!$"<Q2l6FE)G[=%P//[iIZJ*PgOtP=lJ9k[Xo#;uTNQZIrj\l3W
Fa[72:lbOik1p]Aqg8\FIdo\f9i2$lcZHBmhk8o6.8ohM>CSpcdNln<M?>@3<NGGR`;aIX;![
i&p$q:_BQ:!6CcLE@LVg-d6,#UM3t,DQ%TJ]AA<=48-aJt"2dmW!ULe6.?n"KBSX0s(TI(tI6
+7mP4;Ku?pSr5BTmO8ID1j/h<1H5T=baqJ4o^8P_+@bW$3@kX[>4.aj4I">ekFWO/CT/<#B=
17Xh:_()BS617EdMorM(3#jJ!*7qg([esq:`-%R-.,9C9+ZUQl$l-Q-<CH%UmCf>+Q,d02_\
_-OO<Q>6<QbCug.HmD6'`MSama$:Fh8/H`C>lX8=#5#dHIgDW),ElaefLn_o$nX.J,dWfhj2
btWXDtDQR/<gmsXK%j'MW&e7F3g)3dElBNI5gK)]A.LPdr@8niF*J)WRQ6Qbp:p,/POL%ta_]A
^L]AoY7Dj%H=N4>o2@g`[n021fm!gqe<H-HU+Z`-i6Zm)Q^D@M(i95WuCJ+k_?q3(.X4a_jX[
O-ne48?C;:SDjZ`Gc]ABVg5DF?fd4c?IO)L0NX7?94n^`]A(XOoZ89`\j*4p'+6k]A@=C_lQrN2
?E+<$f2J([^9Wdp.?.,j="=gH)W>'Tk6`[+VM_$1;G(jHm#p._\^BhZ\SS-:RO6X-D[3WE<^
&E7b+#'J:]AWnSYYs8-8bdT-@.'QGCCYSiXH`;^&DK/'27B"->MADH<0k/6t)eC([%!O6r35k
)1\`X31DlZk\6`]AC5^$R4-gWI,/V7`^F3!H:>_L/'D*qPDC"lpI7*'B#-e?TFS.542@k=`&q
:^BCZkE&*lk*4GU%.W92@cTCg$Xb$un?>9^SQ'Yo289TUrX1^+DTMb.bO9IFT-)78^KG`M6U
&bdfMYdan$IVr;9YE;SO^L1[T:kb*V:i"fOU#EjD>fjBo5^hZ]A]ARgG>`n2H!Bk$DMnY)4CPE
4GK&;&gZ$3L87g`uEW>]AFS!smrFBB>04H^$OK*+j9+<YT;l5S0m_Y4,NQfj[*kD.QKGPm`+H
\AJddbX,+@u`Ye_/lK8f^5I1i\PgLAB%+5"]AXp/%=_[(l$"ieQjZU6Rc,Hu^R8eIJn8h\=Bo
N5$t1&aO5?YsI5j'm-GlHUGIo=<Fn't4B?5^ZgDt^>Zp.2u@bHe%E\f_<<F&IbXNlO]Ajq?>J
1h4[s0jko?[l$>Bq.L96@WMEZKFWFo)+K!hG(1l#TR.jKaAiFgY7iGk>5A(*FO$]A(F90p013
Rn[>,J1VQ$Mjj!0C+'FZd"c:%04,P-jou'0-#4o_X%igd\4[c(./oTCH[)jN7Z?Pf-mTdAbs
qd:Jm2V]A&iET.H@!m,f9Tc`PLm_,g7k8"f7)Mi.h3Os1XPY8*S9P]At.9Z+41T%nYC3pT\2#k
;-XYs65sH^M%8-QSn;1']Abnr(GU%Y#)JHW>Q7GO!fC/'H18H2VcFHY_tfZtS*0\baitja6gp
/VR8e4_]A._+3(rSDA1]AJ!FY[Vcb.%*ht.)h5Er,FUS@EQ$#&MPu]A(:8B%0u+N<V]AjgI%?QKJ
n6e['j\LX=%*tfVMXpr[FC-\!%rRNO:q*g_3&0/t%Gre]AMX'>tJa:T1@n3HnIt0_jDnJ>A@%
5!=ih)a#q$ubaq9@5PT_kamNY]Aa/Gs%rI:[$Q^`1:6ok;MOW0:@P!L&J%a3d*g7L$2%'8oD3
g.-7P@9)TBd"?n\r'(n*633lRo$^JLh8Q=!;DHtW@4c<k\&'h3F$sS"LUX6eM<$fX1TK-El1
5/Ek\F<GI\Dlj2/+,H4qkk^tghOD'cB=-J$LaI_;gHA<rRkgCd.H[\_^)RY0tT\924%rtgAC
m.`Fu]A`D<t6%8(jBR7CE\O3@]Ag=W@fkR_785;kW>[.&V-f\e0r&KOi_RI7!CooT4XaI$@]AGZ
G1Gs]AnS?gqY!&(lnl_C-+_h<HB`=RHBS:#q(KZNG48"Y'9(*5.]AiP.Unl3D?:`/IqZ\==fE@
u+TP:1mLWVE!;4Cl4O+XToq0J'$hgf@*;)jhgMA+T8_emBC*>WXPjd2R0An"f^R/'JkIm(ts
sIJD^4rQho6f>.UsL$,ZSX8eNaHN3/]A5l@9[`@db?h.EV_%k]AQT!j39?\qD;Ko]ApSem!\sG/
5D;;\P744mp)sVPYTd[./':)a%A0.9lsiN%b#MLb)\6*0(CS<kHLRq1EP\$r'iW-hF3d&brT
Ji3\rHJ7,^K/(gT]A?M(>+rZL(@C*1N+kO+o(VmH['qIk=oOFam%JqW82F)C:Go_L(?bl.t6@
VDZ&[km$jc0[\WmG]A<LU%X9)!KXIu=phHb+a2n/bY'Nt<]AB0[*i:XV).QacOima`'I=l7Ter
/S9dc"r2ihAOg38IQC3-7qW`;8mQFds-bK'^,*8_EjA5;hCJ!oh"hZGQarT'?pp:GVI%1>9L
P$b[a<4=]Ab#mWH0B8?>OLm4VSQ/<BTB/rF]A+Ysq<<L2;,25G,]A:fNd5E"\>B`Eq@GKApfaZp
sd$lV0oZBTRiO6mJh6W*NJH\s'Blt%Qed)T.+/L;(Yc2g=:)%ob[#tg8aA[_.;mq_ZGVYH>@
W^(0RW6MY$Adj_6B^Z'G3nZ+$W#C0IhiQ6j?E06(a$"l,`k.3?WULjJiLS]A&;[A@m@dmBC"A
=>^nVUE+2)VJbUtqgi"Mp>J,`bhG)S3ibN/+`MTe;rJB2pfp<0G_t37S4NrZ%mPR2/V'dt*e
=%F^BX>,Olht*?$#n=qAkTa6Q@Xh&IJOfVu^N?k;K3"Es8UUl1IR;90iHN@k\"1?Y:_?oFnb
`7^7L&r&qL!J[XLiWQ,hA@YtTZrR4^?e*8W5k+BjjdWKI]AXRk/Q1ZW1lo\VQis6s.5KuL4J_
QFo".'flK6s_dZ;\UE/kT3*dID\c06V.-h"YQVF94\mI[_dhC>[<)0]Ah9i0A3a@%Y?hXA6J=
+35%q\3MSkSlJ`,e1J9;%^amJO.P?+tJSD5R]A6/hgIp1A<d#h]A=NBcK>8j1>#Rqi.f!"\XEm
"26Hum*M]A0c(M$gaS\dV6`(3/o1f->B*3%prs@+dLn`c/Ug;<Y"dY6(Ehn)\d*=o=M604LhY
s-/$/cd']Ae+/qTQmqE@e*;>C5:M@.Kq_`0M:1U50cr&IP=q$:(4lU_(^,9@dhC(gl5M,G)lW
^F!P\eo5-=Qau=u9Z&H&E`g2D%bI]AFY2uEMdf2<C?n[0Yr*0k'aVA%aVII9kN<t.a]AG))S`0
=;YW+:P`&hukh?P#8#ENHU/lA=$^co=-Ygk((ruZh0Mq6+nI%T6JPAZT^Ak%6:*%0I%^0hr^
3ic3O.FB?grAJd[l4c?TMh4d*h&O%ii@SB<YF:Z_.!DZ0%GqSa]ANRXN=[6>XtC_Mo=tFbqp3
*3VSu:q]Apqn0*->9+0[_2hsd`\Xs:NOIX&a]Aq_gRq.1_kMmIHaG2`j=Ju+4rQm\a2A18@(;<
/X*4>HC#Q9qD'k6"u2IV?YS$6K+L%lI+?[eKl8Hp-:,2A-]Ai&Uq+oq:JNWdHc"U`FW#b&$h^
DLb\W@[!AK4B9&nPg7n*B&P?oG56n_SW3!qJ<g$p8GQLQApAQ,Ao.#2RV%jq+Wh_l5J!.ac;
)['D]A(Pn$!^<Ik=Ur^LZOlqNpCmt6gs(EX;@<'D#+W%tS&F^@dEC@>3uUQ^?#]AOm?*I+CV?G
Hb6%`*pLiX\nW@4-CK1'sp?Md^srb?*6qkgtTY9[\NB'`O+G>#J4e:XLuC&RN7G',hMLTOFO
QY6Qb]A%;Z-e7n2l(+eQ2oV<B"f1D=&^@[RWI%?8-ojAV)cD.(apJc%CgG;".Rhjp)30(SW)T
PY0*n-fVJYb;ShnEgnUmQXl%*GDbhdJ]A,U+TD([<%[@S5Jm9r25."Z0oL2h.dqQS=E7[`RtQ
C3\):1^*t[k.%Aq\T8WX0&H7L[WJ!\HAQkYC:CG^XB2rcDi2DRTCVM/ZA8:%L:c_JFoM3$,R
fZ52fAmUmiZpY9#I"-pfThQH`X#bKi`ROS"?j;7,LLP7^1i[DJm<3gMQX1YRli@cLZT1iIhZ
Xs2Z%uHGO=oomXL`OPhV4%6A;<&+leg1R9^(Y?"@,:ABL-UUthE+/\3@L.?dEXKLSr,=E,>3
ZDCRLESP/DUPrG:fs"V+cHu%Squ<2dIa?oto6l*QTBH#4n'Cn(q0p%bZHmFMA(Na.qp(lT+J
0ifHK33U@4:mC6tETKk)]A&Ne@#qe9Pd;=I'lBui<lTS-JaDD!6Q>O\Y*i:7U)Z'\[7*;%mX3
!Pm2]APR&C1ECR6Coq22gdL8u10]AS7:f9]A[PSHpW2loa9-<IH)68e9>a![0%OnHO<Smojj&P/
MO+ng!DGUK!7odK6N`(qC0N\Vp3"-[YOmR@%MFrbVQrRHM6JM[=Uci)J3]AG2.il+Rur<bEEU
d[TG7rI'F1OZbb#PI5?(CN_a,sE)E#@$,DCNr:K:C8dm7Sl*C?1'2X[l*l^\*>/;I&ra'+Uu
ABNLq<=E$r0o&r5gp./$*kR^;o@f\q]Aq'XUg-a.6NmC!=kr8?nTRKU*lCSuD7ND8<l"W-K!Y
ugV17K!qHar:f&8jaP-M,&C`NVffh_KDGD<\KJ%W;9_3Ogu1a#@O+hj'W_pG=ar(?qA^R9<J
ErE#dVT6t*pH8SbIpnV2oIm]AMX4$)<!YG!I]ADA]AI3VD3-***I16'fdfo?E%`<k;^S_g1>rki
bB1qpFqhC1DH'u8&-o[EmqtFQ4uWZJ+7T@hjq\Ap:V8!Ft^J=M3KOPeAY%N?^"jc;#Bpilt+
78i<3+h4a:UJS&7t]AE8,IM6dkWfTj7!NH(qWnUbE"t?`+E>8:4H<F\H='gEhZ*Ri>.A0(b_"
P')PpH]A4JS8;%(gm@a@`Hgp;KXle2B,1H7K:Lm$m\YD`)?s'hIGH+9r"rIGdbXSCgj'jl[5b
L'uMV7%q0Hnp]ATnUhppb&uANM75G"j`B=<!fl[7.O>Gh7H7"Sj]Ac/Jic0)*%4i"d+`8L@LMG
O?G2UAR2Mf\W3B$L!fA4=%e:MYcl5BLVr`.i76P;P;R1X5)@O0C"(h4MWYp\e)`V+*ZnJ4)`
s%)H'Z-H>eA4?l+pUQ^<9q^5qLf`SmG(W]AR_Y[\H,#ED"#QP<J0=fk5`t&IlH_Nqjmh1)h'M
Ak%'iR#]AeN%uAH;VXUIq\l:CpAdeO`]Am/(o_!*?9sFp_Cls1:c<Rl5=1oTpADh:-3%X7@]Aug
P'peGZ'Gq<?SJn+.F.;@nssDcQ]A4amm:%_Th+H@$NjYL`6aZ6'riE0Pec-")q.s@Zb<N]A#dg
=N$r4RGcL(+$8506pod:$-^Y]A4@s4%^<]AP&t3("[U&APcU\+._L$>fNDQgO^\#SV13(TgiQR
lKN3<X,c$g3#hhJX3qnXc2n2E\YaKgjT8U<4^L1ETPHMrB`+H/m=gguDcPBS9eoj8ck8J"`$
-AbcNda6sBpm8F3g&rT>0A)]Aq-sU1Yk2&a/oad>18da+HemUFS*b-MK>kR:mP*d-m2d/Z9p6
K#e%kY^(N[]A?2Y"bjXd"9?9[m/"k#j=fM]AqKXBj04j#5kSl[1)a^=.fQjqLR$t[Om%A/=4CL
,n$L+^-+r>d-0?`K;_QoaG1(3gc$`uVNp1\FgteL@dA0I_`-Z)[#qUnXh<)>;Q-4"1NZ:g8g
WViMn9Kr\HE.F?:gsE7`JWd>B@ZDBP[O,57FdC^+r\D*Of\jENK:W>?Cm.$(Q]ATp^4J9QKKH
+cm#K?lU?`!$)*,_?!0q'%kG>^4I(%6<&co[FOuUUPSM>&s%=4.6NY!l\.pn^V?J@G-lnP86
RsM>)fHFUE>GZA)(L7G32DN4p(d6<T!)n#XS7dIki)7_7ht#Y/HCV=,Q"^,j%8NS#N\p&nXE
L7U-a$V64F&DV[@hcl1ir^NDP*QD>9>h95%qT&=biHl>pXn2p)9[f,gqLhCdWSNTl>Z@[+sP
MTI%HLA!)-8]Ar)FgaB:aV)?lT@>+'[b4JgE3rT30cN(p:VB_hl<ij1\H`AKW(6P`J:Zi$S_Q
@p`(KiC+.DR`B#P\<uJ+*t'#.>PjjTeXTR;UV(;sGZPK`-LUOT6=P$e?s,mEM\r%>YKSl1e$
t_D7prH67e_K!J--^F/_g6SoP'-YX)LTT-`.%?&LSSpugD&&pekf=Ajb;7iitlGF=n)SsO:?
Z90h;1#2\6F"Al-)Wdi1CbBr@J"Ru;$Js\VUmOEWhp(/in:WmqRUeL&"&3)]A2.A5bI]AngQo=
P$gqB);[Q)]AW96ESPG&b!FK6jHHSGC))PuNit*b"pf]A6Vu&&-1@3WL#d>L5Zp5N".I"WVmsb
ID:%X=2N`\LsOn@G=@!m6pFN80I5")Wqe_0)J2-#4=7[&Wk!#/4D%dR:UL;?EOe`-2E"C?hX
#[Zrg!Yn:)WrO>*[]AZo"J=!%S!FGD&.T9j5geTB;,&V-TWtm2mj4358D;7gM>:=5ASg^k13#
^?9\mlpg$Khfi$=jk:/_K*VF-&lMK9JrV<B4"P(F_[m%-7P(W8S=n'tAs,i+'3N>po%F!-S+
@F(?Y]Am+n,:(T.#_rpfMomq/\RgIEkbNJUKi9]A:Y-(oWTCTrV(Xk9hm6AR\d7AHW*gD-rJ!j
NQ?a;.,jiIH*Z<)Lia^bRZ_8T'DBLT!$X$>>\_.cMr;<:F3[aFo#W`f?f=8T`Kb5Zsa4I-HW
J@lnnNgY%C[&^1/4WXj`TBnV1ni$~
]]></IM>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="752" height="156"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[违章分析：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="752" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[隐患分析：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="0" color="-723724"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[隐患分析：]]></O>
<FRFont name="微软雅黑" style="0" size="96"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-2953990"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[20916900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[23202900,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="RichText">
<RichText>
<RichChar styleIndex="1">
<text>
<![CDATA[（一）隐患基本情况]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
 上月剩余隐患10条，本月新增隐患94条，较大隐患0条，重大隐患0条，其中一通三防专业23条，机电运输专业21条，采掘专业39条，地测防治水专业8条，安全管理专业3条，已整改隐患30条。 太原市煤炭局检查隐患3次，共查出问题57条，截止8月9日，已整改55条，剩余2条正在按计划整改。本月上级部门对我矿检查问题一般隐患共计98条，较大隐患0条，重大隐患0条，截止目前已整改92条，剩余6条正在按计划整改。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（二）隐患分布类型]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
 本月一般隐患192条，较大隐患0条，重大隐患0条，其中：采掘专业52条，一通三防专业58条，机电运输专业39条，地测防治水类17条，安全管理类22条，其他专业4条。
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（三）主要存在问题]]></text>
</RichChar>
<RichChar styleIndex="2">
<text>
<![CDATA[
1.生产：①放假期间停工停产，巷道及工作面失修严重，中高不足，支架变形严重；②部分地点烂帮烂顶及防冒顶材料配备不足等；
 2.机电：①井下电缆悬挂混乱；②部分溜子机头无点杆；③平地岗位机电设备运行记录填写不及时。
3.地测防治水：①技术资料整理不规范、没有及时填写更新；②现场管理不到位，存在水沟淤煤清理不及时。
 4.通风：①巷道压力大，风门失修严重；②隔爆水袋有煤泥，部分水袋缺水等。③图纸及各种记录未规范并及时更新。 
]]></text>
</RichChar>
<RichChar styleIndex="1">
<text>
<![CDATA[（四）未整改隐患原因






]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="1" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m(@OAPM=\AMP:.r*CN:\3_5GQ.7'EpU4Pp+UmD3On#5l=<+uB0WUq6H7!]A0%?4r'I-8fmu&3
0+FrbXgU\DuF#mPsD,lf0),=F&M'F3XC%3M/=hPsddb<MR'Mo-t=a&VYtNb$uV>@K7"f7;gO
(5=`H*Y+-(9XkqQ(;)IdahIpbT,:Hd<jg3;%B$8L@c:f!jHq:\_i33u>QU>_:Y]AP3Ymbj=so
*!52R/#YN0l>Fu#;:U.o9%'+$0`n-k/'($q'l5(2n,[DHp*i.%!s`/-&e?kfF2rBJrYN:k-M
_EqjA0mb4[grIZ>9\Nat'FkE5>+VZq#o="=sD59.Ch[Ju]Af@fGGp^`@-Tb>W.j#'^=D[ss(E
#lM]A(RN6lt,G4R+i,.tuMo]Ag,C[.p*3#ne5Q_t&c]A/Z;+"7G/r,5h1+-al6?UhY1I2#?EITS
H,[PlUSqn,E,hT^OlE,in-$HHg(*]AXR@S^E-\Lod"O@3@J/*j@-Q$dqq,,b>&dr8c;hcbO"]A
td6Y+BZ?=\Tpj;rgSZ&EC<Bp[UURQb4.QT#Rjl%Z[Q_9Lo^XSaN4D[[qnngP5,r>"cOS`hea
hZsXVn_uBE83i/h.kY**\'7Z!g_8bOPmNRrb[\d&B7J&^\0Ye?\FMUFo;*gr3MH^hr!`NrKg
$_s0g]An]A)[K%05^[e1<9h9r%mFBbeNl1q<e.99cr!%<&eP8Q>TuplCn)jC1T^_fMmu3OQ+l;
HjLHGr+QU)qnGpi"FK5p_s>5U*u7$'T<YX`g*H[@KYPM;?N#?pCJ,HfA+G!ppe8Wmh\0KV5@
4[[V)![o%3FFcN'g4)-2q&&I+#<[Lm="_MN(4Knh,T_kjQ:=$_;9W*u4tCs46H'Tl1r>&8TQ
Q^2.5-XaK*rYoe0)cr6'qF)(&k_<0?Kq.nI[WV8tSO8]A@(ha9&rM#U!#s+pOoEW7]AOQA^4eS
`,WjHjBb=RF/P"aTV[fH-uKYSu8??SC*.Bj6Y>ig%<td[AaE"TAhZip<:Ia#q*Go:BQ-H\A;
1[QL>QSpQ<:?rW5.a^D?UL,ba1IS*1$DbSVKaU'tCVBO7m_,^E@0oSF.)p4k8'US?TYOt;Od
O#0tN221$kMir"Y`SthLft-aQNK/^N&8MWLR(*?5lKK)Ykr9.$ki>LWj29qK+4N)-5dL4Vl,
Uak3otMa3^9J60fR&!h%e6Y1KqItfs-)e4<I!1.=q9d&,4p`#,E=m'I-6+1L>;9@"^>KD_O?
a`,U<ojbMT\ej]AVGKM+Q4`M%<"65DCMe:gF,,0!C4Zjb,RE\a&:\bT*6,;+Bhh(nR/)6s)$K
?rlp(.Phu5hePF0"\TAlQ+X0?5n)5]AuH1J=Fk/<p4#hJq!:&I3-_`9HW*R>Aa6@YD9e=VH]A_
nlEM:'^F0Hiu5RkqN(>+\IH<jDGnXF*-)>t`(q:K/LP:/H-]A.Fhe>:abfKLAY;E9$Mgs2ouf
`7XK:iQi9"RDuhnAmG6K:Vc+!\[TD0Y+M92E$:a[-,&Z]AQo5DZa_SmGM]A`PUdL;`t%@"8KMX
es5,<IH;0;)8,T`dA5'g4;_qSE)HWMdqUl'p'!c2DTpQHHqfgA+e&oNm75_%Q"Ii$,cBhUN@
rFJt7EAboZD*VJ2A&mZ0uT;Xh$WO_3%BSI@HI;G]A@o;3k4M)3c4LkJ?Y]A\Bc9\tT.((e`"/J
'Gm%_CY`V:s4Xn)OO$aT-?DI6Rj;@r7>m7Y'XD?8+:Tm&au!"nW@C%I]A%lEBj/E^R/3QRSna
0aHd`4%Qk+EEo9$ubjN-i[j#pn:Q0p6u"AOp/qN[gSSFOb`0oP?jh@2Fs*5UXI9gndP9^(+#
CPq9;blk#_i3MDK(@_iP(@@:%.hq/^b-:\Do%1j,4VhdU4555IpijH(3K%a7LcG)iVq*)>.u
caDXI2+`p#hcaL(BI0)k"Qm6"@kF>I<oYm1h"H6:G%uJ=ZT]A1G-%D[Pqo(M/V$N-mWN0ERiI
VSoWQ[PFPUqm@Gs1Ib\Aah2\2nd,QYkFBlI(ZaFVlD:s9C>R9*/\:Q5^$TJ>C+$cf<jX@cqA
:^C*.Et"]A15DFKWo\,bK^-(Y(Ami'M5_WJ[m"O:R4H,MY,('("<MFTin>VPYb2gtg$jjZX]AD
9GV]AO9InO#t4Hl<JSWV8Z[[TR!g9BZt(Q!'#1TN1"9_PPbK2o=im#2F"VNXEnV,W=WU[rCH`
8l)Uq7PZbalGN5lbeFj_3]A!$>]AT(OM+7k@fd41j5AfS#.'`4\1;ZfL8WQMCbF-B7I/t0peHR
DC:61LZIljl2g;';[Vld?YLOU=%)fZA.g#qFG29R1OE-E\?f0s:-oD0[.<CL7Y$MKHuWk^*G
sS-ZmnjY*!G2WRMg;6nL6duiZE]Au^E9=Nm&[5LDZ2WNt_:"dFl4:teHgU8W$Aj"u:*NphKa.
Xma1[W-9qHV3Pd#+Vt1)Vkc(PQ\RR>\*n_aV9/IWWF'O*Sie"0!['FoL$i]A=4@O!i:*4.XGB
0*4n%acpP=7MaU,Y#P#"^e`"(fb.-6IN).YstVnfXb5C&pqSYN1NfbM-/5r\/'2:<$RVaS*A
Gukf]A*+jZ(Xf/6@`VObQn,^A<D_,8g#.f1,Zo41c\)G`HdaGi;o`Y9=2i&#VU'blWdi05&S;
\+4WVcR<>ukK@`#).-A6NGeN2($*c]A*-'b\b4gcCA#7L5'qAS:j8RHHC\+.C%5]A=&t-Rbq^!
UN,?3`dn!b]A[SNbl=uUfIk''oDV?&[NCc[gukM)3_W`(5dfs@p#WE[Toh]A:rQ?nR^rN:Up12
X;tJbVlXt_]A!C5Tiko8!$^rWVR5^^=.Zs$k_GNu6EHr,]AEpU]A+-Q(!_n?4bUM:b5LNTlX:'n
tR]ALr(T'5;j>&p*DeX0#Y05&Lhi3Y<X*5%$/s`t;qE/pa"HPPqVb?Q@<q?fD">cbg'nHsi39
S.e+\ZZ:tX*am-2&6UUrc/Pup?G.,-(07.>'BAD96Vj'ZcsjUe%<gj:52(+V6L*e(MM-VmT1
)3[\<#DGVb$I3G\]A.LNLp6M?Y?q\&DWMM3BsZ,mo@^OcpB*;L9-V!+Xm2Wj&W_l0s.d5$e5W
ULf[J1>3HopU;9>oM:m!n?g;DJZRK2N;Z."=H'7"3@9V/<d,(ac]AM\lhFeAcB!WbX?AN?QHl
TQn.5DR*9biHrjMHG2>cgd3YR]A/JO!<Yr-ec9i-97i<-*pnQ8';]AkZ9Ooe<,grTM(WM2FjA5
Q:X'iOD[ji1Qp0ZY'16:p8k)IL"*m]A):pMA\(Vt0,5cQPi^\L'bH8n4`p]AnL#JT(YmZ2FfL2
!n6_EiE9$h?D@8^`A7\?RCjFJL!4'3jc01W91[mh>d-#/XZQ(`A@+4S1omacrl:rnGZUcF^<
n5kNbbue@\B:-SmqnnQ_D7fB%Xqp!r5?D0J\t=phn(5r;$RW^lcJu[O$[Xj?%b/<1LZ:n2cN
A7f,GVDn>3;;DNup1Cd(-+GVnEGk?F3"o5OJDR$X`,cIW"UNFQmfl)m*n4/W8Oh^PjTrp:nc
-dLhXAu&3?Y+HUS;qWSrMh=dc.iSH11dLOVV37eRsA2NQ]AfjH'qOES&%J;QWp!YKkT:?(oB0
+UIJVp2FQ4C$Q4R-b;eH"52n_lA/MTSb>jgi68'N,pk\:^7YJU]AL5Y+4\k774ea1A6n6JoNN
A%NR%<.CMXSl762Zb&<L5H1i;(3"'@=OdaEZ21P/1<&t!)R<7--uOQ%.8mFUf8LibWNMSOW_
]AWX9LCu[&K]Alb0Y7V:Ti72WQXQXsBU4Nf*n$m%J%R,65256h=sE_3!*`/V3\dDp+3e$o>f6,
OU6?oGbUdchn88ZFXu@>HP`[?4X>kFh<2!.8'dX$0esH@eA()[cL39F+;!=T.l6JsK,#pPQ?
2Qf&"`hG/Z%sfObF"iZb,b5F5f4C]AJo4F:/H>hArpu,/fD^W4RpC$mCPc&iq9sL"Qq5[C7UP
WX\ap'HK[k:G,DsiM524Wnq"=coi*iUfm>+*`q5c<!eWpGG?bRVT5.Hf4hAuMK<pdg,Dn@Kn
?%50-OmCl<^>]Ad4;cE]AHD<<<T789[Ta]A#3hI>f$&cE/!W6.GBHiC)77GahFt_r9?Je(a=Q5>
c;h5>/O4c<_[0UmrYK8]AdK2&?o#)<dTY\]AeP"3@MQk0kHi8Kq4H_=aWmMEMA!NCJKU'[]A\*'
oBT]AiN,pt]A6]AFH\?5TjJYT"ORUaqpiRI\1D4$.O*15rZQa^(Po0Wh?:U*:fT,OpV(S;.%cN?
Y-kSB^;Q*q_.h<8^ud3_W3BLA8q@>L(c9WRf]AnIP%EmAA6%%b9&ur;k>[p56Q-F;ZRbIU8W<
^GqH<e4P[!gEURK_0%`pqM51mS:[TB(1<HQn46f'm>'K\H'hMS7u!SVq0d,bRO>:-4h]A\,*l
$jE2-K]AFLTk3hXZ.GF+tf`KmqbA*[RD=9t`2Gcq1`2@I-ErCIBi=2D=E]AOJsppcPK^^`1TPh
%b^M=?]AMiB#o*^PLu[rC;K`.'j>E0s;6s(O_\NSEQ1P,<Ek7*Umt!W&Wej'WtIaihDoe(HK*
4<bqnPDh(!Rh\`k9/H>?CPKuiYF,CZO%r0PNb^DNC!6_^X+ZM@?F/ODNaa1EG^mO<bM6[Usm
aRBra8Zo97]AI1D8mrf[Id<ZOfmCQ0Gd3+hD_;B[B+KJE%B=?[*S;LiX@E_%%itV,Mp_q0ihC
i-2:[i&W:.$FdJIB7?NLiM[SF@qmfg>oJ<RX2d6B8]AH_cXE#fLk2dDtGe`5Zj7.WRe9pC[Uj
-@SZ&.8sNS>jR:2\D>nS`Y6mM[WBl=2]AgudQX84*@2sR%<:^mHF_!2>@A)'7C7^X_`GJ!tPG
OH(\?nU-hh"f?+VV8A`Rd_K+]A,5_;"f1B0oHW^KBBRc@+qVdC108Wq)SdbY]AP',VK)/?*3(f
.:s,"&7JgtkeaUN0U!Z9M9$5V+r(`7/J)R-'O44"9P!o9HK957m:Kp-G#h8n1RI08GJoG`E#
b`-t$#R!lC0>dA`-Lq.3S\hq0*ZU=alM&qc\(\EK\/oY[I-rT13'G[Y)6+_)8t.b1Z1K'8.7
C'YLV3]AaC\;s_cIih7XdM,Ldt*5DldWAU;c*>2qL/5Q/hhH.Z1SJT7SXd`A^stAd98o4'-%t
`Eon2jE8NF3VU?L-FHm'cVH2,$k7,MbCN921Dfm'F-QJo(qEl&X%df-b_Zk29\AUFQeo:.p\
-Du$!O+N\C>eEC+9JtL*k]A/FH?ar\CHcP?g!DAT7\OCd]AeZ3rn%]A@`7i\[:KGejJ'n%'<*g8
VU/P]A[7CqU2;!1@0kc8G?9[Zkcl`FKT%I(ca]AuHa:-V+"`_4u1f9hd$Pq(^n.`5?&]A>s&WRr
oe9T),WAZ68?UIf-&lsDc/1G^V9=cgrF@)Nq-L&&FNqoKu02^lSBJ%#U(O-qhNZmr,]AnYT-f
j#3L*KIhDd@'9uu"_D@>dM*GGHhFpY6/[7d,Whs-5*-u<;=3+C:AV#3r<-*_Vg/K-Q/nA35q
"g*-NZK$NhT=;<P4Qc<Gr<-V#3Y2[tdDt(VI2jZcY+mOFqs)B/+8,'iRK>f$en\Gn;]A/u#^(
69,P9:!b%QKF30Fi^f.kCES8?_1^9)&dE;Xq=Dc"lnoZ&,j']A@0q<-dB"UC2nH+k0mk$!d'@
'q+AZHai#fVr>Em3OpE8q8`Qg]A<j>q,j)+V$5H/2=*$-CMjsAdBL)\ashe*[<h<]A"0aoqprh
?LUij/2('=l(YVVu8A(4jpo9m_YcKI!Qr=cIlj.rZf<6L:$0c8bgA<VbeJ+Jh),om`tfF[6_
8cGHQuC1NZ&;aN?knRWhcW.>II3oO7CeZ`3G\V)>kl<"`Jki5Q4DFs%L;fm.;b"oAN?+>,Mt
'*.(eIHJ?rpX_A[#B23r\f@2NT\<pYeVs0(T4;R8O0_lEV`#$L1[6'G^&uV0"3\c6m;u^FWg
,^0PI;*QDNldM"Vq%D_"r#Gp^]An)K,ma[V$\)3gk83E@l"Z0F$0f5<+OQ"2![25<.`Ee2'G6
?kg]A'tKaf"S[$>,M&Ea8I)<hd`4rd(3/?FL@cIs;q&,&%#`Y`m(ON@:*I@<DK[S6IH5IIjU#
g<&kV\K)ANmeei_a!3ZJ'$2"EQj\CkkU,t:4>DZ$Mu9l*50\@q+2&-hpUr\0)n]AqT#^E37o`
75K?_[t@[PD!(:cVs'k(U3MaOT+?uPCfK)6:t!fY3-5A(;L274Ml#!LP?dRb=d!/o^TFc;Gg
IMu+ZMnG,G8L-Yfs!3c8#i^4.7LbGo(dGCESC%dOrg<2V,L_Gul;;N+S2TrJ4riuSmG"X$,W
2?Lrk;NXM#kuu)*2KSh>DFU;'.X3N_&<4*JqCMB+gbeWIUCi+eu,+)d#9.8l)+`4nrSeEC4h
Z%VN\r_`6<=UTMpt\QhWS/tkhRW&Z?b\[eYf=eg(<3D[`Xj#5KL9f5'r.)_2Or!itt#!Q$Ne
>qi^g!c[d2(5''B,crCRZgIup*AS.[SB=a%V3Cu[F4=(@TmJhY5[e%(IlS6VMaUAVB"oVKXt
FkG+3M\=]A#aPN.W%%ZU#&-^2VH/>FNqu<:e>;Qh:a,V_9p)Q<=.LSHp-E*7[@G`Kd&m`iJ$2
WHI9_-mNV[VRKrFO&,;W=k_4i4A#?j]Ak^GqVeXZJLMA0j;N>:#Wc0QD9CCrE#kW2Jd!_C,`u
SS0H>La[1<R[+9U\X*=/h<VGu2(+Q[IU@qMV,.Lq^cPG*K(DakHXBliTF)&3V-tVa,mFn>s3
5A=CprQ))jFbj5(`$-GOE_HF'SNjc2F?M&WoZLdUXQ$8<=]AWTmi'42f*Zg0h$0bIB2/E>"'Z
LIZW(&;c%cPh6iJa&)AYA:KqHmL8t*I`jA$KEfNOi4CrapSd\0_>&FmlmGj]A-=d7$ESY,e!j
$0=PD\Ps/c=&?*0.NWKj7K&"\Cf)HRjWB=jR2A(!3KBh8`=;4=Yi@pNetCt";,ITf-g\jH55
Bp,C[B8fa*aZ9U[Q!:'EXN@&]A.OdjIY@aPmY?pBpoSd!Ta;OrIHB4[aka65_TN.`m">t;]A.>
M8lJ%%*$%X%(jm`,)9<^lV\-rN=*Dfk6$]At2W#=&"%Vlto?iHZrEI^.K8*pI_Pk*q/Q*6k/o
[a4RQm)e5j..K1Cb*:YCVr71W#[eb'-?W.&Er$h%ijP&ttRm2l&=D-=^o'sZ,QN[>YEr'pcA
+eBY_$^b)VFI%J?>L<,XWQOMolSjGgrMGKi0/?@>D_ofjl<=,CQF#<=`<LnB3jV&;LaG'*=E
F0n"FL^r!`Z-eE@.2.QI&k?JhG[3JQe-!Y*Y0%7Q1:8]Ai'Y!]A]AHeqT5=<0&BO:rGtRPbCSRt
dgQa!Z@1?-25I<haSqAhrc.t4\XMH`\EM15cD+a74L%=tXP>I2l^pXNc<o9g]A&88QPe5;<#4
1Nd>Uj?:@Wa9M>(8=o).[d)/&L2F-9]Asa2X7d,-l5G(rrIY0c8tptd*fDMp-i\C^Sg"p68F)
^?Q7E2ToDB/+A10/_cm;*c`cXkcS;Q[qK7e2W0AQCn4=<c6Rg74NbV:d=d1!JRuRYn-";>-7
]Ap$jQ-Y:K:a_bN0_Vt;"e@N8?A:!bhjUXSYY;Q1AOk.6Ka;h/GaQ;.&$um>7N3pSlXbuj;/O
QP0\e\paGZ=/B,WnblB_e2$$'Y!0F.92<NV)+eR35%M#Z"BYIHC6gWPnnjVgOW:+gV2QH2\,
Dpc4ndcAOc^LfJ,T,6,JB"Z$ugSnLCYRm_t81Mb/S5kG2[-(i&$-WS0:+CEm]A#N9V4J1(ldi
W>,)kIJWXM7U\?Z[l1eUO/SYl;YhnDarZ@Bq&#aFJ.slQcVjE0/'B&_U#n3`'["l!B/;Q_+R
7,tS8GqueBg`)m_e4379c62.q+DlE_ci!lQq6$Xl;,a,*CmQB_$41A^(<0?QjIGK8T@EBh=8
rX(DpueaNd.Ph/=gN]A\f!>*Bb_*uqZT5ML_.P?@91Lf-#:eV*Spl2I(9hOUA1AlXH20mZY.s
R>SBR>\MBgRf5cJJQ8>*s[QCH.)WIWR-mbIA5@>Y`ZXGC-FU0+*[^%D8?h5erBE13W,Qi1%i
p+A_fs.^l]A'JiX+,!*Z1gQ80W.]A\iEmgJ4d857LJ:*g3U-$a0.#^>hg;RYdu.JkEF3+NUo]Ao
#ru,q$/sro?bhP'q:j+m[F"]Aph5+rB=s,h87gkB(p1iB"-S$>lI=>allp#pLDf(9F^]AMGs\"
4BL_B#a6RdU6V;]AHG-9(#V!$ZI-r@IJ;-rV9B2KouV_`35H#+.$12HLD.`@nN?QHK,XW1hZ`
[%P]AVkJ3_J/]AiIi-H#1P"3.G90rP`D^\PuCu!bQ"MFkONJ/_!Gha$s#qB1/CM[B&':mt.R`0
2uoDi694=c=@6HfU.TZs&R7+YKIq$7(EH:QG2dO\**7]ANl-FD0IZg&1;1Z0t*C`=.Q;S$&E%
B;lobp.TaRIWhn#V?*]A79.Gf)Wq_tg2nM$'GS@T\3o[mp=gT^)3T<e9arP/]ATMB]AC('g,O%]A
Z#$j(GXRDP1';B5M7Qf^t8o=@bu"IJAmZ&H;eg?O9phH<IYW3cHg%M"6(W=**3YdN+65f?Bj
B)N!)&4:@:s>lo@i8I0V;d+;6?`D*44^TA#m]AlM*Cj'k$J<_42#,"Jra8!mtmm?aD%Gk2@-U
\1(t^o8b?+Rl"Pdj[L,g!e#&)or"%B0X:W;G>,l#"+j(atW]A6d7:h4Jtm=l'u<Y]A!SI*OFZ(
oUTR:onX]A(!dlUaE@etG%i]A:.<Pfn\J9r:W4Tc=c#o)/q3LpO%DYg?mVX"Pt6u:t8ktQLP-9
ij'n!I*Q$4.&;F!;b-:`UZag:'D;[;`]AVc?U,7Qj2UeHaA]AU5qARuesoOY%C%pUP-U5W6YmY
Im;8_<e,<VK^k[FsMGlac.8>mS>sqa!L;+,TLIc8^.oA3Iu-iIO@85absD@RBr"WnUZH.WXU
:l4i[!e_(7Z8;B:0k5YO1q8q.GJfrqS73mIs)\j`@:@0VF#$VQ4<VQ)#^ij<?,3WkAqatmR8
$+7sLEuSbU>`r5g7/`(\X,lViSL)`KW7G?70l15ogid1G@3m#'F<E[i<ET=EI%#aVq"*u&1D
7hrko*+!2^sCO^(8fnOqP+CUc9"OeS"`6%]AbW3UK^Y@OVe,ch0p[dU:'8S@hZ$C;.5nDW8(<
A]A0eKO,DQf;D-`l">X%hDL]AHD+IpbV&Yjh;<d*T.:9FHiREh)TfXfEEkFKoR83A13]A7GEZMO
sl16E-`'%K,XioUF/XYDc^=76WZ;f1W#;8fc^F'+_kkBdg<3rn)N@d8I`W:u/i]AkfLC._=l9
W%Am!M;D-q%O64]Ap7s5>"4M.oJ6cR>/)W8')c3NQ%a'2=Pg+8@X0:Ba?`>Y3q=_Y,=aU]AQqh
pe1gAd$]ArQ@+_XgB*;t**&DIoMt;A7A@(gp>-c<^OJ9Q<B'`EqkJDPg#W(F&7r'%GKno?`8N
7SDL6Y?]A\jppDB<1Z5$MmL\hU5'<SqMs3qg5^JWcl;Z,#qb(M(FJ/rdoWNZr)\b+8EpJ-cco
hUNo[*,YSU5Ie@29dNj:l5McL_acRYUJ0X>\L=^X(7]AK)Re0`2B\i7mSZP0hY!<E=1R>I6=Y
>#Y#H[oW9a#9@S3&0/gi)QRI/6t5`U=rJ%_LNnb%YuP]AqRt]A2O<Ci/ZjKtkR0&H2I0F$fds0
=OSYE#Y`dfNRLl.m;N`fghM[;piQU/=b-F3M32TaM'=]A[@k\u4#A+fbmQ3#IuInes@9Q80<D
3Ge+GB5X%B1sCrQWPf49lIW\T]A[sie*gi6I>%+Rn37<!0QDX/UNGW_)\B(G:]AU=(I')'`*G)
^<B`9E2O`ASYmk&(IN,md9AD$'5alPbiOQ+AaPi53Q[uHIuQ2P_\o,"%TpNhQ%=[C^.HfnYR
\0p5q1@ShFM:4GnQ;;)fZ)8'uq4=FZraUJ%#plt'l\"3;&%shoq=FMM(]AQHKmXP(<7!/IB08
bZYcm24"?X=_q7hYLDggg=krK?sM&c"q/&[P"4-Z/U`@UtKp#5,Xj09+,EgR`>q65+AGH0M;
i3RVuFZ$c((-pBX-\KK)kjb#Et&'oH_.ArFlD><lLVrnEbCQ45+GC-l14SLTtXoH'5?s>RoC
WHCMdh#"reKFfki+-l?4md'6r8;M]ALK6b!P5\;+(;d!DHA1tmd*kP:CtO/NP5k.f2.2+;8GD
pIAWCN:fjN'_0!%6*1mnJ3%fJ*5C]Au=JgV^b^-O7>V:%]ANk+(:3g^JQXf%h)6/E:/p+@X5KD
*j^\<q_m*![+TIJQ&+<@4$>Yh1SIb]ARcuuknd6Aa]AqI?`4;0GN(!lBE9Z/^X>:$<r1si.A`p
]A`X8e!a&"1*O<#ZO07.)hL$gOduN^aE35G8spS(-(q((-g?)n-)s$8Vs9.4Y--_*VD#X*EGC
E'R+g3lPoY?om1ka&S#k"7!oL!_a=_lgH18`e-?Ir<Xj0^WIueOkk-Mo>CqEdZM/UZjhbbYV
BU1tQer$n8rp?\SCcLkXW3r/'oRrkQp9oUo%^\ultAsRi4*hV:mf=Ro!\"KiR#>!IC%VOeBF
Ft&pO@(*)\";ERuftW)_Yn@Ns(7'RGYQXK:b0km%$[:tp%uh&`:]A1D61GidH23rn,C,2!aA[
dT5FK]AAD]A;\WBYRLQco'l*%t-jop)_-a>VbLN[RuCrif`d/d^!/g97SW+Wg]A-b5DRN_6T@`Z
MfOPc."O]ACsL/'%3^Rj`5+%I^0'@24VDb8]AQXkLt^'@@m.,:DqD+U)W5F@,TD]A[g,\=h@`&_
u<-pEolr%hdF#T%Nf/Nh:J;]AaOfJeK,X=76t\7o;J4\3:\ko<XA\dWdfkb<WM'WpX)1(aK:]A
F.rneks5G5-F)oEuW=:M,pi"L.Ur.AEPV5g`YqZ->J.HV'315_YEoa>8V,DA)[@=6"KK<Plh
9FcKp9>b)PRRD`/PYP)#H(3"a+Y\C*,ge+d`c%uOAoMkVs@l@6Gt--HDYYHI>g5f#\/a']Ah!
UF;jWEbBZ(Vd9-Ri>l,D_$Y2VZtr73JFkaIWf*b3I`m@*ZTBqhn[h=R+>LT_OOBn*s2+^Q"$
d*-^,F#;_rO<C^\Uh>d+3cH-j</"D`-C_,YSSr*_;i_9TL1Of7W$"&)YerbFAl$"1fY!bmb;
7S/0gl$EttR\ZgI([QEX]AGLVMQKhXf&\([#k>W=uue[XgS-o8(m"6$&&nH=8d81ZrC%eZVRm
Q,EZ`TrIdRnm4A10PSoV9;t241Up^B]AF?fOd1PZ;su%WQ5FGBh7L(b@>I;WXf4[aTDi6ur<c
R3M*Us*Z^?NC4j1L:j"Kjb.,E'_.[Dlb05-Ct3LDU^OLsKg[/!`8i!A`-FXKnCQ-b=YlHA4c
"<Wo0RGMA(\0q'J']Ab!q'c]A$H)o`dtgeICk)$!nRl)FIl'1\GN'rbKsjD]A1_!q[m;'uT$36W
:gX%Hk*<Zg7r^Gqu5o8^!78#UcXBT]A%9(W[IM=-Xt$L]AI+VA&(>h9beX'uKi.YM%\7*[3lj%
h^9SN(pk8WjHs?&-]A\3LkRTsP7WP$Ns_\+l/<I3^VP:Wj>/&2V6Gk&qB(-F6U#re3W#[RHR7
I8K4Ti$+_:Y[-^TA$9.k\%\u$S5rhM"*CmaZS!@)i82I`s@Uq8DHE9mD_"oUP@b3HSR$&0CA
mk;GB?_nqnGpV^r"`Sq_[.L5japXD(K74.WmJ1nK?Eb#uukakk;.YH'(`GNlf^[$lCp;_S-q
7N!n9G?Y$>#0kUQAJ4N-1QnEK6oFnM,cRlMpor4TQ>*&;CCpH?lT&3RjDP<+*_kPuJ0%b0b!
Ju"(3Gp)-4R*MP6:_nY\>F$Y^UGWfaM)a7V*CQIl$\LOO&;3;*GWBi!%o(8p5A"bBb#.-r\I
;Akk5OC#59U!lC+M>`./'0eJ#L-fS6rYH"[hr6_4VV=>t-9tUeHB0'h;D:4J&e^k=uNl!)Ph
`_m=<O>Nm."GH_&;,3=PZm'3^if/,":ef.>eQ2k1W,kR!$aClJkWbj>$!uVbZpNYK.j^e&,`
jqk.nAZnK[n1hg*-Smfto!pmb,D'r!QkHf_[*Y/p^E^k-^U@>*<=;,q#Ves"7=a%I53GX<ep
a6ufN&HVm\mt`$X\rqk(BmA?Ps%k%9MJkMp@<?1kL+8:t?Ml/-r//^d6)Dab#+(kqONu*L@2
`A%@UXJ*8IkE)`'\gYLiqFk-NJrC<JW2AR^3C1M_?ik^K!f&@7&$NakoJ/HEhR+^<')R,InE
_/Eg5*8!cm!P51+kf]AR[,jKfMO#p^U7Rb1k.4)ZjPLAVnYBgm1,h=g_(C]Ac)qeIY7E1j9BM(
r!;Gqlni!Z2e2^Fs!sfL\?ZANE.eNHKI,HSXhh49"i^*<>N3NlO(\#?=U<$F-=`l[NeBHZVn
/(8IeH+H[JS1eoQ$0$P?j0h%Um<FtO._a0Laqf<_@6)X82D93DjCK;<4tb$d:P[N*-5JFo*(
MR)13,\bMe]A#8-1ISir2a3(TV3]A,Am)mm6i5>n_/jLt_&<XZTA`[&rLT4i\nC)sR\?qYN$(/
q6Q5$IqF^it>sZSuG;:g^r-PW'LFk*_BD/tVX'V\TMRQ14_Q'S!@:qlGd/a'(Em2*S;[CZ1E
o]A27Kq.&t)mZOT:)SY:Hl&k<Su,3u-!-h#C`8P]A-"l-&f[qQPaCba(%h-4/rb"iOpqASTL+q
a1.feTK8B&ep,++&XGcQ?ip;9<:KBq$U5uh,;hPFJ&$p,sEY%B^mbj7'Xf@$3e;QO5+m[/7q
\K_6jgL1@D9j5?V*$(KXShK""bL4UTGq%#p7A#5HA4]A)%m8blI:+DZ,S0"'p_%OnS=8=fdCI
qbuQ[)ju&pRmOI"C?mX^-S=c(brPH74Rk:01=fseQd^l8&n'1S;1=F//gPMLf<+n3bU-Xqma
Ku1jU^BSSja,5Y%Ym/Wo$cKWfbb[Cuj4+@*DFY^YEX`TYQnJ*4BM]A>Fr'4XYDM:5tnbndq9/
`g+-r#WDAJElDo5\jLk0k[V5`cPas9Lb3<=J:VScCj2A^g`J.`XpUfrF;gg2]AX0m\6YNGs+[
.Vnl`PVp5!EGUhk_J'l6%d7%qlu/KRC$Y=LjQbl<l-)K--Pb!KRW\l[uO#H^\*1g3<LDVX]Ab
VnR]Ae!k[4u-f=etu#57C[Zna]AT#n:eOH9:,Xf2+%mV;KT%@KFV1UEBp_l;Hi-OV!&?p+NSjE
9-SJOD=M4O39teFem&O`QY//KL%;!Ca*J,p-@je[AnKj,\SSR>BD@4e:\o-YB6IH*nM@iqeI
:HhapV8V]AT[M<gAPV39[NGsi#BXoMe[+J_q'uXO']AC0nRRHc.9Buh5i]ASWD_N;8rk.(]AJG6m
Y=>/c(8q/+c1r^->YbjsB%Oo#,;)Z5[g=9Q=Dh&k6=,pEuQ.sDeGD70a1j.?s4[PKUD706CQ
pL5`1/a4?o_12ZQ4M98%OQ%iMJK.f8d=CDnt+j%OF"%me^P9U`j.:MMA_(rqe`.lD=nmgm8f
6prIM''rHY">hY'^^;pI1u5,?nk2,!7m\g<+,2iP.*F_7#L=[jh+nq0Q4<T`'s]Afg')NTW\m
`tiNYNWtY2(CrZ82]AGlS_eO0lqU.]Ai8V"W[/ICASUuGU>eeE15<rLK(?mBXp-fS]AC6-lRIU]A
t+@[ou(r#*C+@i1b"8C;_5-j!2kc_`%WCqc_kmS8/k.B'qfM,9J<=OL2-\$W]AR*;#N@^E6EC
\<H(d@b>d/d6_X3p98+_Y[t.=KX^8bQ;[*jm1VIA2I8F1_=kW>AKH8:FNr4,qb9'IE=@N9C5
'Z[:RPD^AX;c/3LPD\EQQKAL't/k6^8e[b'<a1E6Mkoe=$KA.*j#*5Jp1MoG,B,KF)dSDZkO
&VjnX>d!b^,D6/.0>@dr8YAt*MpSWGnWPqq"3H*WWMYc`TB>`&R0k,+1lS*L&'-jJS+4*PGU
9=;30**%#'2Db2p#CQ+N3>9>W8M>jJi1r56U(VR`6R]AYNXsGgiMXt_J9;Hrm13F%Y7E,8s"8
b^C4>uB_Z[:+Pn"9%_Ee-aKMVWY27@kus?l2ajXWGTRm-SI&&9O`Hg_(ENIuqb_<J1q&K`Nj
=,uJad5*0#)QfAO-%I\aUgQ3)@G<SJ9"`<6-+&'>H,?aO;oD(QPL9.h,Fpf8tb2)ddo'UZ4c
-4+7a$c#YP1jNP93G_k+]A?@QWAV00%)!*]A#%=npa*(eWc'Y2V%sQ"D=m6Lf$_9?!9d9]Ab&A%
n'l+6"DIdsRMSU6sX!1l\m,b=Ba;f[MC+J#34r<&Fq44g#F-O'?kants-pSo<qDZi3'^<#K9
?21X%A>Q'>>&o)7ck"0f1(;\,5/'?cmeX$9-W*lfIBJ=Z'1t7)OgEC'?G09tY^WiYs5[a[(&
5GdJpDW)'t_-XJgo5oE6_\g/4YLd\T9)]AI2kO\:\DC]A0'2oi4G-<C>[#s<@8/PJH9e0(ZD!P
2[.A1Zf7G%@r1=P<F9`fa8oaO1doMm"d&Y-`"#ss@B'@]A5q'"lCj&8ilV8^X5rA1qNqE)l;:
?Io9$q@8[mHZnXmP01J\dU0/eWd$6!FNe,N)MPa7`-lWFLIDH;cmb5gpk\mCd'Z^LS9TqKu,
_c>&@.8>KIObEL[OOcJZotmtC(03W_5_en)c]AjbUX5XBHc7oT.1k]AFT!,_0-e%e;UX`1%c(]A
1`&W#5h[=1/d]AnG%'(Sho)-O*;7EdL24S1C[s$.&idaepI)OUuW##)GGTc)B]Ad'7e/'%S%Vj
DKp*-]AZ>-d\rSHGtN_0nn=uE[VGk@;pe,?_ldTjJ*rbYmpOOqU@ZgN$XZk]A7,Jd2'4D@*)*9
D$c<PPI'[`%h:9moPuImujHUo8oEX&G+;FeYI2tR[1,\E`?GbRPEMDXa%BJE+BccUYVRYDg>
rH3^7D1'#c%@6o9V<'cp`F]A:X*pn]AEoFWh0dbft;d<^-a>[`Q4(hl%i7=Ag2J'6g8;.E<.(f
Vj]A+I3om?LPHF^9(Y[a!8m@`G5"?0XFY/'"6a\2O<H#;]A.9Fu`C[Hd(!s0.QZ:D1*=5m&kT:
C:'(Y;C(pBrRTU,69WWE)@[OH(*5toGINimJ&#hY\CSRh=,J!)2#R!25g^Y$V[k5XR]AFbOjD
L?i@+IM:i?Y.c4b;3'h!LS>r%B>sC_?\X-7C\LQ1gRJ`O9L8L9?)]A3rVfBq6P\[F(Cg-^65*
.]AC1PK^,u4(R2fVoq=Dk;k6f0dVjEJNYs`iS3.]AEdbVq#rGV<i#89s[GO,VMi=_6A_C.eckZ
8[!>V[ZCQ5@.:Yl(SGg`mu6qL+CUQlPmqp,FLb#Ij5U9<6LO0aB;s0WP/eM=Ok7=f6$^,D@?
d9Y*r-U3ZS\1Uurh\nU[7f'Al[/MkGFJ:lA<PV]A9pdlg%L?NUP:D<X2#KfB@^q;7WSZ\;TU/
h*,nGcT;TQeQodDSYtS7F[m4^3f@(L%q7Z_&r68Z"kHcmI"p/Gm*<X,NY.Je!/EYYUSe?+M;
F'/RFSYT4Di'kq,^PTO`!S1$gbu%RY#D'5+.WjMlR(T%,Q\X,NkGN7/Hb(F*SgAi^L=*_[=!
q9]A\HQ@3hVu73a!iR<K;/+ppIN!RP"R8<(C=J-YjTBZ5OHDK2e)KIka;V_`<4\M8!LE%$QPB
H+W%Hj'<>m/Xg_pH14shpbC/E":N&&,\O->,iZd%cLuJ0'Eq3gM2?.S\O(%o\Rj92/Bl)8ju
#)K)H`tUYQL>Qp#OU?"0U^Cika(6_u-[9=3MG%25\0>@]AF)P9ur,=%_]A72EN.WA,L;P'TeuP
#1/:p3f1&uFrf'i]AHp`R$b6$cB.d3Z&2D[$UK]AhUjjT$`h%p5&E$Te)Tdnd9Z$.gEfstifMl
^A.gGk1.I"K6'g=6OY"A'TpilS*cE;ZP>?.-E1coqfZ]AMIF!HB$AS[gI6"%X>B"eAm*bB]A5F
qEH*O9(OF1RQ:-0kM>f;T%B@)ag#)ju3G0Oqi+FTb>lp:*!>28XU-IC(S3hMnaOer8?VNE#4
On?^j8aOsOj#[+>$"$,Xi>Y3q5irJZd7c*mi%+?$%0%XHt6:[;foB*Z?`t3'j=OGN]A>+$'@N
cANEqh'ZUdZ3]A-Ao>DW2Jb:\S-#U@6.TG*Fjah(*+SbH&H"KK7j"fBP5og>l$YF-#o2$NS4:
iu<[6#"kc;N,/P[S85V/oTRH=eNU$fosLX&`3/S$=1WFS_btT,2l/KOaMp;-ZRQ76Hk<Q:.B
qib.?JZ?4^PD16d:'ST4&#DIEpI&cg,f6[("#Cf>2,51=.A[c*<3,6=Gnh2:V?E&F#'sQes6
nD>R19#8;%iRM^)7m1uM8n(es*$(Ig]A@<F4ps'Re\Z/M3q'LX`b\ilm)r(bTVkA`H1Y".`'E
1qJGP@]Aa-SNAEm*gS<`VkcB=KQ+3(03k'S4s$LG<>I.<NZH-_5kHEnCX6'W?=rVP[gR=Co%2
S^qs19i8L3@iY3nFjCGKNKUVs!'pqIUDj5RT`o@:*afbl3dHP9r+oV%Og%k!?RT^A1lFN\/r
+a]Aq;(XZ0?UM1U^Ie<Ge\,)h7F&Q`IA>sq:C[2.Z#QCH]AF4it,S0TjjO?BQ?CQ6caaPX(".J
aj--;qAEhtq78NCSQL<_+4[4`[i`8ErUiCj^iug[inIr+ds@J$Z:Nf)`M]AhluL1Mj<:N]A)<9
!A+.mS]A-jcBV:\2K)&Bt(Y]A=fb\-Pp@_(+PgcUC>^?hHV<Y.nR=-p_9V`$P/F4a1q9*s>InF
UqXC+JgPM$7o(2bn?h0!0VIHX#a_`lQ;'j:PcZr(J?8hY/O9^`#S,Fm)9fdn[&+N[41S@0uf
9q7!t.MiCNM5^;FHd1/93;[9M`NmL^A'n$^angZUh+dCh0/SqVr7qX:cGqU)Sa;@ApejU6<R
bA$c3-nB1fY4bt5-sqCbiId$0JZA>go2OB7B_!pjNhu%?f%146V&\.5,cBMo>E'uQgQUl!M(
u[>l(LCer:O%(*Os30GT!H-D5h]AclpMgf-C&e@-^@+NM5e;d^_;LDhb\UE:ecE9"FR*F/jRZ
dH_gZi$SEas0]A<\W2X(jF,MG5S76'(;>qG,+<5GO9KO+:3f@fLA8k?5]AU\]AtW#q0k&GZ_,oZ
4*I$?Y&R6Fns(>gEP3f*)DIAWn-Bmp'ZA(*VBl@Y>Ko,TJUCIQY);^*dRL+<9'l`KFiQ&^Wk
IFb0(70[:jfq:]AkO1/jkf\Mja6EQUps'kkbc_dt"<$3DZm<Gc;o24!)o0\a.N(-?_eQ??!eq
p:+`;9RT=%euIRnll^AurN-dSUa]A*0;U^H?nUQBKEb2F(P/A>c\&Dl'nFFlqa_PhZESp]AFYE
uDCE/!SjlXqTiL0an_67?9djED0Z!kj/+fn@E8OkPZ&eFad_gjX1+pFU46N\X`1<CN8p&+[=
Iani=e3ZG9FrD4R<9[2L$LrCaQk=UBo5c.(4XPHq@.ZpLH`jP$*CqKV/LMZ-+o@J`.Om*8fh
2,;rfe=-ITnYf]ApQKhf0_jtPOFgA/?uE;']A&9,DhL2@hV-370K^SCl7XatnmNY)BR[Q..eI[
/t1?4LN?J?!90sV?ccS''M,Ap&b5p$WV]A;Mp<.N[.aZh&RM)i0TA;d3=AB->$oHIK*i5_IQ8
=ih]AMRlE2Moc;h/3\(%Jhfc4mc`LS>3W@Xr2j_LHMsEDR-^Y$nHh[A![(k+XG>^,0l1?Q"f/
NuER/d9\P6IuYMk(U)EDtC0(]A\TogS'-sBGNO9j0PG6K,h>`XeLV@"qOfQj?+qbLL!JS_0F=
N=p?NbK]Akp(pC6r[oW@_!fM?;m"L-;Ti4+>tk$V/sRI=iWm^ZUOHkf6I3r$%I3aP3ub3$c^N
b`1r/'dglfA-%s,.PX$*oW;B=a0[He(487klK/pJ`%463WU%*/@)OQ@-kVs;Ai3d2^ep*"p"
[K[2hjM^q/mXPoqO0?8N-7n&)n)HOm0:UTB_1[if=Mp([,%ULW""@1(LLQP,?2=S]A]Ae<%;&8
U=LlZ>.Y4raOkKa/GQ=53a:eo)d<:\9fKW+aI\AR?#!pH3oO_2E&MF_4S8!cAB(scPnK7Qg-
7KU;E[<90B`_&*8pVUQasZWjXW<IIb9VVK!>]AH4LF?.+f^KTh96aXNlgt54S@dl$j>YRT=au
QCSR?]AYfk=:gn`07cZQ4pXMkR'Vd2F%*_GJ[&p7N-N+Y,9'A%DOrCH*/KT_ISjF>lISN>nJH
>a!josc%_"*(fa?ZVN_)-O;Nap`X5$/RSmikN?>Roe0#)']At8$T$X%,TpQ`jf]A!d2Ak-sSZK
D)!16n+!7<`1)$-_r"LSR.?&U,MZ(eM.]AZftudcmI+^J\+CR6,'6q?qm-oEpcEQN,]A.POKWi
[/O5MY"V&'8"_Xi?r2T!Lbjkl+!!Tpg2#3+>?nq([SCs_]AuDSqZc8C3gapF&[s/>5UBLq)!I
!#*Z^-,JlB2R+0/nV`SdZ%()+*BX0jXOB+hYG@h&ghq^KVWDEe)]AVb8DkKG,9tS'KMjl+X,]A
1BXo(:,V*,pb7b&pG<XsMr>X&?a0eX>cCq,7EV'fX\s2R[7PE,?d\Se>UF!6h"6s'$D"tEaS
ZJ6`7T37K.olFH$2LkO3F(LIbI\ri>M!6TDAGqB,BQ=672?KB!+Y0*NpQTWnI%^uYdI4oXo>
]A`MBUPk*r)9J4P$sLF34L*KN3;AeXV"NV`e`4GJA264I!6[L2,@,(MLl`"L$=E9X5(j?FA8@
r\B*)-OYHY^i!L8JnM+AbHE)pk?NfZRR\=HHY)cf6Ml/Cet6k@IeWBiJX:Ng?J4V.+&FrbMT
T*,l.WjcVkaO.G^O\<8\Pl1XNp7PXFQdZ?2l^b'6-QWV^O(thO9idGrT;+Q-03W7)&`4#^#P
<QR6=aX3N@[%UqnuPqR[J_B-p`?PM9PWXf>lg1CHS6beI9AkZOk?T3k.<.0/^?FQXYYYlE.[
J*T"'_R+%d_6cuqEFmFTH%?Ec1%d#;h4K0n9AoXb*MMVae_:.f^G%t%?MWS>4\,-0_/dqW[g
T:p24$1Im&hW!%iDcp5'lp=``O@lJu.=ahH^q/o+<,&S.EoPtA`S'U$qP8dXAihDP`pVH^#N
?R1^=(6f-K&%Ao!`LW:_j--I^f6<r*\YLc#LU;Gd)aV@#S6N/cJ/JYaa-Kt?cg[.f6@oRnAQ
.:OJoDtkZEr<>M^gU[nOGq+H*QfB2n7@uQV@#Pg.)"Q3&5:2qT6e&1rBVk?*oTlX6d;MQDR6
:eh3NXZ_[c+;%3?:TX3pBP85hfNVppE*s@O>89WfZgV@M'mTr1d)Tg/l+$c;r?IAi)htK)Of
#!"NbcY+a;^fkg6bY%GAt7ZMEs3dRj5)AR.EUb:m"05AYFkRCGPL#o_Wj0A1DiP\aOW_VSPF
M7</8]ARC]A&_cIKQRB__O.aDdEQZ-Xm8^Nt$\&$95]A)E.=u`f".)N1KCC!GjnCsh+baa(Li,7
Ztas7M6Ih#nucob1C;'p.%ahE.EXTU0+Q0No5u)fd$f%ZH69%jb2?MbLRSH=LHXBbG"OQ:5-
Y0/mNF`MAq%s>J>DCfA,O=)onX_2#Uf0[NG6B0lmb5<[k=)XAhV[Nn`tVVY1j7S;L#-nlT#Z
>=cC9@*@46Eg>g!%a)b(q&5?Ue-/:>@\&E&0R#,g84C?ec5G.bO#6SAKPom;rMqjCheK7uMD
hm8_`L8;BFSJ#E`8:/)'?u!(&t]AJ=mFN5dKa%^UV`qqY%M68GAr=?/b<2F(`\6KodA[6!PJf
1`H-Gl,cFSEk-<_a0q`2l%D,?;&Ar`LjrktY.Nnf4\O6CiZ`1q6'#?EonX60#Fj,9'@QZSpJ
Z6MCUctRKLo<1d_F=8`KH_aIX^Wl7Oma#!fPI0C35Kt2%]AfgQ^s1=Z/*8r.(dNNRfg6c'rSb
eK):klp6-"o6R/LNP4iC#'WAf=A\"nAqT>E%,!9hf%i"(E-?-T/+"1"Y77aCV6_QXdpG'_j^
PR)csHf9B$U/]APINa0`/:pV^%3%HRtZ4=\t9ML)l^#@N8uK/-P4CA/.bAB?":+HKrmnqA5J*
`V#pX%b*4ZW1*2`4sKY+bmUIY8ho;Q?-FHR(JG`AQ@\LqSecu-i1MaYP/o.c%j'X9W7@#VjR
&/KFKp^eK/0>gWZ`dn#$'2L8G/g>>(1cEX\LS6QGJ:+$pgtb2#U(of9.1\+Cr0g0Uh04aN4m
efcoD11dF+hO+iDimhrsDa0Ot\i"FM0&n_#S5n/W#D?jj,Oab_fI">8Y,"]A\VjW\<ZV+RVce
YfgOgG8'7CXp9kH*q1#h5J`,:Lka+5IgdTP($Ilf29kl+ukk[1tn#IU<'5mSP8$FL]A8cg,m*
B),7RsNVmb&:;.7Q,(!<8<mX70;&o1LY<k=IZ"Kb/9,IA`E.[]AYhnFrI^ugb*C7q`1l;m*uX
^%mu?IZcZ9tQI"lh41s#/tBJB.mHPf*8]A.>m6O9aX4GLbrCf!e`7pj5CE8Zm=?;/6qB]A[cKR
9ZF"oduNm,MO%Wp!B#+CQqbMsl:l$m&"M-.g1rZA^6r;ZXHZC(^FA;Gr<qkC2_E*hm(qPPI)
GWuGmT2cC_5W7gb@)K5)mN4.&%hE_ejmI$dQqom'I9_/<-"TGOi5>MKWk>NGaVR1NB?a>g0)
G\BiEKX]A9%DC#gjGJ@P+6l%@U'nF3&1_;"IeR&YtV.#kM]A072A5n=pmWMfDU&rAD3kFrD5Gl
<R'OH+/<mk%Qj/$aPJ=1`PKEO=H`,0!UJ(L\pYm??;0)CX]A[*D+#P;VNWQtJ2j)4;"ocBSoo
U))ho6e>QQbBfKo^&8$+YUq6`98t?'kUCX&qF1uc\a0POXM%'(j4V4KBp=8cq<,FVIf$&"-<
*6$*DJ!qO/"]AV<4m-<6$S+Sr!5cc$6`3V45N-[@*ZJ]A$7*h;6F5pots5Ks1Ln]A!J<lhatN`H
<G3PtPb/L<c\]A2%:46:N06F@F3:6@WWD$2.F7(Ud*65fW\p@HUM8sILj=Ja.[UB*P$F-]A<m8
W!/nLO*THs.rqrF?RZnBEOt)PljA/qo1;(5bNe[q&pQq98ii/[>)Dq2As^:-3,8H<4#pL4i;
M@nuJ`P`QqZ<\B'4BM0gr^ml_:RN&DG4Te1&_W1oV/a?;>LVW\#p`m+?\^P?["Fa^f@M/^fj
_W5T&ZU,8/mWX2$'g)c<*\pVhHb?u[B_08r;&gg[\kNL,+lS[;m:bDm'4X!2U%2(UaAhSep,
g^GPFlFCF>hO,p2[;ChCSQ4i&6qlG0%H9QRZ2$+W;>&DAKnY3]An+V5&A>>L\Ql9jQsFQ!fpG
e9R6%F.mCGa)Ud=RCCr55Dte`ZEJ-or7%`_267BjAq',+qOU!k4\9GRnoOFsZeLiNBWOdbkB
>9@^=$D3Ahi`IVgnZt!Na"8C'Sa2/At0Ga';s;-(j!a0c>4P4R/N0\,c;iPWT3'7F)BGcQQE
gG:h7(gT\AX>[6#-8_ZpErkF89l`_eL[d@9&"To<46FoIY@t5^JUdLri5m.CH(h+nY;OX;7P
"*$<<k=ET*#PMf,R+J;=0MM4*k\-?^2<bUm<u_K#A0Oi*,D[)*QPmC`u;%B'N5X*oqWJ_;Yr
2$0JFI%DQ%A[NFT0UP$t,k5mNo`jWV?6h:m%U9np@^<k%8'3b98XP?@1L?^-5]A#A.V\rg6\[
7]AD=D;Khq2)os^d4^Bl;W3PH=fu(F2)hIVTD4c",c97tCg^d*t"\QOUiYGkjPVPDKd7!BikD
aBhHaD03-!tbTB6&NOf!%J?fdnRC\rm'$5hX\k]AF'ePNu5W[oKg^8/&<Xg*O('ph]AmJ/aL4)
n$oo1SfbukF80\j`hu1TP!cSL:gX\M;\-sdu;)mUu"u-0W:'OSp8$ptb+ujnd`n2;\GVHCM-
ph$<g0o;"BJ^A/k8m/QkaA(+99?0gF&Qht;s1$8&)-t!?YEmun+L@=H@8"]ASbNZoVNJMrci`
UXGQnE*<r89141HoQ[b3]A?_B2H?^>64d>FoI*Y'PGHFTYWnVSAt<^LM(F<%ZlA#6,%Yo&=-]A
rT((`Si9>?CNK&#`HJgoO(s8f_Y,*[VB&66IoD*jAJI*"7N4V"&7DNHp-S:]A2@+7:),>j3'6
\q9d`Fgp@)5t%[e_u`Y5%m^Xi50ZM9s-^)5c$U^lpJOXGBlJ_]Ar\m`(<$GGeFsoqHdEe`M1$
)l#?oT6:GKbm#\X/HAXn[Y;9)U1$5Fi@A)bEh-ZA\XSeun"Mhf#63tA8b`H$qD`f^KR;Z2#7
E#@Lj@_/i>M6?S3ZHfCo'Ua2YB[tcmSLNX5h5"Q;B?2OXdd6`aBU_M]ANQ2Y$#XX8TfC>9<j.
7ffhFKt3I6984uGZ)Bc3b%3F`ge9dp#[V-"qHlt.kE_nn.M!.4$8r^+>lGao;]AZu*?/@LX&1
e.b_j4#l?&*R\#/#\!ViB]A`kL0o0aDp-Lio/c`PO5C$FFEf:;_)1G_I-Op,sXI^nYh1H*7*D
?0&(JXNAh?V7*P9o81!<A3KK)WQ@3qUtBGEKDT)N<n,ib*2:6]AZ^thte\*R+;mYd.AWLS>12
SdK@1LPsH.gWMbW+IcO`L>Fc>Q]A=d*-d\)7b%2m]AN]An42Rm+*Loku<%Lp%rXZI<au-]AXD"#T
.gKI50F[44e4W*P`gE<;<CkK(Ybo*BO[n#n:2b;Nm#;rGBUq-,13C`R&!#GFruRB/?R16mr0
)`\[k6,*4a;;LQ2sR]A1";)#4G#\d$8aUXY>(F$TuE.^>ipN2g3!F6-6$>asl(r:,1Yf?:N:_
`aPI"8H:UN,3%^b<9+40Na%"#6*^e]ATrd]AOA4=bcoh;f.Q8^9f6Z3)[lW&E%BKYM.2M/=QCc
&RQRRjmGAq7=Yo$g53`=sc\9jQol$XQ:;*maRbBe)&^&2Tflr!%I0TK(%QCpD2HqI-*\qJh=
p:IcLf]An8Xf[&+uema^eAOX5'Eg?RI0WhM,kH[P(Nmh=$6_^VQdZ?S2?\k(?r428G27=MZ9G
AbVc2kYVinjBLRBb_ui766a=R8Kq45GE%.@^sF,lcsSIq16E[YLB)kkN4MJGS7#qU;3d"QQ=
h/Se0`]ATSV&`A]A2&X@&hY7Q.*Vu2hdQ4pX#HP2A3%)e9#"]A`Y"cOHFl;iWUF`M\ZYm/gfn3l
`Xbl<^p9o98PL^dpHi&f+kPZ=E4C&GEgN-;[)o.(hCYI'%e`,hSC\#i._r!tQOa4N!uSJZdj
tZ8+AOn%GC/11ju?B/_0s5gq&Iu7p9]Am`%&PYcjMBStl["o>E,:#mKn-tjN?nQpcD#j9mm&p
Oafr&D#.7npY<-qafG?nG3satlI3@Kd6`cdZCG4-)#:51aI_/rN$.((2PuIT9ceEU>3`&RA<
JlcHI?s$%MH@!ok<hL/#(CN380M-loDT72if!/l/=fgYS0B26hi<B']Adf?JqB.69gGbPnOEK
]Ac-n`[8nE7;kY8]A<+VO7SkO4ON[jrC6-Qu0*np`GAJf#b\$-?V&@LuK;K:3/]AQc-2X%ncIV>
f"lFM9C9iVC.N+k%+<#GVro<cG/%AW3,*X-q7BVg<MFDi55Kn=`fFAF)d%)EL6`It'LL.gOL
i$]AV1jnbM2+ir#E5YpI8d^m%:YeRDB1OLf]A.8_L\h'IKte""E.XR_^=Wj9W?E_A1/$&F$?'W
W!]A,Y[H_J/#_:A3anU^W89DXl6ds]A6_n`2XH['\^3\SlIOfM@MbhCok^?Q?B[MNP$Nqm23(m
R+!n6bs!L94GSR\G:2S)3I.R&2AY^_6:g_s8SMFQ2,iJeScVXq_@Osj&"sXkeX[89"_UdcYe
PaZd7k<+SXQ<T@%+4)n^#h4(KMhQ]A[8D[R%E/'nng`fm2V()UC:[59GH;QgOnVG]AVmm053c.
-OPjS_OQ2'TTL[1`@#CnaZ`Y3FL:+;<!gec%girE)<%1B9mc%Z8rL+tVb2!S:)36UIGA]AV'-
5MH3)To]A#QrIFdg,o0_M*N!iVfIUF)Iec^&3er[CHcm$ijruh[?cCmE(t=8'fi5.W&Si2YGL
Gr;Sip61WT$2Yqg5(ZgLZk4`67pc,YcUI]AASDH(sSSi>of^+sb@BZK\6n!7gQPMuQ3b2kj7i
8.eT&OrVdkY5l8&B4O3RMkI]AKDEN(8SM]AAWI"A[)j,G<$"N1ehl6"?`=,+Y=E>`98;NLCn48
%A=Q;guk!&iLpl#dHX0]Adp4*]ATpbdOS?<1!O"7Cn]AX[I5sfTTaH_JocB`W:<3lFe>:[%iO)K
+0Bf80$E#f:qBB(dRsIVDupc;B<]A@t!c'j'`WeNDT/UPL%VWSBq'_!?`CVW,BE_**^tJ&n0$
b9l>(K90Z,3)3/6HK:MImh+)PL>k`5><s'clG8n28egFJ%al!R<TkmpWU\Wsglq$7s-dEu=,
[;$lC)/"Z8/VE)u4,QI<7'KJ1GPK^U1864F*]AK^*@<mli8+XQlp_t2r"P!kH0=!?bR3@)S9A
J<#/Yd9[T`t5^t>%[%CmhfcHi,:)'(3.+":>?4%e<7c2)=3No@lW%:2C-^>Fu8DV-kX!QB^m
$=nG]AbcYK$*[l[@N%;)iKEgK_.IX\O$;6_iTrctr)*jA-X>^I(e_dZNYqdVO0EpG/4iJt[I8
qZW#G>T#klaCMYi?"N#XWaKYF_76g1qqMJEJo5Y,O"AEG9$'^]AQ'':u*-pU_]A303DP>"^&9r
fCRKs&Q6:TDeN(=Wju8P%6k(Z(Fu?j(6OT6RQZ`8DHBp"C$=bdVIL7O*s/EV1Yi>(-3E^>iK
OR^?]An'"NIeU<]AiH4Z`S4^sKM7m;gm[Aj0V3>nN]A4oj+haqLtGFgH;otV>"KCiVm=inJ4[4#
Ogmc1\YrN:k7`>RZmErH9j>_:*:4p[\#1;M,NAG;5Nc7ME.`h#G/i=5KOtS9aU0?3SI\]A^5E
;b<8A+Q_0#S$<%g?]AdSqn9PV6:+s0smM)g9TN,%]A2tH#(iom14S:_al7WPe!/`b/AQS_1BFE
YXEtCY.cY"@(*-:Z)D)PJ+%$GpDZ\sqrf_&G5o52!HH+"X8!W,+Md;N4ZNUaN/kY5[.#.,]Al
j6oREnZTVHc,*<U<i]A7@EhG-IY,>*^jVK+8:#_n@@uJo!Q#dG\lj6B842'Iur"'C/Kj+G8O2
+X%7Tk9*D?:NQLurQ>q6'IP7<%3Pa6WF&KaDBEi'a8nH=1V*sgniQl[%jN25[`g;FI_?9R#3
UHo?lY>@kl`SF$FO\@IUM/u;>YH:Wj0G7SNlWT;[l+]Aj8Q<o'G#i\VUt/e'/.TH=g_BO!>FB
eL)?'?+Su$.*4Z0&7h\ZFWW;hGmGUFmGX(COF'R<Y:r"m^pA4RM%6i1o/!?@W-j=ELQee,-7
^t0'4LgQN"N==Pj`o#3b[$J9*-GB5aL*#W=I.2qPa.B\gM1F3ai-7tM8&1rmr-")[5UcSIB\
st/1S[D#0Dkf9gp?D\JmVDi45aTF_B_K&$qLZWp!kL.@.5f)6Y^uF3L`;-=ZP!%C6B-U^W-#
cK0f,_r.%J"ic"_pl$1Wdo`YSEs)FHeYohaDq']A^T`VfS?r+F)HDOC9MfMo:HOUj[rHn`.P2
h(+1FWjq"]Ab6?Kq#`@%6URJbh2R,ALD;b$`D.3;,OLf$3Z4Ru;nF=h25g&.c;C2JGj95nCJT
S*+p_;O_Y>CP3RtnWUN9JF++mg*99e$Ys,X+Yn:*DtYkV\1MUbr-Iuhd_hT1d<0e;H'nN,Qd
Isa-:8`OTu=f(Cu-/I.$_B`etaEFFt3.*T?fha851Y;t2mEJj@loTX!qB$>M2B&i;d'*\'p&
B^ln7:`IYls\CM-nWZb/ch`@pM*Uj8q+?UHkG:p(mZ:QTS-:bVg3f%G)F6<16d+X/hSWr!lg
h=Vjl:[lgpBjVC3rQLQ'L!3HkSiasBdj*e,sf$H:bk9bfF!Y;oc+r<VH@<*+Q-NcQ(<Aa*(M
9K08gRU40Fe]Ah4nrD+WLd(b5s$q1HJ)s=C^FtDg&QrVWF1(TMa,$]A8<<HK:ULh`r(9D\_QUr
Qq5i7au9&]A^bF9("-fmJ[8MOGp,0VA?KqCi4^mif><jRmlo"BqW2V#LuD_ES>[8M^Z1YZpiJ
gAn^^Y*DRKT0SU3FjRgNNoi,'Q'$Ek6Sk8c_K"=2`jF["0mNE0E:)'Vf3*@*M<*u,J&mJ+TO
$kAP#9Gn7/%r(i:Y!_nN\Z)62+l:=PN[:W2T<'s7Q]AtJd@$Z-;9/)d:H+J1iR&p>Zfn0Dd4O
mLA]Aq$l2CAVN[cOW%-_j'[*HU%aag=5Xt\8EHJ_IoeQ]A+P6#,'7>+bsW3rSrC/2n6MN9DV[.
6bUc-;r[@JB+RrHpco#;JG0;jW)*<e<Mi$P8(6R1L`lX<?X2/16Od$ZEM\uZa`>'EL/R<Zld
\C1q6'"F6,'jeV"XaW&D@I>RGDW/hL_?J2;M(Z87B8s.j=PNX.p0]A6S?;N"J,1pas`-s,q!E
6Y>t`-i8nP?3bW/IgEB$%iOlOkbtm$s&NJ:JUHE[$m`P9WCkXYNE`6E3T&+%cuZ+-BiMd19`
/&nm=%F-Tjg=2rH%N$SXl,367FtK)-N>%[B=:0LL;EF"Sf*+?C$PnFq1X#XIdoGhp5-bm\i4
U*`HT&B\7<"T)cS+-I$2R:l6g26Iba%_r-0t9=S&'qi%r5a9JbU\kWlr.L>EB"Oi+`11>1d>
5*>jb<iLOCem@C4P5l9o^UMY$Fr$6@tg:8mQ^n7QU)^rET0lap8B4po\6UpdHsBWF;LRC90X
6@jPPbB:LDO#%Y?T:V"sEl#ZuV!GNokW*Qms.nbRI<]AiLKHY:<4_EH1bC=Z'$*X8r]A@!Ti(1
:(0BO:%\@o"UN^0g2Me?gKqTN4dOS[E.(B@Up-6LgYBplZ#hhcXF:d@*:3[qprV[CL4Xm/!_
+(-Xj*:>M(fS16sn>iK@!e7Q40["Xn%=pPJRL2hS=E45]A10t2QeoM<bLT[-#T2\,i`DXMIYt
"7k3q7^0s*tVI>Lu;X[K?2m/2-dNWdEM;Ccq%)07%*\t4LD%$8sGJ3r<]APaUbk1f^G-fHk8Z
2;+KKZU[*R>cLZ;leV9An0-GAf`1:e%;Ip</1kK*Hh)hB*,?E"%p\Ee*p8"^;TR-04`@hS2n
uN%>]AH,:\8Mp8P]AW9^fk/ELd.E=:cC@5c&AIJ+mf-_"=NO`0km>'ABP7^^Z?B@^0u(0?t_jX
D!9cP)S0?,]ArYdagh!L#I!cZn,IjM>qf(VY")&7h5,UUFAPIS(9Qi;R3ZeFQX<iph-0a+HfI
Rq"NX07?'U!Or`GYD]ASJs%(JK(5MVY<"db\\&QJ$^OHS_h9?jYb,:8Yer&9&IH$JZ`<=l0ku
7$ZPYdL6XNdPnOFZp\=VX:=Wq=Bi:J#_,iNQ6/bP=J4k=DFPC,ngCCX#*KTXi3-has=:s1=9
g_P*dC?h,,G&rTc>a(Pb1'7cfkD31WsdIVf;A-iVW-1>j$od]Aapms5l</:<$MsjMnVU==pIe
o*9>L&cYXMn^;\1t),FtNS[JNWt@q6ti1f\C<<dV:5g9%maWOdB<XW/WsbZktuP\ZDH1gX7W
1e'%I\nEfd4GTS_>#VXgE;=/O(Jrk`><c#P8T?,5E8mttA^XDXTR1h53<iZc5/&gZ6!"J0$j
1KION]ATl)=1ITQnbm"7XBqdlO_HH#K<m]AmP?_j5UB)s]AaFUpmT3IH8tccgHJ%,I8o6bY3CZ(
T/qU\s0etenaRr'sWXLW2)5uJ<Y_Q3Mrg)X'6F/)^\I:%78(*VfUlUddmI6hR*lLHMOY(APM
Eiuq68OPb_p!ORi3Xc<c^@%hOj)en2iSQ[:J,'Z!a+=M>fu[W\U6Qa05`bI/h@2A,*l!Xmj]A
oc#KUZaeK?as=5uDU@7mQcM9PV\p\2A"kI*SrW[5B$SO+>e2hnI&6[Ph@SSAX6BP('I2EAQq
O^Q*g9m;c(7CG-r,q/6%+7$Pm6IYa!WJ+Yn84ROs_&'f'FN@$:)42knj/>9!8SH&F)P&VCkZ
8>V$E9=\*ak*f@;o91Y1m(&&2%S\\kh\g7307o^JqH;:f&U_*Kk(9#`m'&8qaum0$e,2XF7E
U=FQ'"J&^^%Y(eLZG.VIj*4C+9oYGSPCI_)8]A3e#L2baaDM=AX[\20?d>l"<MRLqu#DAXEAR
IY"'Nm#/+hr9Bm4DsSOlN<&L85g[chQ?pV+o5[[hs/=k?\;fk>Q/Y!;/KiN[')^G?!#NjEoW
WQ'.B4<;l8mZ"+nWR=o(mbZXPV</?IN+=Ha]AmgZ,;aI'+R5Ad$"\&sij:-N_=_HB+D7<qG-q
Mtp\]A&<gF>POd[:R_+&ZURHP>VC$Ne$\("'4(ZX_XQO?Y"*Y3ncAsEW?]AVQTpW81(/q^n6AU
X$/)LDq=Ca_p5^n<J7hbt7XY"&@02:pcL3+S@=4[:"?SOhC+f-ha9pL:Alg'aMlOV"5@Pn\@
1L/$jJjgV:#TCK`3V`^sC:CCbMo8d&2JNf*4<Cbfj"KN(1s(kYIof1(mV=kOUfCiS(p5NoNn
M'R%cdk-sY.L"<oJYt;P`"ebV\BZ?X3SBoT%-7&U19+$`XKWX<S:D]A,h5]AD4K_?ZZ<b6+hK>
,mKoq+SbD&hqOep$obA'nBgbnd6-H=*mU\n'"7:`?`&)oun3ojot:p3eeBG^7B*C>Yp/V=I&
TM?ZUbc(%8"'K,\5?.Z_+Gl9)-\!B@hHQ&PR_jgEWqD*jXf:E6cKZ`7==h$#h%#q0Xl?_mUf
5&nOK6s1]A.rOAH6&(6rg@BA.=#mQN)FDMk5WXD?+OP71U^N^T'#4dY95Ct.!:X;^PP+;q0lu
`\RT3_2KX?pe5t5^>*4&T2PV`4qCI[DJ$hHL?e^g<H>i-`"hBobS#C&aRU*k,4UfhaT)(X]Aa
_#gp,]A9<_)H<!c;Zbpl[9QR(o@81skYd%/ftR!(m3egHaEk?KiY:uJlN?#NWGh!"E-otPq?;
#LR;\?nkjG_)Sai242^LAQLQ4@r?c-XnraQRULkE+La5%.TINGfbFiW<tV&a`^/2uQn?E=!'
<N`td1Sj9m5E0_YqK^HE]AQjZmYrjqJn9A9Z$7DHX4ga^F5'3dEir@n0WFaK"f%8bN%HMGlH7
o6^h&l;;Al(*T)1j^5>^rR:pk7o(&EOq$k5&j:>gdNk/u9X]A]A#dLrT,Y+(r(+FpAFZFckBqT
U>,riBE,6l"U'+;RkJg6]AV#9,u7\o3e8s'U1MUYg_i\2]AI,tMi8\iT1A!]A,+tC5(dW]Apc@eR
R6T,dNlD]A<U:>>]A&mlMVZQ0oK.bq?LKnad/;`%r5M05@/%*irMZ6D68rAkeaX;nr.^h;'pWO
(`G4en"EjIHmA9/\M/g1slHi\duW=r"7=AXU?\f8W7EW;b$;<cJANGH8+W[/A6G%'7<&"$i(
O6\C@lLp\kb-$"$h:rKm(1C2>%b60-*.?Aq2`liRS5Q9@i5HJK(g2Lk%.X^FYK$G'k"W6Z?`
M\5<fuDo(M*`O2CHPiQp^NrBpmi='4+f"1=b:rX1af]Aa,R1EeOZ9N2qo;f\>1Pa/Agm0;A?T
m+UE3+e?<AGqjlP0QI8-t?4m`2U]A<4H)P:H9@#8ZHi,QbT6;:7<`o2E^YT"ei)IJeKV2'hji
XCZ@6gN*ad9bdf4r!o8I!P]ATJ3`YUo1TI.1;KBp%rZ5*K-nR;IJ+Dp<iX)+[*lfRYZ*P"p*\
8t*jC`4hf18SWQBi-bH2@TQY)c,9eYt.:`$^3C2#dM%N4"/71lMVR>h)J=V3hXo573V,2R`s
>-m0f90K3Xp!kumP>+uJ.r$!=#h8tdODr_DPG_JPN=dhJJC$[r'74BLX;<4\$CMQO+,N1Q?]A
rC'2!)s)J=lild2"DW'ggG5l03ojA*00Xq"EGnS3@3Nlt+2s0NOik5_`>'\aQa3g1OD'N'Xm
efKhI[j6*Z*i^\LGl00F"o5!QXfF!2;R[&*Aam>pTUhl*N"AURfh4KW<A/4/DJc6$+`REIAZ
6oQI@$"9m<LWLPmP;&,?r]ATN@h^pGX[&0t.s7lErlGI@ZC16XQYlA+D_!+6(DlcD04=A>oG:
SUR9?`9SI!0X,Q>BTm7?/&5g>J&mHT;b7T,]A9X%p()&hUjpjFGO38)<DCD>n=I1'R!nF<t;F
Bp:+\SKF&3:RTb:g=C/4TZVE:_'nDXbGRLKP5[M5q;X8<6;@m"GC^A,GBoQRU$5O.H`"UQZl
49/bM:DlKfb.*4tS_c&o-MTC4Z[P#1h8f-(5ForrAtf(2Y]AG0g1!U]As+:]ATi5g04P-2%U+K7
-3N]AYJ?R%n%N;1Cm[JgJg!rRXQM4!s[3Xm&'b(FXa(#I?mr4#eCQ",FO0ADYj$esjF=mM+%3
uD9&n[;rD@O-U&]AL<><Wqdi(E3*4\E%T[F=WaQr>$!"KH!g2ia`NtIfm=N%V@Y#[SB;nQd1o
f0>=fI_Sdtj)g!6uK8qM7O`f$5_0)M5Co_c50`LbOnF5VQ%[C@]Al%]Ap3h5&YqEO?);J1Va$3
`Qo(tY,(:IF[^IqPl3m-e4#*lCYQ01&!">=b4CP)Y/Atr-GYftV]AhpU:Lfe@n$'D\Q5D0t]A8
SU3$'H7+f'Fa5CJD5obc_cFZq7f!67AEE7<7Zb]A]A02/*;hiejB4uI&7\Gf(dsoGkr%HP_d*p
'e+:0WUD^HI&UUiaOSa26*'!mM04"d?&G30d)Ufs,dOjg5\_nY8`6lXtNj4N:)Ch.!]Ad+6ds
%%@_/92:mcBV@'g6^a1r:-s9)RX5^mftAgaf$X*_uprfE0T)#YsJ6'OulFN"-qT>7b=+q"gW
hfPT"UPch:k;.Pn$;gTEF8^MhUkSoCKZ&.]AmrRo?jaS1NL4#1.R]A'q5MogKT-3*1AM@o5?;T
Vi=D0XP$Hs?K(qrOI]A"IA3jH:8Nj1hIe.<R[017Sq[X:/k)ml4(A:$gjIUnBQQ%d%Zr\0]AbG
@RD*DNRa,c3Z.<.)A@<-R?&?Y[V,]AVSZMYGrBE&#H6:2d*NY#AYnJh1;1<7&>MhLppgfN]ARi
VP\F,8_-ho-%L"MFP3@]A[)l+q3K77"V5>.h!!]AtBMBek3t/Xn%D2t`H6$HATsoSN!B"lj)hI
gY-O3+'Ig6s9m^;J>DT0"A99TCQu3B`i@G5f2TV#amE<HKOtRO+A@\F5rZLK*EaG*k,lNqXK
)TK:4aqI2Pni;9a)N:/lD\FZdP;k&mbnOLD"D&G>"g`K6j`irLS<"m,aNa?*l'%m)i</gog4
#N*:@n!*gjfOXPh3RE#94Gd07NRU5]A2nM]A5.SJ7*"]A2F9ERa@=d33[/S49>)LK`)5]A<(G]Afm
-+WT6$>I5k"/IUHqiY&PMFlh1.TMqY:1k"r5skQ$MS:@cD4Vm7?(_9>Puski>%qns\3tq7UD
+K6uPA/u&J[p7\"!U$V&<kT`$\kDd0q.2(0PcgRT.ACsLhq7!297cFLFd/@aV7WTLY5Wr-p)
\hR:iWd<D,.F$]AUj^o7\U/I/m5(EuP;Q+o%\dMS3G;g3U-Sa))Sap1O,XSb7?5O=!/:k[*XE
_s7]A#`KO]AMDVeQ195MBF8*1'/Lg=L6H_53c)\UB%V4XlZ?@.0B`7mBX.73S_:q\NSfTQ0_P.
(1$8bjc"[BXG*`hlJgR>gc+ZN2JU*/`c9:SU`ZO;^G%H=MoE%$6AB,Qk6S.t@!OM\XYJ%JJ&
K$^?P6N)&*JEnW?jY)>^kd*r@nta.^sgVVX7AGU<i]Am<aOEUT<*74Hm/]A?lgB\Q.]A%#oMeYg
-YT(hO:m%nO,uCgl"of7=F>2ls+N$OSjf7B("Ih!TS,J`a`#QfW56k#5)\2"u7$aL-pu+(PX
q@F$fYT'^_CIh$`Pd^.:B=sYh#,^1^pi/(W?Rb$14B'[qHSKEXlrALGdqh)/_\iuhB1:tk9.
5d>J-a*28o0=76BK<R;k!ID#0(&-jI-u^+-i&4[j)dH'\u>C&,f!<#O2JJkRU/%+a7(^=0JH
g(c?agW*hMj*)#?Z]AK/\CcJ#`TB.\O8`5&c<qa4B6J2KM&8U?qR$U[-Q^0BLc&ZEu"9qhiP]A
*]AfQhR[Te/SOdokB[?'c)!Ert(9^;OpOsHR0H"rmM&;A`3T#mOsb)KZ')R9t"NR_L!=E8GcB
G#2p:m"`sXo%]ARr6omP#1#=D@BZeI%J99JJ@>YRUMR6umFPj^pd$sYgdP*d*M(C:TY@+`uI3
I'jj.q"s0HF7<BT>L%1@%!kqq6mo*]A$H#s.<+d]A)nLIUKG[3EcH`^n"X7!J4+j1SO71.^N9T
<15=W*273EM<,*a?%TcGXu0E1gH'/_`0DhA.3jXkM$Qs7-DZuk`L$FLa+;<*Y5?IVtR2E>"q
&Acul=ii`V]AFV5,0,N_`IXc90X)S>uXDQ0.*^?iX<%2-@HQMXO,gh"lI9:07bRJmg&aG\I$-
h?.c=ZoZq?ET#HInD:1C/7inUU1A;_sc.]AaX6"k/@3Oo4&2Ao-`;L*I`6rA/+:Tk-:jO8j0^
A:e_Y+:O7'6TJ!JNhEPbcr&j!Fr1qq@,tLsl8,He9%A7\=:QrhF\htQm(CgrOg5GY8Z,P'Ur
reZjKX:UnWIpIlok(&JSPKZINsD;+@4\HnY'W[8+JHF_o!F"\>iBTL<[N/;hYuJ8-d+Gb"OK
Zhr"#:)P,<9DRM'&<]ANZH3VE5_d^KePWbZ4,A8U.Y%-QgksI>[8-Wk8W.B@G5]A&,huF<Jj?o
G>OK/+O'Es[EF2EkCUj4EiY/lU*#qfNie&VgS3Sb3:EF<$\8K(+R+F!c8Eo\MD1jgk1.k*+i
9F>#M6,c;_u;IST=q#Bk+d?BKP&@,$fFeptguS'4A_I1f#),em"Eljuiftl$[/hRVRW!Hs=N
-fBuVK>=^<Z4-tX"+9b.Ei/U3_Ze#GeYb4O+8V**A'=$F*_^pYT)q[/*06/eVc=;iq^8!+r&
!Z9m&tC-X)rm>^.*]Ag*8RJ`WlO]AnW-pksTOWMVK*SdIu"K)*&.YFGJI5aL?nG:/C93in$fhS
r><F$G%12egum-:8:Z#aTQaHQk8T0`u:^#j<jh-hDn3>spK6uSRN`=fU7hr1="50m-F@ge@T
[#R4t,E"tPdQYUWW'Q6Z\P#Pdn,3^9HK1dVb'VXApg#s-ZFj-[%F9mh-IPc&6Qd%E1uJL67F
iH_3OWTsI9;%`p$J;2gD56D_&UOL<*SPl=FjN?]A9'+Sl0;[lHr%.(*EXJ?e<QIPCX]Amf`OjW
b:(,r*[S;RX%Ob@Y)[^Ih*=;$D##tJgi:4oC!^JQ`Lp(*Fg)[j4O8?[*CH5Qu2?#<rHtI;CJ
TW[W/j'e1$,b"q-1/G<S1RI_04rENnL^Y,#O^Th;gZ8/]A?Vl"ZRLK#@O6Yp&c<%ekU8pa0['
bI8!5j5Ds&^t#^US"6_.2C=X:o!Yr'*Xf4mO$kP$g9FoX%tfLO3((sDGMV1uB4n.>*n*-Is"
JqkRA?#4$DE&FIC"-.G9Xq\tl[+jrAo>ei+&H[XlZjiM6QS./g.__Njpd(!HHY#n=ON>iI+U
:Zs`.]A^>8BQ>DBWC7`RR#<%$d,IkAI=ZjM]AGu4V$[Y`%2:lTfA@^.*o-*%?q;c4/[Sj81Gi,
CMcDSe.oP"40Vj!L\Y`T8g,tupS*,d:4.X\$0i]A]AFrgF>-&9Q>'>J>l<9+N$Y(@m[t]Ak^Hjg
<Kgf5_$G&relcD;Ug^O^t$UAf&@J>bQsCl]A@*/UB0)hiK@s8l7PG$P3JWDiQmup#lI;;+]A2'
aZE0oa?2LB;jc*nqu#oi5A5P"Q/2R5fbE?8XXc/H6p$AMtB*/It4?:q?J(mlXK5gXs>_V&6X
EIL$P);>mG*PYPt,cR#J]A>'s.e'ar\V"(n/nXQGdddP7-7E5rJc0QOEEnP`3$[ld\8"2[FMA
s(:$k82&/@1*H=K%J13=K^Cr`k1#q.7^I5=C!45$mqcT)UK4$ifJEKQ/De4508:eA?[;*]Af-
VXsg!.-?Ea9-O3VM5Vi(A8ff=(^,Q:2DdFP2Nf`cMhtd[ZjcMOUPt[=^!M9.t71,N=[i>-,l
Q!WL\27-7VuUCknLIA&2B?&h8)`sJ8Z(5Uh1503n\s%E<Mf;F;1b:DVm*FWr&Kc(kTGAW4#W
q0Dcm/&pC9.m'aT\#Ua6F@Z@cC/b9Mqe!-nD4NtNh`Bdo-LIO!dOaU4aI-!*L$IKtDA?,fMn
h5CjHeCU`a[P!BIrUF\5,Fu?BS5jTF`1C(s._JSp_OP0K+0r4)F?:NmJo`9AVeiP@f]ATG\\*
G"`2YC`UrRbqjaP`Xh>ER$Oj]Ap]AU#b#1N=pa)0Z51/9SY3SM)cGk&;,65[`Ru9nd$QYmXHJ)
M#*!fA'4<iunW)UbMKAB3BN#?EDYS,pllU*K)0Pcg43[,@%/8rLOcTR!hf_EEWOBIPfYf2oR
IC8$RNorijp\3JGJceOjgR;`=V[iP#^$a/Z_,oNZ_=m;m`e/+%eqO6"<Jm&Mf%."`b&.kGrJ
3O*I+D1P3fp/<&J_hN^PcsIBW5k-O.e<'/eR)8*M5_BK-cHFH?d]A0lH9Uepsl2T:!8\SQ\'9
02V(R.1dru\O<'9!8c;iKK2W5.rCrmPGl[ho!0K%ZlfB+T,QLmp%0r':t)%n$?mWn#m>eC)j
sFJ52b_a6L-R]A</:eWCr@RsLjd/WYGR\uR+R%`Rd*<4\+:#k]ADu_1=XO/WP;T]AT^%Lu9_)DL
d[C.":UKtmF89UfSQDcZAc6G\l(-UfkF;eLdp40tmO;mQ_;hG/dFhkHa3Q)V:Sc=tcnb@oUk
@rtd+[J_K]AmALdB*#NlG]A%,C[abDC(k:9H\CE<><R.QU+L16q1`<8MH_oIF"2aCo%E8Zb1[P
WH+58U-L`NQ.3$no*4M8Mg,gHFuWS:*EpPphL"L_F+_E_*jl=tR@;G3[d3Qi'6W[P#E9pqVZ
?G8VNXliQ>1^s(F@3>Cm]A83+8bq6!P8TgPm`+WdO9l+>=rK!J<Z#]AX]ADrBU?^DU4Glq+:Q^C
aZ2;AT-VQ)jJ"@<"oIZp"emD(k?RDdJ2JT=6rkOF-s36`XHH*Dof6>:(m%>5jVT:Qb(sBW1e
T@6Y%(Ke>"2lb4(a)5K"c^mt5?Td+,TRO^*OH]AQpe&Y]A*B"b)t]A+27A'I2Il9**p4(R"!EZ_
.-.#%/]Asns.X?1bN:4?JjC)G&@]AE-:T]A^Y/P`dOU#1m1=q*LD%@.iTKlpSe1huhmEZ_S'!?K
(LfZf->)K7duFc;I(rq(U-YW4FPibd0e's.^koIk`OJ`n;e-QN@Sm]A/Pn4Lc>Tl8`kCPa&NH
dDqfPNB*K,aLm^eiMfU]AfPeP@7S4Z3<&5dn<k6hI\.j+kr$3)&=u7T_%Ri68JG"d!NRr1S%?
o^\l4L<#;6[%q-SHtD^M5WJkSd?<@QFGWPk+S3T8NPZRb#nGOh>B_Ho3XF;=@!+j"fTZRK8@
DSTaEK9N%2@`RiG-+`jCKmC\Ea]AYHk"#?"STCK4?u_V\k##nNGTDkiW$D>obN-l+ar84jVCk
kdkgCf+pnn6D7)NEJQlG^:6#Hm7@=KoIsQ.=+ggVeDq@3FFA<F)Gu`It*<`F#83?b`dlHO@V
X#j*&At7$q($FkV]A@&<'%3dV@56mcS.T%k>,?e%,Vh0hlOAOZOfQ,_/)C>%]A<TC3.e`T03m#
/Ao+PHGs^fhtu1s#JJUNOud$$>chC:A<eQ;F2kEr]AFn\S.)qMt<iD,q\CIpVMp3@DAtMU2"s
9Sa6St#q4M%_J4CAZojPl)3s4eY?f'!QY86O/Pa\_<#6G#hA_HTdS5GYDRNdCTtkoh"SDrhF
Vg;DK2DkPr3qS[r/QhgQ,=:\bqG!k!:rbBO(FS!h3,DL>MlWWC5G'b48gIF]As.srRVXRs#1N
,f<.Ee2UP7oF6V"2Khe`fh?]A-tc8"IlS.W'JX[[?$['i4[(B0iI",NFN0U,FHdX$2WON9@DJ
1@M@#qKdl2M@G^PAhRcp]A5c#=Ym>:43Ch7L?-/b)fMi_%j'+B$.\M*:g#&kW#=WG2;0\-u^%
$7`YQiGa(:B5oJV=p:mmmSDC9-^aSf@$7N'+02+HRK$^F2=m.^ZC*f3An,N>FN>IA1B7P?-"
:@-hB+/%]AfVhJ%r6A0X6ZaK<KQ"9:nNa3UDgQjSWFmNgA8i%)<Rp5mL[*2#l,r)r$#P/G;6d
FE_]AkRi'3RWhlL(JdlGS.os/6>B>>$?`JR(0Tq&%7BdIG!,*%5G4ZNkIOe#u]Ap$c71Jj1I9;
amb#F*PY@SH8Jp5HR>XTidP\F><e<:*/W@s0aVO8m7a=MBY&*BV7Qu%m\j>-nA(*GNp84-d0
Ru_k.lgZcmt4g]A,-kX4=;AMeKq.D.f]AsKRk&hfH6<9E<M>mXaV/V*<qY01q'ZOb!5Jq3hbr,
SUK.>%qnJEl3r:0Na+POlX\4;:hi^I@8pk*7HG=s\VDV4:`4J9+L61fi:h:&!GTd7gI2GMCn
^Ao,qBV(C=[*tmdEFAa6uc/V]A1H.TSBnX1!J?k+@>^mk]AmZh)C2,#:hi1_bY^_;<cbg*_Or#
eYZBq[Xo6GtW*VSa*FskSjtT=EM(FI]AiaEFTZ=t00Lm]AM2-=KGq$:FKq;T?_?nmDll<FktWi
I1HrIZj/]AKIn%j+WUD7d2P@A.bkm<!J?^BTq;rfVJ0-34-(YVD=cX+a[WqRhd)`j+T9RYs-2
?=p/Nnas6rP,*X.e3[;rTbauu-i(+3EsX.7k0!LVXT@AUI`C=S5cC6;f2bMmi"hO:X,V50)?
`'SPc#^.'\(7PonnS#ja^Qr-&1m3'M9k+T5+]AmTu&_;12(]AFIVY=Cd5ZfFqen;X96#p.@d_L
ZhbE<9L=);<-ke,/YTqV/BV0^hdCj<\.qAZ?fSZ\%='H&:)=,WJCDKRE1&UL[d&0s=1n47m(
"7R+1tBrW?tdq.o8aTkmIZ/SJf$YgB/M5%d<Rqqguek9Qgo:IANA+.Eu8=>pgh>cj(G3bbI0
#A-BnaBe%b=P)^Z@=)&R!"%_(7Z"kau)Zc/smGBN33WFX"$Cl85kg`m9,jB,cdNQKbbp$^3c
]A43d^f#1hMPs+1F2;]AXdk$^\]AAnYGJ1SXEW-)e2"-HGj[u7a%\;C)6?E=I5<kToWORRs"nb*
"[*`//o/AOGn:Lg*(APb`F:3KB9eSTBYMZ$6!HoYorJcV+6Tc4puAiS<-=0>]A2)!g#Wd_Zrn
4(selIdHDBa2Y-\4;lMMq:E79(\Uaf!L[[="Gb;'A4oH!#Ll'#>B0(0ek%&s$RE-2GcFF#\8
Y8i]ADS.6TV;YMXK-S!AUXoKQM<nQ<po]AA\b5I8-PqRsHocQ8!G<BuB'Q2`;fiI7KPIZ+=EP0
`'@Gs5=%pGl5[3`enL4gl+ID2b>7Cri%BhJ71P<#pa<:FTW[]A'h%g1r)+.m/]A5c;i"9YB/C@
d`UI8mNf.qD(MEk$'4GPW[G%7M%`@X.65q.N+'&Q=I/F(%1hM[UZKU':`IM7pGPFE6Ahp+j?
jn26md]A]AVqDUub>N%i@8q&CSX8P@K"Vn?#,:=o(:f"%dOk#`mH`MtNe5LIh<,R-?&UBGc^TD
,-;^U#VVmJD9$(?qRPnj\pu2Z[R<HZA^---J'\PIRP?n"I^;jd5_<b>5M:29Z'4WWXQa#fG]A
C/M]AjU+mVce,G\]AdoB<5F3]Aorr4"'1!HH-bb[R7b%)5AQ9p$_44WpEd/S3OHTK9pMV2UshD1
l2=J.ks)TlIQB'BkZ;iXJ'p-6dld,Uhp[<GIg]Ab%>L^_na/(snaB)!RjmIPHbd+8.g,55&"8
q,:^kR(o8J[lXF;(69Ff,Eq5B.#F,$,BN)XZCrAt3r-l5tX.D\hsB"4$bP=)S>)poU92!pJV
qJRsP_s[efYc&>tr!Hbq-!+5Y8CcTlS'%7O[F>`0jXYJGc,NdTR[NRL>b]A^:58nC?3LWu0j<
20T1OH>(ch:!AU(,jhmPo_B%ApJ,%!/AJ2=$+=!=M$dH[4*Gb6D>.\2GFcV7.PTMerWVaBcI
MTO._Cb<0DjZQclN\b4=,dfKtX)!A;225cBY#C)!E4[G)rO]Adf&qYR%gq#a-Y-(R<'ajgI!n
g3ks^+&)fo4Q)cP+hDRrC_EY*$J3ULAInK*=S2j$*:L]AM!#A@iJ1P1M?7,QgGW8ZUfQ,'O<5
>>hWI\`^,C,<GU#"rp9<Dk&VhRo<HOkl1QloPY1UKfTRPb:f>)D>9=.EYio'eAr7cN(?BW#p
KEAa/QrGms9u2+a<.SD41q.W8Y+rgXs3#9E"7Hk"V*jmogt/YjAdbV1Zd[4'?2LFSZm)\<Gh
S3#)Lj-anJ9EB#rO"q06aa*e&-acN:LJhDl7<&rnH%N7\5K$Fe!O)2,5;[XitFT2%@anX/D;
L[4PSC]A?uGG5*.od+@NW^Gd5sQ'1Tm^EmH)i\mVt08gr&GHGJUM*<q4a!S%-+mZ^(:/FEFJW
g#rD4o>P^r!m$:K>L=RRJ8TY(Xs<JeK6V"Sq8L6`79EZC5&s<Ag^%KS'OVu1K2utT2"(qBX=
skRS'3bYX431o6YX(1,@"WK(6%gCsG*)$iG0,ZMXA4'e\l/4rC.k)dU/SDh?]A4/bpDLLfYLO
gLZH3fe0El3B-ascb*M7/lY.^'GIgCT3<IA6S+:GM+o_.Runeoo=X[kD;g(5H\MelpKQW?Kk
pUK@\%\C*_CH[Zm?GV[9[O[,?]AA0MAd5Lptl`B0Ep`0?*eBHgG#u2*o=R/?*t!-M&[Y2[a)Y
C4*e428kL*a`.O]A0>)cG4W>5_LZ`R7*>RGr;)H%-+pauTO=)HpiTD_1%>U(P;L5!MtGW)9,I
EC>V,.26e[>5^S4?O&@*%Bbjhuln!Qb;E+FBbuo,HRsCVu<Ktltn':;d#.O-/&)YkVA@C#uA
DRR@O8EofOhV$gbD7qJ?@R\0-oAF=,j@LLlXLhe`CAX`jZl-c_=Dh+B'#EYR]AX7CPGt(51j6
qc9jDq*=Zpe]AQ[+"SYG4rC]Anr[*?9oT@FC=;pI&Vrf3.fMi%F+8,p^#\<1WUFS+LNl+aC!L]A
^iCN,.&+X6[BNP(.1")'kC?T51eFPq<<jb[utOV4r'GFZU-3=ORH!.(i%ZNtiVBlO!dM2DO^
mg`rt39tNQn_(+Z5)g-L2O6I9:!E&Js:&OTn>AZVR#>s=gST$P59kW.?.b-./I]A1/2Wk?DT?
a/;poFCQYhQcTO?=J-6Vdmcc!XJH"5D*=k8nc)uQKI.b3suR`JYl)39,HJ'9c."XE<($;o;f
.)a%d*YhqL5[oltNM3]Ajq&`j7VSj[@Q\-H//3M-O#]AL0Vg(Q,dn47nds5i?Stid'o"]AR^WQ`
AX,3%Bhs'*hs.jl<4pf,\.^uAhXR:sc0Ii?JU&R,9PjgM34#*5ctkf9\e+&kN%C$3!efb9.'
IEe7^Loj8LS!R6I;?Z%-7iQgFV6=6-4GKqIbOB)L.4)k_=Q':K_WTp0kQp[%M6Bdd$PO`9Ac
>,uJP#!@@I?qA"[;A]A*kRRq92n-Il3c4N2K\=1pZ8X`s%B^\`o#Oi>5\CYllp.MP<3'C>As<
f4P$%r/41.]Ah<7XlW?bE)f)K`8;L<s!V-]A@Xp=#YJgRsrP`B3A>i$`cNeC+gbYhP:onL:*b+
1i.ue"LTZJDh"o<0taGJ[+%R^Q]AO1[(7A=KW#-b9O&s5sY@iXtm`[nA,ta+l0P)]Ar[JJf+.2
THG>7R^N'u-#G;D;lRs_442B!ID:*u_7GAl_%S:hrO8%L*s*<G<A=X(CY]A&2V]AX#FlXs'N=H
#3=cdFphm!7sn+jKI[,@q&H"EX\ok*(9RX_`36Z,Y)+SVn;ZhNC651B51mHV^Jn+"@6-cukd
-A8WFXZH#eM$o'<`dM=00-g($s91ds;<;=1+m@rQV"bCuq%[m\2b3/Nnh`sd4BG_b.b^2LO4
_Bj@fl=HK@U6n74F!%R'X0Kt@JJE:FG7K*lM\0EKUH!&^\ie;7qOllZF:rD6dNjiXG2K/AMI
.'GmLDJ@uZ=MlOH'$>csLhoER;.d7uj<V3(4As#\W(]A#[4&J,0^3;b`cqROch@,T+AEg%pA^
aWtnh("sR`fV;O$;Pjm?5>$HXl=Sfo$FuAl@g<:cRPnmeFM4-u_l\IlROQ2/X545To0]A'um"
8IB5L!>ZhsVrq,L_>aFP;Z^<T%cO*7_gd!1E?D;+Ks*LJ<'cs%M*Y7aaCU]A`?`QhE&1:RR^7
_/<[C+rYY78!]A!X2)0%h&+L;oVHD>Zh`^+t=UgX_SWtFM=KGR;"%,u1TfsniofFYLCG!);>%
)]Ap,mE<Y6LO8U>2J]A_PLsaE@)f6Y7<B0+PA"!Og%jtVSZa'Ss7;!mbXeBN*3qN.8>ffIYmK5
T5r\eua,NI74-+3C)(/&UsLD-S&JZm8Pnk2k(rE?]A(%JSZ2T>[-<)`gU,rF@!mif="GI2)*[
-A5)tR\='32`?QVhB$.lE+h&FHT0@*2>nhP#tr5`?7(/FQ6Go%[hIq#>(MATq?(do34cbKe;
EU&!,i.PO19679k1TqKa%KA+fPO8p(mNo;"#=5F(k:aXQQ8VhHs0u;i[FC52k%3f\?LLNMh8
mq3U<sH80`V]AG436%-JPVO3rkgidWhBCat5#9&B>1#Jc2WM*lkZ'3tuSE'4Y3a#Xb>[D>!pb
\(9mrg0h6lK@/(/tg0n8*r;oFFM_?5DQHrT;LFJ]AuRbj*"s(1Gl--j`,=E*4B<RJqZk5OpLf
G75<<p7U7ntu-dDb&/YVA"5r.p,BDi6"$4fOT3^)#_OLftgVHC<uF%f0)*cjQkH(hH`NBb;t
@VV9&lZq.um@[,LLJR%q<C/KcRor1sAhn1ENc9_&i77)Bh-&a+^[BCi)R7BU&2l-_"^Jcci!
smRdCnZ=SRuq3E?$2k[kAB'C]A##KJfU9*9KXB`:ur;$=$+Yd4'-oY_]AuVPl_NgY?ZU#<D-4T
rAG\0X!N#0ERS'bZB_Q;0(Hn\sj5DdgSlC[`&Yi0127<omN^i8q#WH+<%B%pQ'_CKkP-_sQ0
GsOSSG>Z^#`jXRK^F%AEUa0iP\jYLp<#e1)pa3;]AJKq9pQA\%!%)[=50?fB4L-aOg\uWW6Tq
MY5B?g?6juVkZ[48fXZGI2`2lG9gDd(/,H(67-Unhok#f=Me#^iKO@N'@gMg`c`Kr*HKtYMi
V,+14EOrZ%hD'tnf(20$'eF2UK1KZ>X5kn0po[*38_lUVbua(,Y#Ds?0YTs)94,T\0F9?@30
fBU'f[9@(r&"YrcLK)1WtqhCAH7:imbeuYI2r.l$+A@iTS@]Alfb"NZW+mL'la(L^cd$[^7c:
[7\P0*$#1mo,2@B'>c[&da7g#:r"'Z*0lW2P?cP2S@F[ElIG,Mf.a?%A@JDg'DjaVs::>k3p
RReeOWdc7p,;Z<6^O]A*c)hR@c;:r-`I;Dg2M/L+A4k+X;"1IP*5ukD4;PXn6P#QpM`r3(>'S
dt8_[@.4dX[ND1.Kc=1E.ZeL(*:@EreQAa*\Enk!@T'7d@(SmqV(K7-]A5HQcbGC%Gor?@>HV
K.Eh8dR,?I@o2FW"U+a6JiM]Al]A"aGnX5rk=CnRGPqT^lALBG43>r0[@7n^7P3ND2R*-(VcVU
2)F6)Z#rPb4l'*SIb_;t_@SRf,M/H/7Y29d.fibM/#."a8:fqO&l9ZRhk8RdtpoV3/`"Ckra
nEF2kLi[=B&7Z]AtHe/!YK4M"X!*F1!b?u^m+UiSa@%rb!0$>&OHAai5K=JSbibah*SO30FL'
IP&^?O(4tTJH\d#uNd>PX6NKFC)#:OEiQI+M(u'\kh!UPC&)rA_pJK4.8r$-ReU(*(;aSd8O
c@h&?@32l+!p,2IJc/E]AeGW%H3]A,nHO6.,KfI?[pk%NtV9Yo3ui\$EnPShV5[nmJ`#9Wq;O6
*JLjZp7#'#Ojn.)>"g<N1SsdIcF.<I(T\)I*3rX1,#oTtau%u9qu%Lbes!c4Z#)/qrLe<2U_
iE2h0%[NoleNZ43*Q8ooRSPlB%Jh'eXT\dKA[;XC\D\rlL@_=Ot2HeSM+O+\[EPZ\>6#fhk$
')!:%lO9&/rDUK/U>l;22M(>=N]A>brAU\Yg04/)_$i:dC`B/+b4R2_SW@a>+#+Z>CUn@cNQF
\glR$"tbWK44HdR'L8s%.p-p49dDOOrJAuV]AG9lQ@3]AuR^PC#KbD+erF2<k`B6Qb/0RNRjTA
;5kL^BZS-@B8"N"L7Nj<Z6Lk_hqGF#P3ElPup9EMYTJB,I^?W4E1f*7TrEo&lgW@rf8e.^5V
MTJR,2p_@t8(@VpKdtJ']ACS4$pbp_m+^^>'G<73di:pPe]AiaD8AuD+B;toF0K:Oji"'NHu$O
KoPI_C3_?!)672P_oFraXO28,g1CCQ9POHR+"`WY65?]A+n=%+q'iYV_?YLkri6uY=?&jZhkt
jI+&]AgS[R5saQd3qP_dac<H1+sTP%pde1bt/YI9tYEEZ*X@%;KU0=Wnd;m#HG_WNtpG@/9M-
^kui[Sh=0hPmPOh22"#io2dh9HFn?-ouWTR(t.^`*McK5^:BW[Cm6%($YBBJ-H4IBBE3fAFe
3QOsOFg8QY1=/1_YPDqZ."fhL%^3o4d1J3,&?`KmThU$nSI/?,M:m0ab1htrj3YPXO\n\&%5
el@9ab#iF0Hkb!DMp7WVY&I[LpZ,TE!_,-7S2@"K;!;O&)]AB')RrhjkliTp]AhaT_<3I0Qcl!
(*j4Hkq-%rr]AONtm/X9o`qm1,OB44;>e-FG#d;bX=,*-KJEPCP3s>XO5d?GpVE:Cj]A,6:\gU
P<-_4gJ81,)>.7hhefOL35*G:ZYV4Nbr^Ir%7<J3E^8BZic_';eBYa>T'5Uopo%7g+Y?1hMT
ntt5H1;=K5)Cn+EZeFdIFQ_XBZC%;!RmJPKk+7R.tX+_?a:jA^9+^.k(k79&*O3kXNj_bg6[
u&eQZ6P/fpLf_bI%EZ<)-%CoRJubL'r&E)rE5W3?7sh/XIea<03`e;I&N<<GBr":0f%NN8qp
I@ZY/]A&=C/`4aX^EgG>P8PIIur7!V/VELC^$U9aNOZIi^M`P%a^,3o.='$Qi'J"r&4Gf)No7
(V;kPR,$,9&RH/mDF`QOYTmo^K_[]ADIYR6"@bG$O?:-_,pnQp5#2h?L_npLFOikR1`s0:*2B
=4P9^LYuDb<_$V<"5M>.[/=#>s_omDG2;Km7]A.+R!!O5LR."id8&J7>;88e^.8k5\d!!u1&&
4Hbb)QF>S8dFTD[&>AUOH(FpM+Ac]A8.?+9gU5V=*hWJh-[Y=Vo=jBJR(;\CbZs%n\J$FOf_\
*KcPf%]A67>L1JOs$L:4_<\lM)0u"sN0D9X65C;/iN\Q\]A`MaoXYjO!a"\;E/`5<9!4I"[Aqi
hWHTu-YtRM3>#uIX.if>oKNtDWd?W#"UDKrlMRr[+,UR!,+tit!,6@Lnpf<-C&pDZit:S4/2
Cdj8!)0NcL.u=:,,ta[s:Kn:Afk$rbl^;F/L^BP3*a'JgiqN-O)8OS14pKmgo\/FbVl7)Vs6
*jVQflNcS.#FT\J!a-$c)Ok!qS`5W-m:`KYZN\(hY]AVqJ(D+]Ar)i9-pjfZ]A:CD21jH1tUQ/4
6L^qH!/j0A9_q2AEqR6cQBKqPL.2TBs@[m,V$pT421:^D8#eW/Ro@CP%K$&q`[4moMhh48S_
M21f`4hd`_44XFHF`5LJQ1MkoXY'@'WP+h/O5dVle%I2-IrDaHo2B^D5S^FRm)(BfSi(RY0E
daB%[NPskeA%!(%0O*1WBl2`_Hlnog)JOWj($@bVac[[nA9#RI*T#"Xa==;<(,m3'rY=D8O8
TV9(pH14@K%hMOV[Tb#pkY-!]ALXP`]AhR_qJiSYJ*HfJ@%Mui_PEfYR*+N925cA/#n@E%5517
JHF7W.'V)pK_@,*dMf1%GV@L`UJN^]AJXC0`\R&IXDSh1_O-2uhS&^;-R#7^'l4qH)m7eE@W4
FDH=$K[o;(5@)6qNA>9/3TPP313.dNE'B#3e3b]AG>P_t*A[%*W[X_EbQ\'%\l1<fcjT,sT3'
#[rOW7B$SRMTZW&8rn:Moh,EgHsZ]Aq>$hsL()UW?ZDN[7<sVtK+"iMdHTjf,Z"cu4^.(Q%sK
j`nF&m[o%j!rm:3"=kQ;d5_t:Aj/Hob;2b@l]ARE2i3H/6;S\:<FIhS?3=AdAh']AGb42tI7R\
..?QWp9J97?CZ#IW_n0>BDIN@Lo4pnf"ND)H,MF"iR%-#(2;<_s`*-<k%Io9!6Ra]AJ%o(9Z`
S;IA:O)<`S>W#/k"*X('g=XRd(T6m[^&(68`]As[3t`FqY;=t]A3:.N1QFM$)$6?5!bq*CZ.mZ
5]A0@UeWMjg#'Ho6d?8F9o!OJ@/rmhLZt>X<7CI(Ra8=^0D=^6WPse$4+(I6^K)4'ls!B5C^s
^F77JU8mP?-Q`u*^`a+uY@:oW6k#E*T(<LO)0Nrg?bGM2SRk7eNLO`2#G3Uj(``B?;l1<A;W
%/8T8a=Qp9C(I/Q_\fi3/&V.BrE=WjU@I@1Z""+LIp7#LFB\)m&>8`8g6Xnm-hTQCs(D#rf_
b^=j8TC=hID&m!!DSkF\q72fP:,`6,1CV`c:?Pio0Tphr;K4?VTn#-i[Hajn`K@?)YWaI1ao
9D`tC_a6UA!M(a6:?.3okR+\RcqfGN%*_c'm8Zt!iE[Z`[WP<B1$*Z=W9pac..oig@<loOXq
_>Zj6:;_%_CaBb*_iRQ]A\\Gb@[QOB]ACVk^ENm2d0g@g3`m)`e:BXa_>ejK8n(g(DKs)cCIJR
5W1CY$,qEN&T>1(8P*;kttL66ff%La\.1D9$`%K%[jeN_UA7i:U((_h_^,PHI,#M5*60394@
>]AKVGo2KJ7D=c@>fI[!n9(YmFLNhNSXm8,i$+Z<49);TO-?X=LF7R+2_0V\jHn8nNaRXFcA0
/!eO/a9Y=2AKBVUNfMfrP:@OS11[Z$&#NS$47&4Sj).\2^nij#Hulb?\erp0V0%"MQPhogNN
L.omfb<T=kt\%=*Lf,cN`.Jjm+1I!S']ArD5NjUgbtjMNg'B=u'#k[ie(SKl=t!iVe,8([4JI
D^J_.?`rJF(EAgidoeMP:q_CZ]ACe`dq]A2uJJa!j\/-lXo?@PPWp.pFCZ=pE`.Zog<*9If#Z>
(4-M%#??a)X'o\F<<gEQ+:?"K!b+\6al&$FS,q>`eeJ+*#il1W)q,.MV$ThOM."b%PhW(s>"
E1A6B:;h>&%FT97rDh9nk[4':Tr[)*8p]AS(6;1di$+:HK7lTDi<\_*!OoEZKI%9n"Ujgo+L!
l(p$^a:*TW;*bhuc2WR1mPd1&(`taAMK6CVm%W2O(`]A;M4BAEq,S#lT[\.k-sLeZX"*7@?t2
%8Qr9SqC-[1"[N_H.X8Ofo+sPl%'[@k19q/,3n]A"\biSr(#-AJ)E'$acVp'$;>ZI2dAkoi-W
:I\fkLX>UHU8hmLmD#kXu0#AV^a[>S0$n<95BXN]AFH.c2t]AjPd).SYNn3q1]AQ[f&m_gW=m]A,
kWF6fna0RbKqE=!Ki!s4AH@*'pNM0Kffk=+DlUe$p&4d;Vi?$hm%aA]A2V]A=Jmq[l@=?KrHPQ
`ru[qLOE2uji$Zb`CF-mDUATL87Q&tfEY@ro!!*/[5FMdHG-ro2!l90`)WN%mWabh6pb\7eh
d4L5EjQm?^QoTi['V"I$Z1SP_4r)>I&Eo]A5t?Q"uTp,Li\\smA\[=lm"Q]A=2;<RXVQUM#4nj
%pDAgP>35f3Pa"Z?9/pQ++]AoNboXm_W>2Hhh%EgC8<<&!/$HX4toB0#/+[/QfT'W6!H6#&n_
6pt#(-E>HFt6Y-DkF),#ptnK%eM>ik?NkOQ[o07MSH]AD7fit.'7/"Rd;QpL</]AWrP'"AOHS2
N80gpCa8:gMKHdr6S7ip]A0^NfIR3qQf.gA`-f3c?P,7dAT,"G,*SgoFMSmA4)FPM5oKel4da
6^e7t=J%2:KB`t-7V$;hQ,9`dZ4A5/5B6d%B[cGdT$PRTX01O<fd`sFg$7U_SYL(4nmfUm+7
1-qVF\/iNot!cPaJ1irpWesCnuo^]A!YOhKD"Rorrp"=)`_\S1u)/`m]As<NG]AJ>0ei0'+>E(*
+QBciCYJK^G%,kD<W0&VZm8%sJ)q6f5e\$4(G=Nb/"hbl!cTCUrA"G6Vj@u,n;l^k)q>QAE9
(3W"oet5TT(1*%^W@33gI4YHC=?N6TV(@#e1iH7qf"+'j]AXta?^U2@\P\Lf[T%a]A(M3T/`I>
crq:QiGV<TF]AAtnPRQ[3@>@ldGE_gHa#*j":Cbi46K=QSU:4-f`sV[5%:DWHK+E58(cc@J:a
:Hou\+aN.8-A*1SFjE2cIr7=^pu,g-D[N<>A"g)JcM-#tKc`)Ap3uKN(M.(+d4urK<u-+`Gi
p)JL^s&`MK.BbB:?dT^3N%sGQU5NddQ$tK#kcR]AbXS@DQdk'FG.GLCJhY<:D;jqIE^sYqsJk
a>rbds9T,haN4.tJGV4BfrTWh\65dr,.H-H%91c7cm&+/m;>@`Go!fVi3DS+-iY;NPkL@WI(
&:cG4sltA!^U0bcc&5qoLA"?(PZup*Orgh=^Kafpf9Ok*^AX_FgZ6?0*tH`QnulI7knfM4X`
Ah@3q-nJdM/`"RTiq9Mfjj&u#Y(3A'P=:gQWs*3I`n,qDgK3&nP7gQOh_l-4R1RgcC?kdn2R
LMe@ijh2V-^7c-7lBJkt>@R7c_!5SQ=0N4`X\LL>Op]Ar&N!kbOI@\hd,Ue=rg^YQ5S;C&,n/
SKF^.ko^en$IlOT&M2O.FANZi(-$Y[HSaDuA+>g:4#^=M64h\$lL,r`\m#1D70&dMP`nko==
1q5oF)nT<Sf?fjH=b8a'39X&m(;7lrn'd"f&HO#iQehJmh_d-.b--Ga`:(M[6W1t9gQcm0+f
$:oFXD]Aud_2l)nYNO(#)p$pFb^[&(Pe-f:,pM,mF6OE'Nc=X(35%88XNDc.kRi6i9)?YW0O=
2H4\%EW%]A7PKK-lW9Q[/0a9Z&t^C<7q1=&=E8[*W0hE$>V(/(K]A'^rOtcZs<nWZ<hSt+uDkD
Li)3PKInp!@WQJ$:)Y7dMVs($89bk/(oJij#X2Wc5lGW9p7[O%H&X-O`3!YH5g(oL=EttV?L
B_%b<5aAnR8*kM3#>RS,;S&#e%Y?X;-^tIrY8+KMIQ9cn<;'IElQr'%Uar."%Vp^9J5&bQ<Y
`&0P#%F5/,1!-6Kp[o,^)5EuXkYqhQuX6ZgLf`dZ6`&*R6G/Aa1O%`%+@EThC#VGcTDhGEjH
dGZ>cp$7V?/MI[adZA+TGp/Q`r1g\]A)>?(HKH7\X\Dfr!FE7`@;d,!ODhHtKm`G4G/-q#:lC
9qW.:HPYEB"J%LXDX`YHBoikKLlX9AHojSa'8I#M*!#-b/OoTUlIl1@)c/=U`qOW=ts_F(ts
HIjIMYO-Hp"*^<KP89:8O-=Tu`OU>J_[\iJk4t5#qtgQ^Xgh)uBSCAKTp+[>_bXP3TV6E6f(
U,+BEg+?<!VnD_7oWIA1.c$0d@$XRt`Tehb9%)3q@:LB.!qklJ:/dr[XT<Y+>n+#[tN%39#`
WqT6Y2GC9joBUXTL:MOj90=uL%jHFT$7`VHTDfu.g@;F!VZ4l>qq+js3MLKITSFWWUQSQU+M
ILp;%p#18El)bR.^ls`E?D[GZ-Q%Hi"p2siuqj,aIX8ZfSK.Xrn$Ll/u1hhiUunXN-ua>r6M
ot-D@%`?A5'Hj;A`Ve/2(T>/;!"G<2sK[lWQH@OsN^[l63tATW!VW1Kn)E/?m`61)8W2r>W^
>1=)&n\TKm5eK(S".F&f3$g8@*u',Sa@Cf?.^)]A1QdB]A*mlKlWN@qn/i>PkB[3=Nbl6cF5::
@Ii3aJM1!^7C@<&!E_=fe=)qFC3\*5)5C@t>gB#h#Rf3n^bVm>L/NLVQHO2\u>P2?`=I^?oi
KrDZ=%#u!;PrS/_IV>fE<3C/apTS)2N0&"9n7MFL72,?bX95=h(@[(=hoZq`P7unG@47dKa0
=e\"4uI9-HP["bfeRHF^O1cb]Aq;2Ko_)8sG-h.gfRoDeVl]ASZj^>KU'r=EU^5kgI$E:5ngWB
0<@n+Z+]AA^UN0i_^pJ(U14rr004:F_D-+A=Z-I\V%aoKRWs57H@smSAkXrn"2&qpU$nm^:!J
HMip7IoeWgr*M+fdZ=EX`qd;;4G4o,LR#=rk]A4DS@E1W/EU#DL=NGUnq&nsB0j1S;Co0EiDD
[2lX1\K<;SFKrJ5?X>F\M@ORk:[Ws%=2C-OU_n-<"BhkGgElQ@?e18]A*(>B3fltBIg##N`uP
m2'+!Norbf3Nh?'s,V<$;n0X31`Phtlju9?,'\=ef*tF,u6>m9iVaj:T8-_?&#e4:`_;*k%g
=5cYL4"t%Q16J$Z#<C5K^%FTr/AP;<&iubpcp<oXrB:;P$ccbh'JP%6f;ms9"4'B3]ALT575q
@0DO?(u%HOm&M^B_FD1&m[<#<Fmg?rHGNUtd\]AH+c6e:;04JQc[q_oh2J/$pH\g08"@B]A^4N
33\./l<'B=\5rc>(0IsApbZ%Uah=&H?jX9^L=[EBPOf;Q>eqaqS8O%2n?C/NGE"rC(Y>s]A]At
Hh@WVKYs23I:pF2+)1\C?@h=Xd`UB)OBS!]AA8f?>6?<.Z"i,i"uuL8_=22]ALpUi^T%`cWGM'
6C<T$T#@R?I!(s@\D]A>OiA<3n-5\Qq>C$T<Q:GFq"m+<&."%pd6/q!3\_sm4fVY+2H<<DWk[
N[fW]A:fa.\LrXaXj.d$?;Bql!`+FJ:+RP=n3ko(;TF6';c1JH&Z+r08ekOp?^qWP"W"F6XO:
Uu##n@aKGaaeeGWr<]A:Z,'M0*t9d-Z*n!0]AM+"P/Y&Db#2-3*uENTiC3N4Gnd%>WMK9]A_kLF
-`Tn=iqST2b8`R,]AHF:<5Aj-!D]AhGN"KNJW[,g"(BoQn[g"i6K6KRW+70+%>c6T.If,GYAJ7
Znf4Mg%+p#l"Zhu>0B'q>HM(r4\fP6b`j70pc^Kkib'VV5Rf%-+0T>+'qGmBtbuDqApi?`YS
sE]ALIMpX(N.hC/:G"tUup).cPIk%lE#!n,558O@u3]A!G`4-WN\c4NM:<lud<7HkRTGm4YG@a
Tmu*Dn047IY00sfYq.lmc3=3O>l\G^@1ig+Rf#ucVt$.&`!Vd>YNHgJ7,_,]AfV3(_#Ys7oI1
#ZM_ZBg30#e+.@7E&Rd^hA+cXY<4*W8b_KPfR/!@CJl)*aaA\bGp(`Fr(V6ZTfp0GAbNoF=W
@"Nce$U2/@ZTi5opmmu-dE%N?p2`3RAq((qT@O7*G<-FK/LDhM%b@WNHXCXt4o?LdH.Il=UG
JM'.O^YepX*V8naUo6,K97Y`\HiVIlZR@<h=YAHq$0(B>NL=$s4%lXe*(Ti!ZNeY688-9L`<
.ik$M5=]Ar_.D5dZK4GR^fq8:<q-/a3$9iBqO3O(2G*S&PmiM)H%(NF;Q'_cUnV]A`W3$ae]A&M
)!/&<BsfaA5GlDI=@bCT/RJ,GU5RPJLo:m%q?FJEuQXp="^;MF#i-t[RCgV@H"8fZS1nQ!,B
5*IU4Pc+8d714opPe";S+3$.G-N'#f=IZK9Km]At#`hA3TQIF6T&bgK;-a5uT/=9AV1rpHP;F
F%`,&+A7WF+ON0j#7@+CAC"m==S?/EdS<5uaUZ<t!9>"1_:u.;WoAW[-m7u=io:l-lU1q3!:
L$YoKfI&UgugDd@SmQ4a308V]AqbQfbkB0r)n=Dc;_),NVnM/YbSU,9j*r7!q1#ADSO8,90:k
XYf(]ArV5:`@gImdVN9&?G)K52M*DY^1rPS]Aq$)V'i]A-FL$66s;8L#J?<#*`bOdGOjsl:lR+Q
_%j([&C5O7!%hb&h-?.r"ZS9b_Z=[s,NA%$5Quk6l)X:LT5b>+@!GAXs\nC!%s5te2bl/ikA
i!di,`Ues=+<2f;rarQ9AG3,Z-+bk#5i!o-&4B9]An9RbU?dpIkE&hOV?7C;bNTWn`T;LC`/I
?QQB,D;Z:/nX/,Be*.:);4o[R1WWe,(WCT"dV6h:]Ap@uB\'!9?#*".GWFZYh[]AjsX)FIfp#U
@M%T6oL6RZ&q9)#`aP5VjINIhYt32GA_kDQ&(YV2%l^(@`rQ_iJ_e5JF.>kiP+B8Og$K@P**
/*T/3r'Z70kQ9X&,:F^Ihll(lXmdN:oMa=^''PspCXnPfoJfT;!&JJFY2!"u-l#lJbkP"_Dr
tQDk!pbR]AmKc#1or59Kho6/N^TO>X>X_7=,5?A]A4a&OVPcdI2a*4D#\qa)FmLkJh>C=6nj*,
p-E0Hh4+D[)do\2F<?US3p]A"\#l815F#n%;9Udj-3#>=A%`iVlHbOTV5hXA%CTKPI29;:j)=
D#6*Z'#0sCIf`uYc-tmO['7$cn9mu[qFA6T&8RGeU#.LiN<i;^5qKMZdLDo0j73^a/mWcZ9t
ElA!.g#r!6[S#-(D[$aLP#J7P9-WH@&Ei+',CHkh8csIF(@_U<iQmY'Q/"MZH1q4ub4q?BQ0
;7&/mAiJ:R/VfAkN]A]A1Ks]A8,`Vn"`%&,7/K2:_LH=)0`oNA2NZZ1F%$[@f-[e70eESiR!5Gc
A2BIBkL#e%J;?G("u'F;Lud)g1Fbo"Q>m5Ik&,c#m9[=oE]A@+IAL&1AULNGn;&h+#BI)5c1R
FBE+MGk-C';9-0l"M[\<5"EeK-U:m\DbQY$568`*'"\j&J,mb?ZG=6#572mc-uY%+s:Oug4Z
V"lA6&B;.VgV"uTji]AQ[b+k^?Wbj=J1AN@f@.+H([ca[k8F&4eF'?)_Ie4f-+)\G1b&SQN\e
T[MhXQk`!Flf>)VAC;4<Y8<s#T*d?\an#H>f:4$aWUQh+c]ANEs5s/%L60qb4P#g]AOQ44.'Vq
4l$&$ZgKTZJk^)fXfi7r$D0KbT>Bn-o@kGpmcKLQ:og[$lYjo':3.gV]A$@`!4p7[3Th$/r[!
:/jR#+(`[re`EOnNLfop[*0r.ROCLhB%$VKcX;m2@NDYmbTO_L.-U_^CG#EUsRogmuEh0DT6
&-ob<%$E(F)16<G"<hSc3';F7r0FLIXIV.6)N,5D#C-4E]AN2PX\1q1eX$#.2bMl/+%+K1Rk3
qgM34?'?4!lcthcRE:Kn&nAps0LsTjc-5D9MMA_/9mkaaZ1J.I%W<%K,;p;5nN2-&5a1ZX`R
J-3%p9Q!14$Z_I^nO(O-OS($Nb$"27i]A:S,E6Do51:KkFaqcI_D]Aa^,8D'.%$m9E,A.Nbfe.
VkKZO6hH?tdql&UOSWin6,Bcp2*-mYSVU7Z4dU7(gM^8N2hl88RQ76hB?"A"8"Ca#mX&>TC(
G/Ljo<KMGm7!Aj97d\&Zm3,7lte^1Tbg)qKYeDNr%W9UV;cX82Qr/MgIqh)CaV/im*bON4fE
26TI>tH>ADD]A1JWtPe(u)l#!ca2MMc9@#S$e'DIkb5JJOkE=?,-rCh"c8Rr5W$n@D@9]A7`Oq
Z?VG7_b@q8)lpkMNs#s-H?ZfD]AYu:'[+E$(Nc/D6AO!qa@3EgE>^rZaq=%"02TOE-m0Yqc6h
=99=m3r=0uM(tb8S6+R&]Ad&4WcG%285b_C&oMa^L[ssXSTqt4iKXEIpc!>#M`m3e5$d$f\h"
)rO,HNA5>8,jOe-*ouXtJPZBR=Xa9`Y5SH)"YAZg4/pGO-c!Y(+;]ABJeV6?jqA8a>NhC\M1"
4CbJDuW"hFX+9BpSKM+RK2P;4OI\SF:S5YHZir_%a0dQfB35n1sGC/%QI_95%gb^.JWQ2!H1
^jp\NQVj$DP:nNJ-`]AJkM]An_A$'_h7!JVsDP3bl<1(lMlbl_,i`EogDR$/GGR.'CTogr`j^m
8ZVaiE^#lVK5VHo-%?%j3GiOq)*KoFo]ASU`S_U7>Y&SF>KZ66Gr?TUad#iNaX'r(KdB[SF3B
tm%B1W&#qeeL#-nYrTEFc-@MfSXuW?=]A0T`=<dBg1+5WgHir&c`/4A@?(l2kq[tS66\]Ak9'^
o2_,IoC\k!qWHegM2FbM0X@<NAl1FXbf+ud,6TG3NrK?]A9c#D9s./#6t]A@O,K)81/J.+l_iq
cfE]A^66[Q_:'B$pK`jcLV]A.[\VY9mNXJ2X5=jQe1!9PhDuUqCFG_pLRHd%a^Mp/(/k&MbZHb
+c=@(c>lds3QiF;+c'r4b'"@4a639=!j<XgE<j$Rb&b]A0)j6K*6&ncEUWKf8TjT#G45"P&He
F&m,V4)`2Fp\reUMC7>-WujtQ4[[K^..lauiZ=!JWp"U^9g]AQ@.k`Gp!e37Y:[8`Ynj*i$f\
nf%rP%;gpRjUNaD"iAIOcncVRQDN&:`*=ah#"QWcJ>A`R*lh>8D/&o#[C4:47+9\cr"O#5V*
9h0EoBiPNV^-YfU*TIdD3,X86))VZ+BA/]AD`42fFu@$!.S'+08RA5VQ2+L^0=4>$b;9#%@`s
#h%(RVAOhR"R0J1E912^pNHZ5`"Or%/Yc,r\R:j,Q`9dlKn2h0b0^U'``q=SOZ(*]AmMj#kKX
kfYI;PM&8@%oCBtRDA?d+hZK=u%0[s+dG&dAI#fur>q#-21k6AJFKXB&gW-mY^]ARimtDIs&L
He5DI&=TVN5JY05_'/4qY36Hn!*<BiD+EA!nI'GRX%]AMd[NK=SMc?W&>`&TU$%rhfjL6P8^0
.P]AMreQ=\Oi1t$L$;d;t7=KCZUs0b%RKCa&)#_fUlQV;1j03F2>HG_8JE&gS$p%'B:7P-bWP
RCXc*Z(1,rpi5*-5ABQ'`$4mYiH]AgDe3T8ZNjLrU+>,\-1Ono]AsNhf"5/d'.\4aM]A*Vl*;JF
9*/eq\)YN2<TWP&[DnA%6'.R$NY-Y&!uRdKo0^?=WAJnHZnb.mGItkDSO-X^*Q>/&JFAt3Sb
"giPE\:'It&ZNl".=1/#L)j86#B-AX&U-bo8\Ds?H('bVK0au[m(:R0UhIPsbKC+GS.1[$l8
%)3]ALf_Wp,F_!cN69aPq3(cBJNCc!:^qT38>0oc6J#"EYORg!C7O'"SmYeGp94NUTgeCfMi5
="d%]Ai4eO"@SgZqbum!:&57N,Tp%R%SHQMa>nQH?+?S1O[i:'?o25:9Bpk]A,CS;d/puP`9_&
-44scSf$>"up5iuEh-5-"P<Z4-&#S2`k!I^L7AsGcA.D88f7[KDn><kDBqTkA!OcfG(@.2lE
(9j(dir>"\PS=#B<`5GcnGR>P%#=]A]AI0(W^jHL$If2K'AJ7`em*YS%apZks8aK%Ni'a^YWV7
$/39,b$f%!CJm:89n6'6hJk*Z$A[5R;>_AGoJNA`,[`'ZXrMF.jGm[LPFVR8WI9fXAh'7:g[
mHUou=kn:a9PKt4<L+J1F2aq**e'+M\gPT/b25Wup02a)C%c5PJ^7%[kG$Mdj70Gs]A+FH&D-
qA>a9+j^[+7N*oKl-('"NcG5![lk6fT<n"tBF0JCN?+M/KQXTQGk(4.XZ34mQdG[urej^=a<
SI10!8`EGSMo&H/9QIq8qY<4$1pQ]A#erWLVsfZ:[nIKrFhk<0j#BCfV"2/\@T.[R^(9eIb3d
AJD#2\a&:be<hD<s!/>^=*DK:CQ7X%#JK;jdNT2Dk>JUJga``.s<3NA%KV.=DW8PQ3WPu%HI
Ka]AIjr5i]A(K.h(+sV(3+MTo=Cft>[?=LI$g<Vq812HgjV0Sm7u,s"X93%orTRoZRlqVOD%Oi
\B;U[]APbeOCV[KFbJ+BqZ!E3-kF*IkgD;[ia<(`dU;L>0BqnE#.5fJ1=P^EE$;\+gkgoV[6H
Ki^D]A4C(l/hDkO+eK/,[FWfFX#n[5%fMG-7i:Tf*l^nk-K$M@&h-b+)$2+DO6V.=O2!OqQ/@
<9^Z)=YN`rsSYrX-SV+s9k(:,Am[lk3JDp7kp90ZAEV4d3Q$-k0+1%=&-I.MaO:I.7^11k'd
sO\3/o@sYbLA&Jki]A(r3!.E.oI4U^/l'#6Qp2II)RqhJ>]Ai,d,$&Z*;Q^2sDf8g\-F'Al$6a
d/.Y=n$qU^8j">'@\mMFTk83r.7ktn&iBTb_f5.+,:Ml`mMX>CX5^#68ha",UZisDQ3l1iuK
%shgZi%il%/Zp@fYX2WOgoE=S>\rTon,fFS9HU8*GhPPM3`O+":4`!Mp669[hn#lf44Ye!<k
F/F8sOjKW/!Z>N_cGc^),k2&=96#]ABipUK!pRKf/EZ.g/2]Aq-t81=^O=&$WZPm/pV),>)*Bo
<A@@pT8s%cV*E)@CpXOWa"F/K/,V02E1n]A(8+:r'^hfC3H!=ek*)'b+a*$g:<dL:$D@Ci@5K
%*X,cFbj?IDLm.\FkbP_Rk]A6,3YnkOVN2pX?X#4\c*)9XO-i,p#f^'QV;_VH8G7Y#M-0i?0H
g)8GZ#^bIuShB?BBVi5B9uRA`KFMaHQ0XkEj]A5.<+R!7N8T>(cWtn)IC6%%,W%pd*(e!libn
)(CL>F.gP/S$K]AfNQn,Wa`j17'`?DP7CqVb^p/-uBTeXHgB4)dGEK'.jQo80PdJKsRBXD!)e
G,iZa(MtX2'O+9lmIJq9a![j1Z[52N+1)Vd0V<[@1&O9ZO&!^3TZZo/1`f2b&j\E$f6,"`W?
58XD,Kkb=SfjN&We[@%GNol,-$H2U?p)nYMoG,WTFe3u/2P)s_sRSJo?BRXUmik(gJ/HR'\*
c(?`I>tDU^Q5N(K(MC4i=[Hq"rj>eij?(`=l9';iP;mrmun",,N$[ZqR2Ut2*ig4me1E3U]A=
#W[\6h?FRNaW)niqP3a*5A.C&`_k%-4Jg;&URj;E8@)SWJ.,=m&,&8^V>$/Q6WA9,[6@?aiH
c$?DHaP,ioJQ70PHR&'$i*Y`^UH:*c92i.MqKNp/0;7n3m`'k$K7+5s\Y!8E4@W+W85p4meU
GQh1FRQAb)?$/F1FXoW&[(cn?\OQMBHH76p`33[m<9]A(E!<WT<#"CM^-T9LHAt;^&ip63R`O
M)k$g4hGKmi6:IrRh,5*_F"K0"UY/FiZG5*lnE0O8.H^rT^FZn;%fWSU@$l.FgJ#2MX$N5Nb
*LWhPhtI`nD'MBpPYq/Ta]A+WYK[B($8u(9+[`_j+BQ!*/T#(3)eLn6r-!03'BrOkl-Cn;k"g
ok'KbIhP]As:1,Olq)+q>2PPlk6P>_m.n6",bAL+e0Q7='%.=rgS*#bPGI4=.smpV.[*;W1NU
V?Rm:A&[SVZ^P]A7aH9ok:$Y9VI)P)?>i.!`gj*VbV%JDlW=H)1dd"#>d*/&[@LSd8_NmRg??
5S9M!a>@r^+9Rjall]AIEj#aHbJXDPY5;Dd_'7sd8<&N8961i7`kh]An!(:nCW*0SpI_>i-*?U
#6.+_s@+-@V5=CNceCP!]AMX\qP:G^j[X4o<5?X`I>%<d6eTp:O+'GVT7>JLX4@GT-@5t*M>5
GFK)4tsZlp@=;0bcS$0N)RP?.Xgi:h1Xd6(d@jHV^>XK"paN"4MmE)U@hI_[tU`24W;gFnZe
<ONL%[l\\6nULQJG6AD]Ao!^BqWFea!_Fl_1Z*NX\Hcp=]AF(mcs_b;AHr(_Rpgu&*q[/>Gs:B
!,[,BgVes8^Y>e^lFN%hc`^O%U%@)[M0qiEm-A/P)^VN4H8(h92X"ighFg#fD[nI8X[(+=h\
F^q4p18?6+hHrSu0BUoj,?1X8#t^&(X7]A*&@9^m^%B(;O+jclAm4qqY1ihT<X[)jgcnn`di2
$9.p4K3\h",^U$P0kUWT8aK<U;hT$rZ^UTZEG;1FWUR%M"I<9Y%gh62?6W3uKZ3"XCnSBpkb
E3*ZnR@@A.dmR7EVOdB;C_$O-.\ps%bt`2A5PWJ>Pl,6*l@+V4r=(bD:Oj-3[4lBf_Qo-U^a
Z%njR]Aki.]A'";/0@5D+9!1-?\oZdl"3QgW1Cb%@9k;mFFVI>GFJi\D#InTPMDX111]A(),I#$
Wg7H1Nc`FiH<#!-i#rEma]AEUIHBXO96c?OIY3D;6gF<uOedh_bK!#,+-EG:H"i"0&dMW"3!u
D5HEDaLHJ-Xn$GW@oX,r;l#h>#h?.q,2lLB?-0)6*<L.XE.;E$?.#QIo/^S7C0iPatYOlV=I
P+!sWWkEi@VGMRGIMkD8sq-6+3D[[np7aA4Jj?+pZZJm3[[MeFt_6Z8qAt<HqT?_4DAm<NLl
3JW5k,Pf7NUFqQ>.9i]AFldqRfN0]AU##qPY1^WIC%60@QpQ1@p*D9'1ChAN;ZN9:h@r"j\`$N
@$59"V$,U)Eah"\DWA)X=2HcW^T4q3-JX,#WcQI>AF7YEi"/(b0>h'/-t1Q-O>M7f-\MSD\c
On]A@2<(a>u#AZ*/E9m?UP?+5Vn91Y77s93[g'j6YDW@C(bGi4^Z&WUX_J.nQ,66IL'e!\`PC
t6'YJr4\q'_s8]AqcaC+hq&BD"!l,Cf^S7HJ:cYj:[2oh;H^k%g7k4#-]A%J1+[=+Ak7X4#GZu
`)"Cgm[G]Ap,C?F$cA@nnD"H0_@h`th!"4e&hp$-p/_k7n1ArUsRBJ#fSb8P#G:mS0SDbjU`'
cMgSE%mjCX^uk#+o$2[?RpM1G0oCfEb'DT9c:'U,f]AmK]AJ=6\^bI5An_Q2p!61>Hb3`/#EW!
+/mLV=C99r=igqYn+MfQqWe8\CS>E?NLF;eK;=LN_ug-UPib@QD$hnH134e9:(ZFshr<WZ4h
.;AFX):X:R2"@*e`lIm&8@WtYn'ID4M6-5-GpG!@cF(RE]A$GF[HR0XB'dN_'!71I,35YC.<p
#M#H+:r8:bV`Cl8?uNjMTnZe6:i@GViju%^V++\Y3]AT^5ZPM(Q_!JXt7&a]A.kOc\r6U1[j(B
([M^Wr'-!bc5L??>0$GH%lAB_J3j#H,,5k&$1Q6O.9Xi89TrGEKeb%i10i@]ACfhRf4oT,Z`Q
`2k'8EoGDaab"i(XJUQcNq6+ftBNJah_V.UE<s:g0*fGG$,tmUBkD/FOd:k473U5dJgt9XP;
QOPrmk;H&hKF9MG68:D2BV-ag*b+)*[Cbl$+Yf7M#nfaCHLqN&_+o-W,PSFo)=BBZ?#[5c\P
EWY&;-iCWLe>@2=gO)JJ)-6&.g>:[[dTF._4P%lP/d,o,c=`Jkm%@/Vb7ag>OtPdnF+`.-:,
UK1XeiT$ncJ6^rb3a]AcJ#ArAH!BbQb"QET(R<MbHF0BkT%)+cEkU:/%VJUOe`+D:^R(eqrLO
@%[ft2BrL/N2g5T,(de4<aCUXuM8GE:->YW%ib*R[^Uq)oMQOhJSON[uAE#TY_UFH[PWa^dF
IcLBAPIkcV\?ug__a.35-0eF`T*OY&ZXXBFK>$$'c\9>;91f"s4@_B#A$Goerh818ffsQe<L
j`@j_DuMf_ql'@&*snaUOso7Po!DYZd4)KmLLk';rWG[2$:e=*"OOR/kPnfBm3NX821aV/TL
9DEdn3R+Vk2Z+d\Xn06tY-/-.K7kJUq-fcgq)23@(/'O,2af(@\LKZ>R+_jb@uQuP<?;QXa-
FXT_QnL&,#i9JhW:*0rHcR(-L]A2%l.UW1-LR@`]A-eE',XdQHB6iu7(l=XaLcOnm-,-REP7*F
I7-D)c_k1tK).9qDUZ28=J;USlU[e\B;id<nFOl'[.2]A8u2[6`c3m2/GJ,ZsP?@aGFXOO,4S
0K1)*3<#uW[n6&O_j^;+HQCFH3e3:j,:>qDPu@?gUtZ'BEqddWS[VA@aYIoQ]A0RPMZ8(R:)0
;D5t3bDUrtHhJ3bH<.gf+8eJ(oa"(_ln?@OD0iiU59`'9t$/HpauoObrVj[iXo`iam8&iTM<
5G('+a;R"U%QGacV$ET&IgMUS4bRD^[j0?s05$OVZ9j"ef,m^(eYib*eJ@8M%Lc+=r"%tb*X
'8n!Oo9F25MrQ:k5Uk5=]A2A,%k`YPr'u(S4Q%U]A]A?Vm!uZ.<E^Hh\<ccHmZSQp5Ak;h23t03
lor74HQO]An$O"5A##:?D%)72"s\3,`o"%D"s;XB/X\J(u"TmD&g@![?l87=m*WDab2\IL#QL
Kf9e1s9_*!!P(+Fk"t(M'7sC23c3:=9&rj[r396=FX?j#b"`(fA5WiYaA4_0JmTABpNOs-\+
-$oV?Z^J-\`fP.IA>9q&!,=5#m<<YlMhrBUiY%,lS(SE>NU%*>u@lpg,j8#C5eVNLWXYY%$q
\As4*.&l]A$W+ZW^^Up03L9"^FFZ8CO/aIiL7Zc1*S]AmUJAM9)i,YV+r/hkb%`M[Q9eW@sfjV
4QGFn)fE-<,TgaLG3F`SpK3@&&K=p-<NHJe4\@s/ro;>6#K]AqiYp5/(NXZ7+d$)OkK5>-j$E
5h[b9an:NhuVCu%b)fZ$H1S"lYLp#GqnaSV]AP#*Wo]AYYmA*iB:jj/i2XLW<9U0>I2jRRQYUc
Qk"uBhkN3#>S8Tl7j.bV#,tt:8AO94.GaOpH$9BD0O_cmb^b^RB]A6$I\\Y:-[%_V]A#%,/941
d5_DR0(Oo$B^J>")5r[TSTdZVs+lBNmo2l>d.I4o4"`M_U,WhjsM%jQ7MF,ApNoi>*kV_\gd
Wo4MRm$lf^*%465B^F^B$(8p3X7$D<'Ba@R7RBm_o\Pqp`0Q?_O)4MR<Z!8dMGdq*ZI5*4G,
4Qo0'YeaU\&ofm:Y9Ooc;q_+31tMrD-:6]An)_'IK'Js_)Dsi%Qqn2%Xt1hSa_.RRG#WiYgoj
OlsRrm+,T>H/%NrV!qamq$_j0HPKRJ&*h=QROu[D!Q9KCfE[%sER!LOX%cW;*%VeF;FVdQ+P
13/XA#7KDVq#UfHtsPE=S@(/Wc>T!?5UjERk>,L>]A"Hj/%la9Rj25noiRe*)7'E8-tP5GbVn
pkgccbJq::G9e_9O=^'(Z(h;#Bi0734iGV]A[L?=;u&A2efZXC9?2%uKTCK=Emh'Zcn^e_?)L
05*d]A]A;MjY9u6/,.THtr`LO'qVK;sen)*kc<:50Fe5:3+Pi%cR<?oL_RCT(g$>SfF\J?M]ADo
HsDYCCPeD0\X<^0Xc[?K*;=WZ!dA4I[^k36#;+E.-<6U;!+HTi_N4Za`"C-&!L)s!537e_aY
IGfF?"Ri'.tWG.jZ-\:A7Fe`g:*is8DiJds%.V.HZ-UFoslDu"`8;q=N()sd4n1&UYo,*WJI
2C%-o3(3igcX%M`'t*mV;CF,g[-O#C`o1U&R@TKZt7<[XdXg9m.M!OHb6Q!V:[1(aGX<[m7m
"omN\kX(q8IX4a4#C1><a.isU4rS'EC_Q%M-jGX=ZB`<R,f"2i8ZZ\:VXp(M83hd=>3P:T,q
%D*eB<CIo-pr'T?:&[@<+.hltrfZm*q>\^gL]A@73Oq8."']ANI<Kc"[i.TRQ9iY]A*OoM6Et1K
]AD&S4O'u;HbJsW_bJ\>gVL$FGjck1Jb/EgLb"oQf-Y.'1L"9gRs[5Y,_9S8j7qG`j3jtj1qs
$r=5YF3#A1,q\"mNRp!^Q#O>Wc'qmL%bL#o(#2TTe3RiZc1WOZ6*9k,bL109a4"RoqXBjr(7
=jsp@QA-Cq0Z*U_QNGop:'[f4HW>ADr)AcN27ZBN+O='9;kRAN34Ve,'D$gcnE4/Ghb%mQH<
+3/(f+saIqR-Q8ZHq5Z)*1H3NATD!SSYi@ORP`CR.gHAUdEG2/`_LtbTW8PAT>s,'28`V:af
EL^*HCB$lK,3-=n[DO:e*UBW6(TC%#@pBtbH[CU"[J--Ep1*m8>FGXD5"G.b!)-\75e4bBdJ
Ym:,j[XB;$hk@Y.d?IbD#OEX"UlnO?I^!3*40$;*=B(bQ%7li5^PtpWhSDFY]A'H:WQfe/bu_
#E<tp-N^uA7_Y/gGRf-5/k_n0X&;BcM&b8'S\ij@;VJm?_q"jZRSV*D1fG"_T/ZEgQLo>F0[
H>7KWEVOP]AZYZ%IDl=\!ahQcOIN>9fB-ZAlo0=1\Z^.S)W'*V\r,fC<bf;85Fs*.VK>Woo0C
G'bJEF\3OW-)bunD!ZSaS'Z#es<qas*=m;Q8SB0SEH\EN&j?k1@r=#j[$co8$]Ai;A"=c'EUa
?%85dd.I!\$ilI=)F>JqDqa`42V"f=:TSSJ>Q#,r1*+eZ53H,X1)i,N/MI?s9ogF"<DmUML^
@%mOs7k_/?@UMdt5'QHe*\<]AR@QGmpVuposmOdcd]AF]A0OUH('.HhOXFgY1c#dO&41OO>F)N$
F\#18ccTb:)=6pVaceY^ZIQQh/phXcjjUh+(("bGU[iHD)I7#,m!O*sfrL4r<\q)3dkq-(8e
nNC.Yg#9A(,[KHF%f&1+b-.\VenX8mRs,$jp+Im\)=CF.Cq?(VKbao=bdrD5P5Oa\;KZ;B,X
Q"/\LmZ>jWPHm,@h79PHe?bg/]A$*n-53I!+IN)XPO<bF[jM"0VR=[aiPXp]A\]A4g_"&(;sSPm
B)tlEIU>TMT-8r5rkj1cn4IKSXJ)crjpOl#lmjaql_bZu`[fOLB%Mk\&fRMgf;XLGPW49Dpf
.h>7k^Q,4bmBL#1$O*p45EZo2LZEFC'@SPpK*:6:W2=qB["7Ue'IER\u,PA^aTN>?j&4q<0E
u[XOFSNA.hANRVL`\E)1ZP)EaU?`3%m[H,VNpXp`\;IKdgTMQe8iVHh.s*pZGKrH*uMO/,2p
.H>g[-D7;j?'a0]APgB"@I21j5`C%GcJeXueC6G?l]A5:M=`P96OK/Y`99nq/CgWfVK@8_kDWB
5/&K)i&@1Y5<%?#2R9#A9Pq_^plH(Y\3C"]AMlW3=qnqFSaAiG^:bB>8ElkjFqn).-j4pZ4E<
?"Jdf`*STBqM6c^F7+ESJ\2Fb`,@A>h^[.39$,_lehW\$T'gImb"ea9^h-e0_bgE4p`oc'h7
V-Yl?/3AXS)e0UTN+f.^NBB[uph(\bk:'fjo2;(e8HUim96Bec25:Pj##PWtmdfq9/s0,XaM
fX/NsQTnbh;IBC[F;fW2RZ,3*r+!n3omKR%IoMg62_Rc@]A\2(fIGTXT-"+Tuh1d1)7rFP-0Z
U<Uu5+H8-Bs"2J[_r&IK4cJ[Er7uQ;0MbR(Dt[!4a6[!pH`6KHNJPAM^&,O'@-#'Ch"6qLO)
K168ntt9@CW3hN#lbRe.jd50bC*E)0D8Y/p%.Y.OtgW\`T@eq%2]A<>2suYVI>jmE]AbL&&#8Y
jjiEY1n`V6Kr)QNQGBE:%J?Vm69Xhc?<%LmU%h,X,1M(WE4=M"`15Z#MaJZaKq)a`mj$Bs=S
Z\^DWVkH1j"b#bRIndfAU0'Z?Xb7CU4@p>#Z\2+3B<eJ/oPr(L+6DnhQ;IGDC>f\pgUeZ"\*
c-&_Hfe3&%O3T>Cbq`J3:Tn+:r@o^1Lb,h]AIPa<;&\S%ERE7Y*SZ5$A8T"b7]A!JgEV&+/2L"
gDATr.eYWalR1.Tb>`UJ`%iXhWHF/ShFu7Zg4#ERS4T`.IF=AhjW-Y5';LqO)MZ[^lQ"SF)Z
tF1+2'e=D?msRX>8^^<iZP-+V7p*6`!\DCmV8RN)M"dPsj:kt[#@++;i4+)Aepa4<Z7#l1]Ah
:ntq$=eV"%pfLMp>94pM7Wj]A+1h:U>s/j*239`@([oS_&d,KYV$.#RP+IUbRdY-/k:nmZ8Ni
/i$/J1q%`8=I<c;PEjF*ZGXA@Hl?+SX;"@5TL5Ltl,38(b%Rjdg9#UgY9USs)?uV'TH8&e.k
"!=k3P,h#&6aBEB8qGn!tJLWsE^/t-1m:pS&@/#_;*'i]A??tQJdAhR,O)gJh[.TmrZ)HEB7#
\GQ)6\N+6o[]AD(j`78sLEXuOpD0KBlfDBf[Sm8maunHb8EiMiEG]AAKo<[<71bGJI8PdAgHmc
B;XhX:^)CNH$`*(u6d9:V::2H4<n%qGb4I)s\B=ZQkHSJ<E_sgSo$C333+6MD1J6[@$_!?od
)UQMHZbhjdEi_[[lBG[IjKlXSf;DAthhKsc+0\bIOT"QOo1:JKr)ZWUhT_5!pIYO[1&_e`iE
MB3$X%<V@OBEGD4io_+1R+9*.\^-V\iBkNB7/]Ac.(7)RoE<H`MK90["dt<BIbHmS!1CT$@MB
"V]AkTiFNY5u7l#kb'++U$->cD_.?]AV5D2jK>0ALM(*"PUG,8t0q9u@s-]A);"]A.n7k;H*%A>6
`!Sm&@K:clFEO>Dd"eS+B4u5PNKtaILTa0Ek4""`h2Aj9MC2?7,oCA2EcCH4T0o@h52`WihN
]A?SC^ormWDOK[^9GmqoIsSO5,Z`D3FJK5>oB:DNE\/55K&..\0#dl1=VrMdogm.nA4V&!Y9P
>jAN[<XOYUU<F^:SC?^bn#HBtb*52+FR`-3,fTR8BTM;4_`EAZL/3XUDFRB_$nrP*a2+D*4d
^mV@i`Xqc&EXNi['WKVm-_VTpE^HqSP+jW'1lAs+Js*=DV3%()+Hj\2S:Vp-(Sg-u!tuL7`?
[Yua4KDUF.NIW^q1h#*g.Bk)RH%jOHiRSKgLQ"oQ2AKgH>4Y#"8T"NT[r]A8KmC#)Bm6&]AFt2
hijsGHJY1ZfQPi<T?k%bo$6ZYCoJm;MYg'o[!D5f3;AQ8q+,5oM7PE6m_XFO)\eX%:E%3\_i
UG^=O-cS\^!>qdO+.g/<iNU-KO[`D:+U,pt-iB'c#baToZeF@[)VkF*+Q#r'gLAW]AA_#d8`2
qcm(qX_'C]A-XhDip=GSMO[scWiEk5C<ZC-Q9qNq\?j*)HLq:p;&2sC3A>H!G:YQ0rSmH%#=@
@jl^[KNM;r1r&V;RPTSh%&eKg%?;`qOVt)flfhD@/)M`:>1151uM2jY4m^+H_CAD?E"566H?
m@*DRIk-2u!Vi,H"h3(hBc?qETs#]AJO/tI.?m,4??p\seDUsfT3@R<:I$C:@4QMbo*2p]Ad@_
8lA;.eFbTS(uj]Aol]AT9"+60K=./[rZ!6]AQo1/'[Q.O3@]Ap7_RE_N\L7m.6uC2:aCe^2/\3t6
Nkk^6cR)>;&1LXq=b3_A_F`N['&W:;:h0)qq:cirbW\5\0)8U2<'&32CQIS]AFD@-^kO:+_9R
eXcQ:#>KNd!Vddt8OKoVYI]A"ndn3d!>Ng'"*&ChLB$XBq[M*ejnaeU$R)+1=9R+iido"*rWI
/+n56'k!D#K7h#qYeb@kI@kLjPHD1C7kt:E`tRqb90rT=LS\51XJ[`/ckiR53./(E]A-1<`do
D'@EslP-;-m"QHfc#[c<:SjOp/q0gY9&ocGQKWT*n#9VPc<0pd`<4O#)/IMXf!Xcoj45c/s1
JLM?iV[ucFPf;blPcf"<0@7^ftX8,mb%E"-hQ<57dU/ZT_X)_A`*hr?M;gX@tF*bSSfS[Ra9
qH;MY/^R'8La#ITka#jJBpal6PUj4V.jIBdN4Z8QI-8E*<a4!L`moWaV[1b2c[a4_'BE9`di
>kN3Fk9j#/6U#$q;5fPb>Ss0K40%T\WDd4ZM0E89s/gFM&PtJq^^o^IbgH6^I2[X\+Os^i&d
sIJrYSnY:<KiJ11oRr6gg:S?q@GEXsnWI,V9Oqi&!:XgDKrF;]A<2o^]A3]At8AdAEY.Ub%V6$D
0JZtde=UcE]Am2'?9S6sslOlBbb39/`/lKS/ZpZm/]A@7PZCoG]A'LQkcmX?)P'5(F"Tle"/]Ab+
&Srt*W@$+I,a*f(I-u0b>+\//WB/Y;L8+Ulur<7PQ*V\6=>LhiY./Y=MHo2fBXj1aIe$I:'a
i<oPh5:.A;^.B`%kN(11)h&9Z@V-660qP,PFTX:9J&"-i^MqmOl?F$"E+lp;<lQGl5Z1CEJ&
rjhNjM.k.V?+]ACPAsqg3=m,`-n$YG0d$pK(*(V]AU-8$f,hIX$skMJo+R6C=#glsc,1O^)ae'
<#:f!,oIh);48IP/I_?"9feLa:F)2%EpP9aXsm'5Z,mI>8^&j6GctSWF='pHsSgZ1Lb`4#%\
@4X<\^&cC6&"LSlC?@+;YMKO?$0>2FjP<bhN.!HkQ+&[;`9jfjW*D-KE$,lt<gfff(UZhd&h
,Rp%-tNWN_Q#.cB_2-S#)pf%N([B>*KZmP79Vc%7MdcWCtLVQmM!K&)@;b81J.j'_n[+T`[<
7KS,=1lWLK[O69^AXc*%VqnFrK3(`tj"K.A4b3c.lB(2D<AWY!S_W6\ii>29Fn/2,Sg9[A$l
IQ>HE]Ai">GS"fDkGu19a47Kl+eoCh.Sl063NK98s*<h-]AaP5!25Wi5;pMO/P*1<89jOI*sO,
:'^lk!KA)PpGp;.K'fg+5aM)l='4E*IULEa5EUa[^2<l=h*jJ2RdY-5s?T+>9g)BiCk)j(N0
`Kc"3)[G+fQ??C;>9_e3/#^R;%m%YqhFe(=c.jJ/kg%e%1^*"s,4("o6l]A\//3D#<u3C^Nqf
-N/'@NM]A.5:[6@ljFb/p,60^e69jL8gDNg%:2KnK)$j&Xl:mANA_t;G`3SKg:C!5.gucQ'31
*m!YbNn1aJ14?&5gc>[s=Q+RQG"ij\#)q.B%`O8Mc#)\31b:+R$_N&+=K#DWR.G#WbB3I1>s
JQF%4_C`]AEQ&bBJ!Ebr,Gs]A^l@k'dbZ#tp/Kk]A<l>#sj40D]Ap\nK3,?GY$Q@)`Ku1kNC:&Y3
H=u+?c.I)T-kck8K3-G>CeJBKp[A'+T7%B(`s&JA[cW!XAFOOmFh]AF9sRaKR2\?0-ABICAY8
rgA,2q)s2A\.Y\]A3J$jL_nPHB**-[XD64o)Pfj_re-fbTeB8Bu4+\T0^$u0=-e;U5!MQp\nT
cmX]AEfajiiRl2bKT*#M1tg$=Z&_tWF'd`'ht-j?rd-kZgqV2(F+'YG\tA<&^/'5#Q\a^:KC:
Xh8\]A?"-dOYt]AJGR53Xgj`M[>LYVSoX_UahoRdQ5_Q201+Vq.<=Kg*cU%X%hPN*VaH1H]AeB_
@c*EVXStA_kfYq^TY,3Ke-,a4X66nqU?quIOaA9'GU1$]AD+OU#G-kic[L_q.TYHu'Atc[b6!
sD@1HNF!D5,!"!X19;1nn/"on!fU_[\\m?VX;/9n\f(K8)CAF9[%398J!T`HTUB1;7]ARmdS1
Er:tB=[1jbMNfG#b1E6jp>fS^Kabn:Y@,;kL(/Ngq[??[O1,sNkVJ'^9-`sJTI^Q"><V6JZ;
Lmu%Q"=KLiFd7\c.qm#\lhP`U3TbVL)K;N#"5H/Mh=P_pm:M1-q_3%'L5H_l^/=#Ah(4a#^U
5_FaMqlQukaKaF!D[11SZUA$-_FBtS/s</?5cGF?>*7BU=Up]A[5Y;@+)tdX[MOQm:"S!@TEN
SQ*G:K8tf7<hk>/*2fD<@_RgnOj]A:LkD!6cgq)Rtq3^ko#*6C.T.D*B(b1L4dm3ZlToK]ASJ%
';VQm3C\&Aco[^T]ApqF5T-LZ!!p3SPoA9,M]AkNMVZZk/eo#%_6i$B76H,'F&(H2j<0LrapX[
Hp[t9_5dGCO'.cb+7.ZXJjC-R?4G-)=Jksm[HGB<]AmYp8G@\2A;!nR>3FigM:he0B6N.dFZd
!9@RHF8^)5:]A9o'5+WLK,SNA-87TW(,47m0)e(oLop#''M8(<S547t$'2ANOp\ci]ATV*<OtH
1mX$tCkCuZdqN89eiOJ8@gA8tG/4Gr.RM_'eY&4GWkd]AZ]Abp8@DE\kuJQGQou?>[OG*g=\2S
'.U"lWpW4Yb:U?4H5&bZ#?K%!0BrI>aLZG@R'43d$.XP;AP\e+OI#I0)g*W;_m]A'd8Lega'q
E)JSu#23a6R,?eQR;(Wu)PhG<94gjeiAS]A&O!@G]AOMdM#9trOp&^&3M<CT8Y"8bQ#a\EgVK=
dK:9qUTiSka3Kug@Wf"j,+e2Id(e1ooe@44Qh6U2#WoYd?FmFVQdb.6m0`'q,.PDe&_AkjP?
<LEOX_#s!cmW$Lf_T,1p05M`i;n'g>V*s#lO-]A^\M>Z_>VOTbI)'1X<l!Wq@ICeJMRt\F/$#
W:ickHhA6VpW.>;WnF::CP"Fk]A"&2lhD"aBA=j`"J1L;%6I!mWL&p^hpLc&B<$%ZcZANGOI^
CGFXF.m(]A33uC%854Spq4';7?YYSm#[U-a41BJKo@:.eti77N7[C%KJ7nH$oWY8<Bs,_*1?O
4H;4[Q02c/N:rgO3Rq;!,K\$I)_#2Q&3jfc\F]Ao/+<o^G;U`n*[.9r%HM5DiY"T'/$%-OF%@
r@hMe\cM5^io7S'q_0X;^2K%(An&O9E*DAYLAQ3+)H[Z22S9q^4J?9;NAE@WeU4;'%rr'U^P
:OQFf=4cKl0;>fZh+0K='#7kEgF"\XH*YS>sHi='J3"t*,JHoC34B"K?RGg:1K0a1aCFO"8!
fG:/_D\2)sJE*q.Zh>BSXU-nG`c5e<,1BG4(IgAE(cH5K7iYoFAEMKkJ4lIcc#XbJK56iOX9
2>jiul;sU(T6u`4[r!oHS>E6rbnj[\%V1A85FWG8I%SMobTFUhWr81%rcNul:JZE:Bt&53N[
f+qL@!d:6%6g?*!<Ek(lia$6%>ncN0bdW-sE$i^Q9P"9l5Do4JM&/4EG:@'Ne_-!)/n]A+MMF
b,oQV`HhW)3>dI(SM?=E\<UB/4C??dA`idIHl?`.U:/3aUVZ:>Pin7EGkeFXA67]A&u?UT%MV
ar?qnUcOZNKk-=!bL+=)/4h)<sbN5N0(A'lKhdj#6rl]AFD50B,ZksT(+J8f6Hi5@f5g6?[PV
`_,VLB4!cSqj0ngn5>P$8W"NmL'B9F#C%A8tG5I>IM$=dp-,dpXk0_/[SQ#sSs5UgR!E\p%4
q5(Yl$6?2XF,=-gSt^ll)fL^#ET%)!=CfC)[%2#AaY5Mu9SsDc;$`T+V.BOqqBnMq(=2,@Eq
0:q=K61E4""e2Y)>![?I4i!@dE\;OoS68Q6T1/hVT\_GlPh@k/?dEiS9@5-ACWM]AQQ#*SROi
iA$>(GB-cfH]AE8JuGlh3\LT<$PTZ(B3f,oYaVZlGN=h-9uGLC8@\dinifX1&)H93.YFd_0X+
.:Pe2J%juHEQ$$R'8u.&l'ZHXnRH@`retpF6oGMj5'8-M#>IH,Z;pq<b0`DdoEC@;7Y)3"UB
nG2rLS`(Mei4+V&@c)o%RpkcM2^NuEc?<'Cd]AG@ho45MUcEZ$6Ph#laM\lm(Z9!9AAnq&)u;
[g7[V60kEQW3DQA(6QdB31n@+*HnO9p?gM"H/P(!7CpT:.qEoYgLU,W4n4%llUOk>d="o1C8
\Uqm3qVaN!-K3'?N-'00(?:l`D:!3s"s`,AW+P7Y@jH#YjQ&^KBc88-uNmm;g:2h(#=Md,4'
<HF(+9>iF=a,b[Hc(aUsRKT7P6DMEh34IMl2In2nd1Nr[U[+,!T.5Y6UTq'<LBBOMIf+Lk7D
k+LUdRaB8oC37mZgI)<;1.[6@fr3NF&P689m\:1b?dfc;N8,t_Q^p!T[BS9?YZMR0[%U%<n`
/LPp>A&+E:1]APiau8'KOh/G8-0kncJ"m_+<DK;g9nK^>;lN:W"OlHjI*E<gO3p)cqtmolHpP
<iqop*j\.:]AqIZfH0jqnK#fo"cZGN>7U1jc&u?!n\pj#alr"K[.WZ\0rO.siVK#OVnf6pl9(
$V)6(G;;)"hlakED%rK5)m?=s7?pQ)@P^OZoZl!WM6NNZM(iJ:i`>m?b8W`6Zo&J*$Y58aZ&
jO)XlO,S3#rcaCr;Gu[3;B\!<PS^]AJ(+.O^!lO?S;Wg@M<O_q29Wh_Q#q%&X#g2t$l2`G4ES
F4!YNm'e=br\_!<e^.tagDs&ghn9MekJ57`?EOagtWqH#p>\-StbqDO-toY$8Z-Ur:0>K-#d
%S98m*&Uk*]A*_A25o@PNr4"7poIqQ2AKm58>d#CN7Gn?X,2TdJ\;o%-NL$AUD,.82;5``L%6
<tOWgpt3c7S6`1NHZBY?fdLK`ZukeOp?VN,q!`H72N3R@pd]A)`AfGqY.jB5V-2b"=O__rm)b
(WKm)'_IXB2pO!UnkHHi%s)l'pZQkDc>9%Ia=QBqWZYmpj5$iU[?qEL1Y;1<mhDZ*[TW(%c'
0rE1IdpiYSHif8@nQhF9\I2%up?1:(g15QiI5"B_EqqL)W3iI5!Zr9/23qbA;Au7ElU=N2Em
61j4?ZAY-U#6^3gH_jW.rf!Z+*aFmF0Yr(%rHRg!i+Ws4"F/VAu>AkNcR.C.#0D,4t^X&qe@
;Y1_i8Qp>kbOGHk%)=]AZ2nhMEQMkGIHsKLFc^ZV6#!+P"&iRn)e12<g-i#(D7b60mM`E0Hh^
J]AB=%#>S1KUP;[XmOiqodQ?*cM*XPjDglsrgb2s:6Vq6%A+<k^n9/WAH+A>3h'>.n)o8t0%B
ZJG'`NPb6epB>r*`A0LlLdclQbm[jKYngRB9THWKtWC]A.3*f*S9]A\ip>QdTm<)f'%njWP[>E
Wg<FLE;La/[&CZQ"'Ed[kTdTk%8;[B"/DL3drNl(YgY%3BGtm@-bkEJS0EeaZn*4ik!W~
]]></IM>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="393" width="752" height="192"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="break_rule_A">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-65536"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[break_rule_A]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="1">
<ConditionAttr name="break_rule_B">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-236032"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[break_rule_B]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="2">
<ConditionAttr name="break_rule_C">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-13312"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[break_rule_C]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="3">
<ConditionAttr name="break_rule_D">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-13408513"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[break_rule_D]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="4">
<ConditionAttr name="break_rule_E">
<AttrList>
<Attr class="com.fr.chart.base.AttrBackground">
<AttrBackground>
<Background name="ColorBackground" color="-16722689"/>
<Attr shadow="false"/>
</AttrBackground>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[break_rule_E]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<FRFont name="宋体" style="0" size="72"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="true" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="series_num" valueName="reslut" function="com.fr.data.util.function.SumFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[paiming_break_rule]]></Name>
</TableData>
<CategoryName value="company_name"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="360" y="0" width="392" height="393"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<FRFont name="宋体" style="0" size="72"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="true" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="true"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[paiming]]></Name>
</TableData>
<CategoryName value="company_name"/>
<ChartSummaryColumn name="reslut" function="com.fr.data.util.function.NoneFunction" customName="reslut"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="360" y="0" width="392" height="393"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="3" visible="true"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<NameJavaScriptGroup>
<NameJavaScript name="chart2_c">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="order_break_rule"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=IF($series='特别严重违章', 'break_rule_A', IF($series='严重违章', 'break_rule_B', IF($series='较重违章', 'break_rule_C', IF($series='一般违章', 'break_rule_D', IF($series='违规', 'break_rule_E', '')))))]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2_c" animateType="none"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-16724737"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[security]]></Name>
</TableData>
<CategoryName value="无"/>
<ChartSummaryColumn name="break_rule_A" function="com.fr.data.util.function.SumFunction" customName="特别严重违章"/>
<ChartSummaryColumn name="break_rule_B" function="com.fr.data.util.function.SumFunction" customName="严重违章"/>
<ChartSummaryColumn name="break_rule_C" function="com.fr.data.util.function.SumFunction" customName="较重违章"/>
<ChartSummaryColumn name="break_rule_D" function="com.fr.data.util.function.SumFunction" customName="一般违章"/>
<ChartSummaryColumn name="break_rule_E" function="com.fr.data.util.function.SumFunction" customName="违规"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="393"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="function(){ return this.value+this.percentage;}" useHtml="true" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="3" visible="true"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-65536"/>
<OColor colvalue="-236032"/>
<OColor colvalue="-13312"/>
<OColor colvalue="-13400848"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[security]]></Name>
</TableData>
<CategoryName value="无"/>
<ChartSummaryColumn name="hidden_danger_A" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_A"/>
<ChartSummaryColumn name="hidden_danger_B" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_B"/>
<ChartSummaryColumn name="hidden_danger_C" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_C"/>
<ChartSummaryColumn name="hidden_danger_D" function="com.fr.data.util.function.NoneFunction" customName="hidden_danger_D"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="393"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="chart0_c"/>
<Widget widgetName="chart2_c"/>
<Widget widgetName="report0_c"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="752" height="585"/>
<ResolutionScalingAttr percent="0.9"/>
<tabFitAttr index="1" tabNameIndex="1">
<initial>
<Background name="ColorBackground" color="-1970182"/>
</initial>
<isCustomStyle isCustomStyle="true"/>
</tabFitAttr>
</Widget>
<carouselAttr isCarousel="false" carouselInterval="1.8"/>
</Center>
</InnerWidget>
<BoundsAttr x="550" y="0" width="677" height="567"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="chart1"/>
<Widget widgetName="tablayout0"/>
</MobileWidgetList>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1366" absoluteResolutionScaleH="768"/>
<AppRelayout appRelayout="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1364" height="630"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="body"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="1364" height="630"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="1"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="0"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="7a9c07c3-7e33-4be9-bc5b-cc8f364eb817"/>
</TemplateIdAttMark>
</Form>
