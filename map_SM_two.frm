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
<BoundsAttr x="0" y="0" width="374" height="225"/>
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
<BoundsAttr x="0" y="360" width="374" height="225"/>
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
<BoundsAttr x="374" y="0" width="378" height="225"/>
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
<BoundsAttr x="374" y="360" width="378" height="225"/>
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
<![CDATA[952500,990600,609600,990600,723900,1104900,1143000,723900,723900,723900,723900]]></RowHeight>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<Border/>
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
<![CDATA[952500,990600,609600,990600,723900,1104900,1143000,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[5334000,647700,4610100,1828800,4953000,1828800,5257800,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O>
<![CDATA[总违章数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<![CDATA[当月新增违章数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<![CDATA[当月处理违章数量：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="demo_hidden_danger" columnName="1"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<CNUMBER>
<![CDATA[0]]></CNUMBER>
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
<Border/>
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
<BoundsAttr x="0" y="0" width="752" height="190"/>
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
<WidgetName name="chart0_c_c_c"/>
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
<WidgetName name="chart0_c_c_c"/>
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
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0_c"/>
<Widget widgetName="chart2_c"/>
<Widget widgetName="chart0_c"/>
<Widget widgetName="chart0_c_c_c"/>
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
