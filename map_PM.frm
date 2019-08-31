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
<![CDATA[select  concat(alarm_time, (select company_name from base_info where company_num = a1.company_num), sys_name, transducer_name) AS alarm_com, company_num from alarm_data a1 where company_num = ${company_num} or ${company_num}=10]]></Query>
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
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[setTimeout(function(){  
    $("div[widgetname=REPORT0]A").find("#frozen-north")[0]A.style.overflow="hidden";  
    $("div[widgetname=REPORT0]A").find("#frozen-center")[0]A.style.overflow="hidden";  
    },100);  
    //隐藏报表块report0的滚动条  
window.flag=true;  
setTimeout(function(){     
$("#frozen-center").mouseover(function()    
{    
  window.flag=false;    
  })  
  //鼠标悬停，滚动停止  
$("#frozen-center").mouseleave(function()    
{    
  window.flag=true;    
  })    
  //鼠标离开，继续滚动  
var old=-1;     
var interval=setInterval(function()    
{  
if(window.flag){  
   currentpos=$("#frozen-center")[0]A.scrollTop;    
   if (currentpos==old){  
    $("#frozen-center")[0]A.scrollTop=0;  
     }    
   else {    
      old=currentpos;    
      $("#frozen-center")[0]A.scrollTop=currentpos+1.5;    
        }    
      }  
    },100);  
    //以25ms的速度每次滚动3.5PX  
},1000) ]]></Content>
</JavaScript>
</Listener>
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
<border style="5" color="-1446671" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"  \" + if(len($company_num) = 0 || $company_num = \"山西省\" || $company_num = 10, \"晋能集团有限公司简介\", MAP($company_num, \'base_info\', 3, 2) + \"简介\")]]></O>
<FRFont name="微软雅黑" style="1" size="96"/>
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
<![CDATA[0,190500,0,2160000,190500,1440000,1152000,1152000,1152000,1152000,0,0,0,0,2160000,2160000,2160000,2160000,2160000,2160000,2160000,0,0,0,0,0,0,0,0,0,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3600000,3600000,3600000,3600000,3600000,3600000,3600000,3600000,0,0,0,0,0,0,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="8" s="0">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="  " + if(len($company_num) = 0 || $company_num = "山西省" || $company_num = 10, "晋能集团简介", MAP($company_num, 'base_info', 3, 2) + "简介")]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="2">
<O t="DSColumn">
<Attributes dsName="num_mines_of_company" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_open_mine" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_open_mine" columnName="SUM(capacity)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_joint_commissioning" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_joint_commissioning" columnName="SUM(capacity)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_Infrastructure_mine" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_Infrastructure_mine" columnName="SUM(capacity)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_suspension_construction" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_suspension_construction" columnName="SUM(capacity)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_close" columnName="COUNT(company_name)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2">
<O t="DSColumn">
<Attributes dsName="num_capacity_of_close" columnName="SUM(capacity)"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" cs="8" s="1">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=IF($company_num > 9999, "", ("       " + MAP($company_num, 'base_info', 3, 2) + "现有矿井" + A3 + "座" + IF(B3 = 0, "", ("；生产矿井" + B3 + "座，核定产能" + C3 + "万吨")) + IF(D3 = 0, "", ("；联合试运转矿井" + D3 + "座，核定产能" + E3 + "万吨")) + IF(F3 = 0, "", ("；基建矿井" + F3 + "座，核定产能" + G3 + "万吨")) + IF(H3 = 0, "", ("；停缓建矿井" + H3 + "座，核定产能" + M3 + "万吨")) + IF(N3 = 0, "", ("；关闭退出矿井" + N3 + "座，核定产能" + O3 + "万吨")) + "。"))]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="5" cs="4" s="0">
<O>
<![CDATA[  主要生产数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="5" s="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="5" r="5" cs="3" s="0">
<O>
<![CDATA[    值班带班信息]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="6" s="2">
<O>
<![CDATA[名称]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="6" s="2">
<O>
<![CDATA[日累计]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="6" s="2">
<O>
<![CDATA[月累计]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="6" s="3">
<O>
<![CDATA[年累计]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="6" s="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="5" r="6" cs="3" s="5">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="      值班长:" + J8 + IF(LEN(J9) = 0, "", "(" + J9 + ")") + IF(LEN(J10) = 0, "", "[" + J10 + "]A")]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="6">
<O>
<![CDATA[值班信息]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="6" s="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="6">
<O>
<![CDATA[带班信息]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="7" s="2">
<O>
<![CDATA[    产量（吨）]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="7" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="day_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="7" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="7" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="year_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="7" s="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="5" r="7" cs="3" s="5">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="      副值班长:" + K8]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="7" s="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="7">
<O t="DSColumn">
<Attributes dsName="duty" columnName="shift_foreman"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="10" r="7" s="4">
<O t="DSColumn">
<Attributes dsName="duty" columnName="shift_foreman_2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="11" r="7">
<O t="DSColumn">
<Attributes dsName="duty" columnName="night"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="12" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="8" s="2">
<O>
<![CDATA[    销量（吨）]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="8" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="day_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="8" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="8" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="year_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="8" s="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="5" r="8" cs="3" s="5">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="      值班成员:" + K9]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="8" s="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="8">
<O t="DSColumn">
<Attributes dsName="duty" columnName="post"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="10" r="8" s="4">
<O t="DSColumn">
<Attributes dsName="duty" columnName="duty_officer"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="11" r="8">
<O t="DSColumn">
<Attributes dsName="duty" columnName="morning"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="12" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="9" s="2">
<O>
<![CDATA[    进尺（米）]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="9" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="day_coal_footage"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="9" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="month_coal_footage"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="9" s="4">
<O t="DSColumn">
<Attributes dsName="list_data" columnName="year_coal_footage"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="9" s="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="5" r="9" cs="3" s="5">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=IF(LEN(L8) = 0, "", "      带班领导：夜班：" + L8 + "；早班：" + L9 + ";中班：" + L10)]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="9">
<O t="DSColumn">
<Attributes dsName="duty" columnName="tel"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="10" r="9">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=IF(LEN(L8) = "", "", "夜班：" + L8 + "；,早班：" + L9 + ";,中班：" + L10)]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="9">
<O t="DSColumn">
<Attributes dsName="duty" columnName="afternoon"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="12" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="10" s="6">
<O>
<![CDATA[公司名称]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="10" s="6">
<O>
<![CDATA[产量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="2" r="10" s="6">
<O>
<![CDATA[销量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="10" s="6">
<O>
<![CDATA[进尺]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="4" r="10" s="4">
<O>
<![CDATA[时间]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="11">
<O t="DSColumn">
<Attributes dsName="data_for_the_same_period" columnName="company_num"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[='同期']]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="1" r="11">
<O t="DSColumn">
<Attributes dsName="data_for_the_same_period" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="2" r="11">
<O t="DSColumn">
<Attributes dsName="data_for_the_same_period" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="3" r="11">
<O t="DSColumn">
<Attributes dsName="data_for_the_same_period" columnName="month_coal_footage"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="4" r="11">
<O t="DSColumn">
<Attributes dsName="data_for_the_same_period" columnName="date"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[MONTH(date)+"月"]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="8" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="12">
<O t="DSColumn">
<Attributes dsName="now_data" columnName="company_num"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[='当年']]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="1" r="12">
<O t="DSColumn">
<Attributes dsName="now_data" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="2" r="12">
<O t="DSColumn">
<Attributes dsName="now_data" columnName="month_sales"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="3" r="12">
<O t="DSColumn">
<Attributes dsName="now_data" columnName="month_coal_footage"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="4" r="12">
<O t="DSColumn">
<Attributes dsName="now_data" columnName="date"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[MONTH(date)+"月"]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="8" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="14" cs="8" rs="7" s="7">
<O t="CC">
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="true" changeType="carousel" timeInterval="15" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
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
<Background name="ColorBackground" color="-2953990"/>
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
<![CDATA[产量与上年同期对比（单位:万吨）]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.line.VanChartLinePlot">
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
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="5" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="SquareFilledMarker" radius="4.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="1" isCustom="false"/>
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
<![CDATA[#,##0.00]]></Format>
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
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#,##0.00]]></Format>
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
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="微软雅黑" style="0" size="96" foreground="-10066330"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="经典"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
</Plot>
<ChartDefinition>
<NormalReportDataDefinition>
<Series>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A12]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=B12]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A13]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=B13]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
</Series>
<Category>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=E12:E13]]></Attributes>
</O>
</Category>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="true" isDiscardNullSeries="false"/>
</NormalReportDataDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
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
<Chart name="图表2" chartClass="com.fr.plugin.chart.vanchart.VanChart">
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
<Background name="ColorBackground" color="-2953990"/>
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
<![CDATA[销量与去年同期对比(单位:万吨)]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
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
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="6" isCustom="false"/>
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
<![CDATA[#,##0.00]]></Format>
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
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#,##0.00]]></Format>
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
<Attr position="4" visible="true"/>
<FRFont name="微软雅黑" style="0" size="96" foreground="-10066330"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="经典"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
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
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
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
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
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
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
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
<NormalReportDataDefinition>
<Series>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A12]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=C12]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A13]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=C13]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
</Series>
<Category>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=E12:E13]]></Attributes>
</O>
</Category>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
</NormalReportDataDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
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
<Chart name="图表3" chartClass="com.fr.plugin.chart.vanchart.VanChart">
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
<Background name="ColorBackground" color="-2953990"/>
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
<![CDATA[进尺与上年同期对比(单位:米)]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
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
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="6" isCustom="false"/>
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
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<Attr position="4" visible="true"/>
<FRFont name="微软雅黑" style="0" size="96" foreground="-10066330"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="经典"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
<OColor colvalue="-570035"/>
<OColor colvalue="-14395996"/>
<OColor colvalue="-12470356"/>
<OColor colvalue="-16765869"/>
<OColor colvalue="-23280"/>
<OColor colvalue="-15956794"/>
<OColor colvalue="-17050"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
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
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
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
</XAxisList>
<YAxisList>
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
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="true"/>
</Plot>
<ChartDefinition>
<NormalReportDataDefinition>
<Series>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A12]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=D12]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
<SeriesDefinition>
<SeriesName>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=A13]]></Attributes>
</O>
</SeriesName>
<SeriesValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=D13]]></Attributes>
</O>
</SeriesValue>
</SeriesDefinition>
</Series>
<Category>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=E12:E13]]></Attributes>
</O>
</Category>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
</NormalReportDataDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
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
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsDefault="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="14" s="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="8" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="9" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="10" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="11" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="12" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="13" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="14" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="21" cs="8" s="8">
<O>
<![CDATA[煤矿生产基本信息]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="22" s="9">
<O>
<![CDATA[煤矿类型:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="1" r="22" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="type_of_coal_mines"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="22" s="9">
<O>
<![CDATA[水文地址条件:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="22" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="hydrological_address_conditions"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="22" s="9">
<O>
<![CDATA[煤矿矿长:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="22" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="coal_miner"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="22" s="9">
<O>
<![CDATA[总工程师:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="22" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="chief_engineer"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="23" s="9">
<O>
<![CDATA[煤矿属地:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="1" r="23" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="coal_mining_area"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="23" s="9">
<O>
<![CDATA[提升方式:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="23" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="lifting_method"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="23" s="9">
<O>
<![CDATA[生产矿长:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="23" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="production_miner"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="23" s="9">
<O>
<![CDATA[通风队长:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="23" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="ventilation_captain"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="24" s="9">
<O>
<![CDATA[核定产能:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="1" r="24" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="capacity"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="24" s="9">
<O>
<![CDATA[安全生产标准等级:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="24" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="safety_level"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="24" s="9">
<O>
<![CDATA[安全矿长:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="24" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="safety_miner"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="24" s="9">
<O>
<![CDATA[员工人数:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="24" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="employees_num"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="25" s="9">
<O>
<![CDATA[瓦斯等级:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="1" r="25" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="gas_grade"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="gas_grade_num" viName="gas_grade"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[gas_grade]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand/>
</C>
<C c="2" r="25" s="9">
<O>
<![CDATA[重点关注类型：]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="25" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="high_risk_types"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="high_risk_types_num" viName="high_risk_types"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[high_risk_types]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0"/>
</C>
<C c="4" r="25" s="9">
<O>
<![CDATA[机电矿长:]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="25" s="10">
<O t="DSColumn">
<Attributes dsName="base_info" columnName="electromechanical_miner"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="25" s="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="25" s="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[矿点显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$company_num > 9999]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="26" cs="8" s="8">
<O>
<![CDATA[所属矿点]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="27" cs="3" rs="2" s="11">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[生产矿井]]></text>
</RichChar>
<RichChar styleIndex="13">
<text>
<![CDATA[█]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="27" cs="4" s="14">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[建设矿井]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="27" rs="2" s="15">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[关闭退出]]></text>
</RichChar>
<RichChar styleIndex="16">
<text>
<![CDATA[█]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="28" s="17">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[联合试运转]]></text>
</RichChar>
<RichChar styleIndex="18">
<text>
<![CDATA[█]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="28" s="17">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[基建]]></text>
</RichChar>
<RichChar styleIndex="19">
<text>
<![CDATA[█]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="28" cs="2" s="17">
<O t="RichText">
<RichText>
<RichChar styleIndex="12">
<text>
<![CDATA[停缓建]]></text>
</RichChar>
<RichChar styleIndex="20">
<text>
<![CDATA[█]]></text>
</RichChar>
</RichText>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsHTML="true"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="29" s="21">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<SelectCount count="8"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="29" s="21">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<SelectCount type="5" serial="9-16"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="29" s="21">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<SelectCount type="5" serial="17-24"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="29" s="22">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="29" s="22">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[0]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="29" s="22">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[3]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<SelectCount type="3"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="29" s="22">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[3]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<SelectCount type="4"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="29" s="23">
<O t="DSColumn">
<Attributes dsName="sub_company" columnName="company_num"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[operational_status]]></CNAME>
<Compare op="0">
<O>
<![CDATA[4]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="链接矿点信息">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
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
<NameJavaScript name="alarm">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="company_num"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[重点关注矿井]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="12">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("high_risk", 1)]]></Attributes>
</O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.FRFontHighlightAction">
<FRFont name="微软雅黑" style="1" size="80" foreground="-6737050"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="company_num" viName="company_abbreviation"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[base_info_map]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
</Present>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[市公司显示]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[AND($company_num > 999, $company_num <= 9999)]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction">
<RowHeight i="1152000"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
<WorkSheetAttr/>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1" paddingLeft="6">
<FRFont name="Microsoft YaHei" style="1" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
<Right style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#,##0]]></Format>
<FRFont name="微软雅黑" style="1" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#,##0]]></Format>
<FRFont name="微软雅黑" style="0" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#,##0]]></Format>
<FRFont name="微软雅黑" style="1" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-4144960"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="2" imageLayout="1" paddingLeft="0" paddingRight="0">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
<Right style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="2" imageLayout="1" paddingLeft="16">
<FRFont name="Microsoft YaHei" style="1" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
<Right style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="4" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80" foreground="-14145496"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-4144960"/>
<Right style="1" color="-4144960"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="宋体" style="1" size="96" foreground="-13395610"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-4144960"/>
<Left style="1" color="-4144960"/>
<Right color="-4144960"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="宋体" style="1" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-4144960"/>
<Bottom style="1" color="-4144960"/>
<Left style="1" color="-4144960"/>
<Right style="1" color="-4144960"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="宋体" style="1" size="96" foreground="-256"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="宋体" style="1" size="96" foreground="-16777088"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="宋体" style="1" size="96" foreground="-65536"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-4144960"/>
<Right style="1" color="-4144960"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-1446671"/>
<Bottom style="1" color="-1446671"/>
<Left style="1" color="-1446671"/>
<Right style="1" color="-1446671"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[be&'u;d7lCCIJg9"f3]A)8FJEX";F:\8FI\7-4#_PMM2N@V*jHH>3I8sE26)48.?jVV'L/Y7R
5l9cZ@D/4Qh([)#(`$(uN%,X>.fQHd0+`RWHa2S9kqKiqX81CJ<@*SNB?@p@OL@\T8PfkK[A
k\4T6eAZ:7IjP79cEj\D0]A&%.:/JPf:#%iO&0qp\*'^9EMUt*-ML:SV"0tu]AfNK"D#Q2=>%n
XlVo50:Kb"?ad4i>,FF]AjjZ[8pKNB;`lH*mQL.4gK^1@_[kW-ah@MS;=O;!P2+U[f7]AjB;j;
\WUj)lZ>\l<3f!M_m[+Z4@Ot!/MoZIPn^t%o:9!1r49jX0SYfK9.d^d?D';6@9J?O%qpPN=!
K+;>(;o+[fljrGN[p]A*8KZ0LV$8oEnO&)]A\F7NKl7kcc*f=;&uBrHtF$fQr(@0Q"!p'Et7,0
Y90I]Af:UDg17@`n&oF:rn%/3ls-$B:p4+^F#tS21"cT6e<ILOc2S7d,kPR80n/]AKPbbTV]A@^
3f!C2r'YqI*C;[agPHiB;#]A3snkPeDTa6>>&^E4'm,f>na)S./)!A31.n'uEhKuZ.@%)D[^E
Rs+L\0NK>4J^oDLaQ\PQ\jSQ[Wjbg!mi.>OX\0tZr&[B,JRU8V77n:l&O:Cfr9VZB]AAbG;r(
r$rQpIhkoFeXRVK/]ARFs)Mb3[Gg;ENsZIMR6jN**!iP;L?]A>LSF`3dCjAS4PC!8ghl1VXmnW
[j1r/P*=+Sq:X1M[8=6GR(W:>g)a;QUXT#53M=`diNs=k'[S=N`TLss5fqSuM%-5d72<FKQ4
4PbEKqnGo_$%L;+@Kb1;&F!NQU.1R>&_lZ+_kp.%hCQqs(:`5IsRO)Sg9rL&(qCk^"#-8O(T
DNNO=Pkbi5=B$u+7f?2"CfMHet$MOG33WD$IVt'b3hGi3bS\rpn4LPrKeiH0m?$R9J`@n",;
.mc3Nru";4"a((qR!RdQXQDe.6["opX<UEmL5ALdMk>gAm]AMDf$3*e'E6RJVd$l97^7KNmj`
;dKtRG+!T!QbUtPr0b&J&:VDM.o^8stV$pMjRAfVEJ%,\CnnQjUp"nm6jGT*E%OX;O'Hp=n"
5XS_O"3m_2]A]A(4CXUNJb-."j2`H10R7C0V[oH"A%fV4ogX8d--d[h4[^t[uLT5j-uEIc`blk
,@3k_AY.[NM$D3m_uM('1V]AEp59bU&/[op\TgI(tiXC>[u#NbZ5Jo)gLRRa"VA]A2ugGj;6'X
qM>AhI1jF9m\*N5_V/+E=R@LEISl"#l^OP4hPYRueHjnbn(@l_t\ATRGbGmhc5\?De/43S*S
<dK5<QXa#<69+JQf,D5aRC_[p'8,^5Z;i+Bsc;&cfp;Q&kkWHRj!$jfRg5gSCcOpi"M$Jn,B
plcc35njU#IZO`Fl\>7`Q[WulT,&j/YoTm]A7r\ddEaYn,St/tDT<kq+).VB*:lpWjdri]A/ec
cc3R*!]A0@iS%6b8XHEIs20YFU+G@2F<9F?t!^Y&KU+"-k,qf4AQ\(?;glT<Dc/7*cU&6?^F>
iMeng>^2^smd>^J`oiqM):C=:X[0+/nk%L>13'-N*:#mRWPA!D+?Lp/1Y+S;kDP:2/D3#cPj
%+e!>"Z<1[N?1=c3qIUm`5B%O%mjb@J_4/%/U`\S#`,0W]AfimS)5<NgUlj`spgeh')OsS=+G
epck<Y'Te9Xt@T@@e9bps\c:+$/(eb&aUUms#W=3uW/W+s7b5PkN21lad#AWM_Z#!+J"+J/t
0=aQP$GPAf:GF*n>7GEX^7KG'e*E@tsM'WGWqPg@5@,7V2cRd3`mVGZ(Y>_(NZ\$YI?M#^^W
R+GUUEI%C\V,fA]A^:ZT$7@:/-*lfF45*(\Sa7FT:kmI+E_nVl4MO?C0b;c4\*V]AK*P@\>68Z
*i\\</?CLn'kYp^YfoIdqU+1-TG$<B3Gp9@?MR(Eaae8+sIL.)1O,8CRt`5"JfJJI/XVR%(R
Opt+Pp^?_a=("Z(d`k@>'[XG<K\"P47WF,.;1F[e,)4WM+hS*tG+VTlHN'`Ek%2PSFqJs,+9
6OUikSg*`TtX'A"47V^KG:i^0QpsT]A\^5KBq*#\acBFLnu8)glp"=,hB11eE+&]AZk5-b6=[Z
>/ls=c"@C*#9\,>'UQkOC^1/jVWTMt#-kk(q6i*tO_d[ceU*Eq3iE0;M./2+Rgqn4C1)4mDC
4E%(R<8%Ss)?\-;*!CKob%7DT9rkc2K%FduSa#eKfS<;(Ia>`&g5UN#[+2@4G]A\_dIT;F-c6
E+*<]A@Dg6&YA`4t8?`OSg(k@!@(2\(XD1>4O(6.f?FLeZ!^>S%2_2`JZ:Q"aFcscE*h1Y''W
eHe$+UiZ-Vr(UIMQa1!>Wb:o0k<*/LpRrEZ:kgOgF$l_jmq3W>F3"=&,4_`-Z[`Xdj0Lo_&q
mEmV,C`r==:HaldPSF9$6X;r[6-I@YpE:^VKZFOG@79BIQ0ir#b#euCj%ZhW:!CH+&I&N@G6
76hX*JMN.$a+RGc'S6i)CG'I)BL^-4X3gkUq.4O7BGS%B,F11)OQ%=KZGXlE,399Acoc_h`B
c3Q'p6+V2'5Of8O9il\UQ25gbk)Xq,BjDluGKoq(aC]AE2'1!W#k/L-,FaA-YpeNi26IFAd^:
W?l)&Q3^aVMWonf0h,iE3d"r=LK10$oFb'a,hD0Ml!n<FgMN;I.!G)kRJ@MC?'kh"L.;S$b^
'bY0V_V;K9kNMql`H5j,C*oi^s:7PRt#t$:2rj$r;R9/N35=LHB)cf$*MV:Q!=>?:E[JmDpW
]A-SI+'t,XrJFb\Lk^KW]AtV*j[s60#Y@4@q%mW$sC[#)02hQ-D5J&)3@'`#<AjJ[mM;;*BVnG
$+gVeo]A/0Mkl*@&]Ac\Glu@.^I$u=ESFdID*QH3*-`Sr@]ADY&F?2UB>t?EKnH^G''6uSj=cSd
g44Y.\]AsHR>sS&A.i=]AfYZO]APbLd<9S(mTZP,XU2W#QdXipUWbd!)\sJU?u4;6#<^e2AqlBo
4tU+GH-/H"YBj;G>KppDE_P\Ze3KFhp>WXaq-IUn+IiQZkfkX.f(EAu2KGm1jj-hPjkPlV7J
jMQsmsCpZHe#KQO%p(kAjBmjFO:4hE7DiRO(WmE&>!Gk9lqk&>?PRObLb3ri85E%s/WK%URO
tPE^bk9`2au%XHM&mFK0IU/A=;QN%3q$3t:Tk1s-na]Ao*eBNK?9[_!_Et?Q1^,Z")A.TO58]A
S^.1is01TN5d<l?\/$'*b,oUZuVVshM-N@oO;js>Qk/fc6lQ$ZC^6Of$aWcO7bU$H6GI?!#*
m9!Z%?0<F(CjGPJZ2<[E;71kG.u??2Yr7,ldOL#3jG5auA)KH/UTUn^E\$kE.9I7.&E]A\-dC
fR3T8;*2^iPH'!/GoEC+#c@)`,UUmgB%p"@3Bg,_Jcl_cAS$-:4&MH#$D`n]AH:Q`Kb0(/SG>
h`I9Z^h?#Co&k#ogN*peUQVBd#?UODW)SNdb*ft&4*afAdE!NU%hAli7E&.g)Y`rE^eUS);V
"qWFL#/g#5*mc705\HA2rKRi,[ch>q7'36,lJs`!GF=:ZNYH?YZrWkdMS?\*([1e"*r$?NKg
NEq6f&[/^NmHoUTr``fHmGe.?S;0.mdJ*$J,AdYn+Dd,u(RZad+MV>`:u*-@?W$!r`IKeVXk
VSFGUj_SedM'g52SA)QdDkG0O@W6$-c%grK?(:o!8R"piL;.FCWX$N^c+E:c;RB+t;"ZP:Z%
0**?/<uR$"_H\X)UF\fRi3Z8#?p8(r^-O;l/,J8Y^W4Cr54KY)A_TNpQ=p'mCdHW1)s(1)R7
e<^srlS:sdWfu=i`m<JUk&@cT-rCa80@]Ac?^[.:cHUS7rCgpsDl*"ebCQ%$Tk/c?89g-]A@q^
a*rR'Q7oR[#qFfSrR48P2V^M$W72?-j&$;1^"g()WYMLB[t=U)lPL9ii<f":kgd9ke8IWZX#
f<lCQg33(7'$X/SA3b&d+s;E20h2Q%PE\CO$--"c,^ESPmB[foCS1n#N?kQb.nb1MA<%Q!/#
l9=W17ISR+,Nubr0mm;_P'EfiOT%/%[=9%9I,KeUn[?cM/a2HO%bQ`tejlEUe$.IBr/BKCP#
nm/;UnRnm4#bWqp.qBK#=Lpc2'6/Uolr;_Ad/R)mi"kp[X3mrOZ9nEXHhpV21/r07qYPUYr(
b3<L"G#$XQ@,B8bB<O=>;U2.&4,G=4dC27`9'ibdQL8Q-lZ6**glS`)d_/-qEbe3T?LrGcfJ
R_5N?ZuZaP6AJV"R%=.0<o&.-U\`d19*70ZCN+mD>57+*\%T?p]A9WXTHk.E9%ou5SFlV;ioN
Ms-dm:E8),$M`f@G%]A`%&qIUMG5P=TW$2`-YkZsHa%q.d%Ye/+\^.J@!2ais^JJ&4tK%6PNh
rGV9&arQ05N4ns)1<$G"JqX6?n$i^'c39`g5]A)!V3tIgt5.)0dKs[bLE^,lZ@tU73(70<O"<
j'iI5CmW`/tF#m7iQ:$nhRk9;f7V0]Aa^NF>=h?Bm02i0fOfQ3fV5cd<p&PmHk_!aWddK1(U9
.qgnYV1!Q>6>_Io.MC`=?)^RaBl4Ndo=qcJJ%qT8Na??$$A#gb-a]AjH#Plogn(X6^Xemo64d
[g_\/a%_PljB&V$WKrl`QkK#o_\(qN:EET*_@B[_mUm/rTj$S`<2h:O`8oi&(E+Nd'RdWCi=
(U^t^\oVY/@1f9NYl<!r"=g!JT)=KY;&j4"[jg@rd%5IUl&gcC>@8p1_>qm'6]A^KpHo1>!B`
Wufp6X:D)Dqa[iN@i#9gRa7%GjECI7pLdCP.#j@rQoKt;pm^R0-%OI9nnXIf6hO2_GI)&]A2d
$66ZmY3XX3G%$VWY,)Mku:DZt(5f`'VFj9O(q[Xp!Z0U?ONZ+aU/nc71hQ#M5c[S*,t*@'m!
T2!S"olFUSPS!dd;BXjA#(bOK$#UF`'-)Q*1^P0\_=9WF'=n"M6_tbfg!b1HVS&q@,,H3F#Q
`GMMTIW#>HM7ffEf7%ZiO(.V_*O_]A3D;ZW0>o"TY::^PPKJh'q-I&LXHp_>d$>X7>+&]AhrFn
;qGC1?J"'*q0Es*4U)?F6VRU^>`-I)I!C9S^\`e-0ns+[HXUVPCb.F7)DP5K@5FtQ74^(0\A
<0M4D=5134&#8/2mp%\W12Xg8q#ZjSo0hsBdPR9)n$WU,Lk.(4J63D$lTD_!,e/`e8jM]AdVs
\17BG$>E)@'b`e=XK`ReOgG<Mlf>=IbO<1R92>`q#8QcSA*+pe+p=Eg6lNL%c43R8G86*h,m
S31YAlC@T;`1126nSBJ%P"sqsTmQV&$^(ZAOI;3_.HhUJ"oh+&m?ZWmS!1-.o-H_*F9>'t#J
[@rMN\.pA/bn%j=&\ttSdX34Y56q`^"Rk6oT$[_hM?rNjqonRWj5Etm2G6=NP3m>BhUk[J?R
(;8Ye>FJP)1+leI['3TW&F"X+\*c4:_\>mpRB1b7_Lh#>5(Ct^)`/dgMrl?aS%ZE&E?o`QtN
^as@VCAcQY+Zis=:u,D$\O@^go%MoC-^]A%Eg1W=L+1a-o(,=cIUkq.(E;asM!k0B\ILRle.P
$-n.OXp9hFU^%?_QP5eD;0LD3dWCRr'm[]A=qt,ZnK7KP-mhe/?U)8/a.SS!$sG1\psk2O$<S
_5HfNtR[dOTkkR0JN)i9sl-"FZXTYsHZf;oET?!3iT7F^#1D$*,7?E7*^ifd#^d`t`b'P'!P
s7REr6'Nl8<[bI1AT;Z?M!ue_hC>K9gWJWm)]A`2RFj%=MM"=a5%/1(l+?Dk,+#cu*R23NNuu
!8l9c7%0'S?Y2-M_0YU4)uAfq-!EB'.1bJh@8f#_:Fgbth]AJMV`Zc>4]A*=1HPO.ela!EME+r
g4muq/76T%Da-o\@4uA)"\O@tO'?d8-M+8X]AhI,F51Y""')ga\]AoUdi"UYVdA6U!F'Zqm7>b
'^'\]AFTogO7b(;oY@Kic;rF."5m3XLh9J`Fi<#'Jf6[EV78;dDWtpjg;Dkp;L+*4f3=m*>dh
\']Aq2b6M,:1X3J[YS"9r-OM1#LGJ^XU9m-LC]A.CQHi0D,*[<qQ$ZMJ-f__2cX%K'JMj't<XC
soRN,1Z54&.$-o_ut(p]A(rsl]A2E2k\2C>KfsHH!NBP0L8FS3hq'd?"CDog?-neM)$i/d`mGJ
LJN10VMrkWX<h1\N>ZP!kjj*7Z\e4ctmU(6OUVClV#qk+5p.dF:"rM_(*(<2H<_D5C&!*Db#
30YpuiqL+]A")a*dIb.8\C@P"9_ZnX;GkC9)LX!Sa]AU^8u>d@U3jJj%bMY-/e3kAp`i^/`c`Q
0XRXlZ1tlfC_bq_am%7bneB`HUGB9-ns8pjf1DI$YG)?a,$eC-'rlJgJs18q$C,G"s'[2O'X
%X!9?p#Z8>g9?UhnZ<)q#,\@Fh-5LQX)8S&c,Ma+=ED=R%(TsuZ.H4Vef[$>&2$6T42f:AVS
=m\N>WQ<_.N5a;gii("(Jqli%2.qjdjY[X_q`;e2puj3M835Z'#e.'g#NS(-b3/GIDZkI-]A%
$m=HD7f_?o@<nteLHf*7rk,EQ[9"AV%BqVqsl'02@Z/s04a-K`k0qR8+$*W6lJ7h0GC]A2Ym5
\e4V+3sN%XQ=9gsf)WZh.t=*%T*F1sIp4dt3hA19(Rt-=cXR,LY/8A!6/FQAE,2[rfc0`mm&
2gs096/'LllJalD$QNe*Ue9Uu99R0[aRbmFm0:%Q>JD"Gm/bKs'onRIS>Z,E$Ra+DqujOcGN
#UV4#`NUKUP_+2Q*OZp(A8Xc4dKT]AVW%;gsbC0B5\'m7&`A(TG,:hrSS.snT6SPFs/>%;%C&
!X?(r['%TMp%e+3/rRB5FuWM.;:Bf>c=Yu8qmj&_dhLdZAS`AC=eO0H,^7GHenAKL79ct]A)+
L;6TGOY:FdSAp'l<)YM%X;8C>qm<()H8-0%#C3p/^dUB%KpNYrG*"U)6JMoSR]AJ9Tdm[0`o4
aCX8TDc[4%%N6]At.qRG;c['`,kHFWZV#8j_5;qUR-RD)q\>6KpcbX$#H,L2kl3aUKfJmVhCJ
*]Ap#iIiGi+$V;S#j2K=ja*&q<.*kV`fd'Q;+7!122`"*a-Ii32H.Ebn*'54?mVNYW*o2b1M!
)M99.PE4Pa8L[:9jN*@sZqSX_f\tt`tK?;'rKe*C@!16hpX0,:a7;K/D\N6I8VbE,&*uqDYh
a/&:=>Zq0($KNi6m>PTPR3Rq7E.'a5#LCl8b+LCpWXuKAl-uoAV(ei#"J`\EB6mS%+pK\l4B
!?!biltnft0dEO^l,ampJMO+L,75f1A@mJC]APA@qh_hoC%,iWZX]AV)!q4Fi.oe&`Jm6"Cg5/
"5pq58KPZ"!Z9<BZjI<W+>H]AVM^BoQU8UK_>9;oRHe-.4Z['J'/.>']Arj,Cub19@F-i8m"fi
hH#mu^5WH-5*sJ)7>ob^A,4DC'gkr0+u]A"<k6PR2pR"1"CpT_8qh+?NJA;T\)ut=%TsG7l8@
*H*<H.>3/#g7ik4mJ-:\MlCrQh+J=RtGg$OoQ,F_WM.IMCmp!:6O]AQ\ej5.f8H?4+YgqE;sS
(&hi@/pPhmca59d$hD)B<Lf'K#e!!leB_)(L+!Mjc*G$<,KCX+'WUkS#X%p0[i(&Dq5`ic,-
TT4EjeH7K7bK26:\6.L1#gpYt>-D4\;9<q`9u7&1srj&L*%6&hqiG3ZD4GFDA)5*<#^<i`O+
R#?#khKopJRpCtams63,h^e'9`+G<o<B?VkU/oGNS4?[8K&oB<HrkB[NP)^=PZ-@J1f/^kiK
m&=9<2?J)_)%`cB,!n8Ya.%WnQ;E(&<0g_<ee$g(a%!5VCASR5gt2KXi.FmB;@VGohlNOs<0
o"SpRcmC)YS.540CO'E#5ZsAjGVK2@<!8TecV8aP4Uqk)R_/bmPVaL,9(Cr&X<PuK__Z]Ag>j
p/=<,:P6['t/(iED0+^ML2!qBG.8rJ<K;`HrFB"MZt6t<%A51qqW82</2>4XVauE$>s;W&B$
dqX4J%\54R#2q1;>?cZ:F>a`C+)[CNh%Hch?2Ho6EirE_mugX`pWWfJehNE/K4Ar?r+:QInk
fTZBT?a0WmiYDZgbeW&u.FU3*$pum.`7UDK7hV6]A"44V1]A\i[4kAcl;Aq@W%?Yc4ZE*cWu9m
<(%AbPJG/&i>I6KuXRci6I3ot5=3f+sgsd[`+qN)"SV3$mlGWer;c7^9/!PC#e?%#rL`p`@A
T<0HmdIO)8M*<ZhA5a;sXnq@)Gr7kYGK2,[CVTpjAB<":D9Cu(:[Ks[Y,dX:tCU<E>]A1e0#l
N*2?q9V,qad%jXadUQ9#:V&q]Aem(I$0/q\?H]A[`\`LE#4.jM!)*L1ceg6gR>'Rlg+072aS1,
%8Yc*aU^W%RLgZnE*hf+!VK#E_AWgWWFSL;D%2g+8P0g(QZK@3$3<*W:c^Kj-#J1UZmUKLs2
pRm6!+F8/,:&MBl`pk7HZ8@CN1+s.$/7bC?AQd.8P<5tu>r?l\qN^$^l^LX*iP#OecD/AgIi
(fY"HkS*qMZ@t9CL@R9dX(USP@]Ac5:fiTK\I(@=qJ-\i\r1c4dIZN6e.!b;2aBYMRn4hA>:b
FdG=f%H96F""M*'LL`Kt>`>0XJ'?e"![#GV)'`a%rX5KiBas(@.(1OEFP-5t,<L9]A0o"j.X\
&BQRaW=Cn?Vj,J]A_C56RCO(_<;O-tY@=bXg%V%g4'Uue:h>Rk^aXci:&pU=MccBqe)^F$?WF
O>W#%JH2nLaAKohMLAGfFFcL$e+HnICD##k>Xja'9BfUM2J4[]A)i?t$YYWDZq!pg>!gL0U4e
:.uDEJ..n9?!`?!`3AF*:WN#Qbl^=!@,DCEHq\k;IUCT`'D(iHPJBKVXdq]AD#i%Bl3R2t^$F
+J'9T2&2f2&?\AQ?^O)7gcVEM0^bH<iK+QkMLsWU$s^]AclTGSK[>4JZgobfmN]A")&UM*Z,i[
urWc57B8`_InU.3(S\%Yg2js?1r0%@1W*Q3b-D/4,O2)V4;K+c@]A&j0se+J*CBDrNrAnmeFK
D:%^ApEruo.n`M$F!YH/Zu.5k>X<2'tOf_*nT/%(8P3W_^;s5\rO,[mn`$S6`V6>#A/#+-f;
W7fD19%"&7g**IXklc@Bff2WNU(s7;>cWYa9l7qDM_be8?"J_RI0Qe,WL%IqFj[9LjD\!S\2
s#t>+T"PmR^-S!p61hm2oH.Qa*H?W/<Whm1s3Jfm+5M[#I%qt&IIEp-oPs(h;Mk=G$C90bfR
9glpbpl?BU,L4mGHI#'*X'_m-Wi&)bdA`-AL"u@DM>55Zb;$.":?4m%19X+5YM1$9.2tM4T/
=RI71W6Q<8Bg`6]ASgY#29Gg$UUiauN;9$-KfV_,D6Cuf4tl)FtE?69L_$!do7.NX6OB0McDJ
Y&f/*[M$Kcl56`%==ln%G)o]APGDo?2p[Uf?agjFrLeb3:5eAM8:h%I)JeY[2B,hI_%T?ZJ.i
tu?TtkP$b!`U>k7G$5Ko$$;E\UMPKOiRg<:WYU;rM0<c:deaA1pq^/Y"DGRURk(0'dr+,HI1
qY.1eNq2>e2G:JkD4@KI2p,'\;JKpL9RH[V$BU:K57[hDn;(&OU:h)EfbqWIj]AV_`F%>c7^(
aL-c2/tfdHXF;jqN;q(g\*o2)l`4G:ied:m3d<fg)S#*:DY%GHoYadYDtmYq=>_3PfK$nc]A.
Sitm>%:KO=Ed-":B9ip\<@Z.0ShddrHjNXF7?ZSV^S9.Dn^V"@_bk00H*Uudg?l9PA$!D^n>
"ENfdYP0leKj`P1VN(QL?'_8BYPa=I8CalBe9K?gf;#sH%3_'.iI2?\[e%hOE^PYJ@E_bC`c
D`BcZsK:lfqr`0Ztb)WX'7]Ama@d4MWBm`88jChHJ[q&(-q!ptOg%@B@VWm_qMBIF4]AF[6fea
P`Ji]A_+^8\-^rlDHU4XGrQq0*Lc&5=eb,*BC]A<Y0B3;6ZhsGd)i"nCI[E'E*]A%:VgRWUC$E/
KanV*.;`EiZ3mFq[g[V)t8A8?Zhu8Js:/iCT6Tgc2VG<&VWGVDmerr/%bJG8;K8j:O)W4;k\
cH]AR'Pg)/S`Ap&nK6ZQ+(H-,EVj#K%aQ)21jp.FMG0=;6:khje[ZY?o+-Sl*t9V>;H6Y`k0I
<b[:q5]A6FpK9S_QfLC#XWBR:o%R[%(o0i"<cnN]AmuLhr@!*-[+P)FM(!*-':Od1.3t5rt"C.
_31#X'<MR[K6i%q9!7HZmB.Mq,8O8$2mKf:2+b4R&<J++'?\"JU(McOAZQNoKPrEf0,'Y^5B
Bo?J(%nA61IBjg6b8d^UHOK^",o'6=*djPS>q,Bqgt&!![Ao1Q\C#Y9q#EJNaMlAIO8VC:/G
HI[gB$oTk`-r9\/Z&DaTE%77h7eBfTAq+EQOtcO3RLGWptO]A&rR3q167F[MFa_.aqK,B[3f3
(<h*#uc04cYg5Z1VQ-0bY#=lu!9*.K=T7I^d&3ErG1LgYB`i9;4NqI<M+&qo^/kHoOs'g*HF
$%:e"V[Te9$[E"Uj+:&hUk"1ne/$^,Rit@UQ)c2YRRohVMbj&0X&eC%HbM2.Ejm4F<hd<-29
QNI%&U/n-)F:0^!.e8FE%2e12!7h':g+::o@VEZu!)>q&HI1;;4JW3@0h-f=q%k))_cS.3b[
Xdk#Uco#7l+2p,``_u'3OUnhfBACBZa-OQsH[aJ')\af.K`Q[AjGp\sA>Fg-&*Q)-Z\Qp(q1
U$K;"]AVOlIo'7+e2OLdWg07EQF+SX^#k]Ab1@Qg/is;#IX&Oi52)oN9&L2Yc@8SHg=tsu%Wi)
[qek;fJ.FK`Ip\3#(L+s6+J#XUn@M0t0c8gkX>=\E$-[aoodu=3IgrY7cjGR`C)M>:eKat80
MJ`BShHA*2I(K%7K%C=f937"Qt\u:_dJYLZrTiW5c:16dnEjC%$5LT89JF@;.p(t!\iOi+s@
af$P>JS+SU`l/dVg?ro2gr$JbCBVi9R"#@>4_Zs5f@5I6S&BO*%WM%.SlHI7h4C^4ST2_8_2
mN.t`$dh^nSVMN^,8jh^rkAl6J4+FAkfR2p^jf:ppCJ9FF]A?hM9s\Lk8:nC"o(s.'!FM=cNM
N8a(CXok?S(7/>dOU$q;@8g7idAl(]AB&*-DU^W+Lj7SLVH<%"ZZKPgMH_R6Qg4tkF%!@5o#r
^,ElA*"/+p0?29"UBu&8H^4,\`1aOSl4oanR'=JFT_CY\&!WuHKFt:Rk/ElEGi8=LjY;ZDF^
SrRaITP)N;NTqu)$XVueq0dbQ:P)-.TJ'8O4/s<0CL!Sr^S;jSi]AHsO+,6[iHB-Lle_W5j10
6$ambA6f_L<TH)7pTnY=p/=1A5mL:6ts4m2TH.qhuUW:g.iZhnirUoTVNV/m`-Z5!q-L9G52
m3<-=`an6L./krV(19?qA>76"XRn,2nm$KpF6!IR%'m$2WpU0kbK'a6$3eNnSOujF(?$aZkt
$59a-I@LbtK\P='<1*/CLOdNNQKi`!AgY#FHP[2d5LtIrs.#[D:>i>O4U="k49Wns]A(:c6(V
s7Dm^l9>'\%p2V"n4U:oY"BHf+p\pl1&/NGbX2P!_/_WeH7Z@r9Q1Q7LTlsECWR8*_n4652!
!#%hlX,7Q>EQTWZJaGR!WcgG,7+kb?#E6fC5=#))rRgAX*NPF)0n:(WB0*C3Y]AlZ>3f5ZX/e
7MO,=pQ8pdkpMnH,73]Ai@.BIS%r6%8B^>,/WRB"3Kj0,gDZ3+AZM&X<WpDO//64MDKPd-]Af?
<6A4h@%1<U>Q5"MGP@Z1D1@Kr9@GI#s%#q-!BK!hn)&?X!BjE?+H7mo^df$%$9u#5:ua>jNQ
!LbA>`&'p1!j\9)!,>,lmG[W@>G7!*U@mG?\DoXODaSM-b"dnpf'h0UgD(k'2[7pEE"!3t-E
_$n<(UIl9bjfTR[HhP0+=FS$*hJFd!>"1sPJYbag2GCF@;,h@8f0Y&rP2!bc]AZDhTe9hg5f4
4!9O3#WZ`Zt()RG%OJV+Z^JPkV*:k5##s@(jo(#(%'H"]A+8!NFbDQs.s#A'YUQ*kaj(1,m<,
M1/#+sOTfUK`n")/9IlF5qJ0!uP*Q_0hq2SP<7[S"OMGp@*Ka@fCSjhRRU)J4s6nUP(f;Nj%
MZXRtY+m`Q[is>'nkST)Wrht,bW,g?<q'+NaHE+"!oD4!",$8YH=tr5U'."=H'W1WKj#$rWC
4YBaAhW_+hrM)\Nq&,.S?s@c9LE5Ne.';kPgFkZ4a]APW97*1rMFR.-XGoed8WZlWFKf-2bQY
d1VNu?GaH[71/uC`N5#dP,X:91XPVO_^!I8lEG)2dd8gujE80=)kd,3F69[V!_Z8j#SADZ3J
mk3VG?Q7*ae\-d;rCE>Q.;@84^EJ1VZCNWfGd>(6/=nNg,IeR)tP?M6(]A+4i8Od5d4`\(=`c
2*6dSAd\=*:>-h):L_oqQbie?"8i"[_aMW=]Ai05lkI"l3j\X*oZmpjrMW)hp*pMJE`n0>ZU4
\E*&P@O.#q]A?"=UW6S8sguDu58m+;KWI6Nn.ZtR[R[*F^1.*@nr3-JmgNM%#q5pugMsQ3AMh
W@bR_mQ"<-',[pmR#]AH8B9\bcX95B:M#>OPZ)UEBd&h&<slV\ar,t_$-F<oJd\LE=u/FbRQ?
\)M>t.+gid)W80FH,JqP5Tf0etJ8EKQZ#tA[fs4j0$fNgO48/=a6tHh;(AFN9T@,=@/s"tI;
]A^INfa,5'+j`$f<EV*E--k&32*mL$lp%;U(8U!1Zh,"/e-s2X>)/D*mG+5#.psC6#1gtE9l1
38gc#8TR]AQ\IGi<U>em-)H71VI"Y(V2(Z.Fr:ZbbCqB>`gV/().sW"?$`95e=C!9Im#VNl]A8
TX0pWBI.?IX5s/kNNXFA=_BLe$F'&sU?di"r+,PJ=qkl"OF0uh!a/:3Le>FDhSN8(1ETL55C
V&ih.gXFPMVK1ccYRP8pe,KaAS\qCO??AOM1lVJ`ghrfUY,J>iU]A@F\%t*ol!gO1!!Ru&1=Z
'NL$__rO%%!/JN[:\s/&'2GD5C9AS,;NQo*_9(omf@Za)S/g1__#\uZ2SgSF#7omerkh[CjM
\&#EegGeuT!^CUSm>&qaIG_kR:A`Lbl>e`#[jP]A9NM)I`5Qf>)?X*2T5cSdZ/#$9OE<>H<Jc
qV"RL8d';,cJT^C?"lcCfNXc#o\F_gF2XVNqW`%"&+/"DQi"^U\*mgUq*McS?j?G8MuJBc5D
5-T(73RfZY_e#K<Os7ii?[)f</-7f@;E`tus2j-bF\>)UE,!;;mIrc6^.(,u[<^J/L^H%ETn
DI^+#\1bcIW0^?d-2[n1CqCP?aPjXDSBM;Y8@OU^rkHFV#_KY5.Ca[iWAEPjed`rL"IF?rGL
HYInmN3+YB]AN[)@V*8d3j=`r7bH!7I.DXHcVq`4&F::5('W^;`]A3gM79/mm"S<5R6bLhrGCf
?YoB3@^-=gA,e.SBg%FWrK#48TT@#7bsMC\MD2lD8f*cA#^lul*=Z]AjVdok=<6a\/56`d9H8
(oOX9%tA4d2i!=oMWlE7)tju)h/@"p_F:MTjL36:0R5HND'a*,$,gF%6!&"tML\4)MKC;Es=
9t^F]AJ9,1A%g!p]A`N?1I5@9"BYPjq':E#<aS6<jK`BloRFoK`1N_QiA\-(m*mBS$G*7YlE\7
Jk<&fbIcjk4N_Ob7EJjbk_HakD$1hK[Xr<Sm<eC:0^)icZ?F@_Ili+"8AI.j3kQn"l0![>Dh
8,%sn]AA*hT!omgf<gFgsDMM'?1kfj4^35(ft$nB*,Z2ZC;9,I.[.0[8cE^#rVZ3$qhZbD;-o
F/NcG20-Z(D\;$"7:flW22V%84)hZHM_;#7;M4EG8:+F:ESq!<[:;KV\\4&l>?Ur`T:t%b;e
k]ATN?ET\-/VKTWJ^"g8M@e2"!H(!LZHVCfi`Y57Wr/;*e%;Zo3JB.^(sg$c0EZ0>Xo3s6\"S
gjh83Ej/'o.WTeI)rGZNq0em"G$MRV5UY8Y(#m]AGlGbq2k8S_a8lWh,JR<E><b:Al.n8Jt:-
Kh3pb(i]AQtJ7qT7SuTq*AiKf$6U1_ZSf".&OVYH)@4ia<sg\dO!#Z-B(m?!+j0Mg;MPq==O,
eh!A7@A+"keE[c$SiK02e+7$X$LA_6,3F&N_+MJb-Z<":)\,dAY3NI4S=.O&aZZPh)""3FGM
G9Y4^Z2pg"!5&X8rA%0AK!3h=rL/L$$;jT#-\@4gNqPn/00/'Q_3NZ/=k?pE7KZ/d(gMla6Z
JF*TJXY)t'AB5D$`>Me#\#Y'F$52)TM@//'Gt\O#uaGHd]AUeKD53D%4O`Fb$3jN;qE%G>S3)
k52L&iZBfLho,opTB?5"c_=VVhn)\0P?uM.?i4f^H0XG3fdt9*ige'Q2P&pLqPK`Z&G'L#Vb
6Ub/Q'YBPk-QP>]A.H>!X%XQ.5^QgGI^C&ZqjP>W5d6R^AuX;\.?ZF;4jtooglM#$A\Gl29h1
NP!95\&U`Eol#V8o3]A-ITpqlJ=;j$-,%744%^NGN;Pm=BY<[<E8m<=s?Dk7s?$%4ZPM3Zp"N
V69"V00D\=PWM6qWO8Lk%[`L/<df/e_"aL)DN/+F<`7kZi7YN=u>U+"K:K_nJD#0'mK\8>/^
O*r16/l5Y^3*h>GS[HJ?73'@.]AGJ4EtgE!e@3_5Bhh$QmfYo[b@_cQI5uldm"^2e*W`0T@PS
]Aaf5D[7Z>>GSdajTqPn`0>mAj),Eu$[J[I;IVE=rI'%)ESOnNjV^FpG[KhRF;:DUlkKuS:\[
J?arCpQ]Ac*X7L>SoH)8Y!75:3O'#_)q2NrB^H.;ubG"i.pL$=@e_:AFDm>q3Rp/$SV-q5&M:
gorbs%6^H?T[_8>2WSY"5\a,35N)thehT>1Wo4V%I8XT=LHOq]AU]A&3C.VZ#'/]AQ9.uaEI)+M
*.pQnp12;X0Z_`(3*#MkCD0a*sD9\(16`.;<ZX(rArp&bCRQ:)";;lNLjkH`4JDR&(\H^e/>
_OI,]AC9!["H[Y2,T>T7U%VAt<6i2!@;3LRMKQ3cbV^$K$8e7Mc'`mZbCe#I5?*4pp(]A"jcD<
O\oTe6j&#IfnPYO&eZlY=&tbl+C>L_=0"LSR>b@,>u.ugg`C-D3umfsSA4ui:e<iiYus#(B5
BQ/l#o9f/enl*]AmuXh^&f+Ui)gSEkb,ig*BUO]AMj.(B`(C=mE)t";^1lT$r%2*0Y7aHP<IhU
9p#h_CL"5%8<EbKMOmK=]Ajuse4;UnXi,Wg`dR.f4bq`';=e#2g#IX&0obkgMTKWSk'=q<O3E
]Ac.l$2qdTl9Fgu,\U#DqO2"Lg)D8=Y&'0.M^@F?V'e(FR:!jQP0/@"bgWJ7<FgLiB0-qMJLc
n^.8*&Eq62%[VnXQT;U3<4Iaae#hm-9AbOT7<PQ_\$cB;hs>Z)t`L'I;Z5sa8-@j6Ge9/8eg
npm^L>%ML4eO.Y!L1nWt-/XgQV4aMU\^g+"(Y<b4b<Qq4^Tq`=B2.EPD>eE%@p7<D\e6Ubfh
:hi8+SV$?*$arP7ooma(7j_^o#3'KRcuC'\e71^Uk^UGUVnA&!]A'Z[6VXZM".P@drD8NVfAf
#(RQh?0KQoNQeE0[=J"4=/bgrBOhRTEX]A\#U<:6\R9gD&cWI<[$Etfb)qHjA<0`0V'f'W=fJ
]AIR8W-$E$F@<_rqRU7iEX/foP]A`9E.FW`r;Bu)WhX6Ri+Bt[lP\eoiYJW'-;cL*hrRNAUc5m
6/GpOV"'CDCFE\KlBk5'I;7sPQHKH4Jk:)r6-fMS_0a9,J6q]A;Dp#(cXDR'U8[$cAoVDW5L.
S(mPWXJ6T+hJ-=t0+g;'\h4F_k_JOC(8W]A,(YsTV4p\)"RG"87m!%5Jj?cV/>jiH8"\55jCW
;buJD2P7J^V_%,1fp0a'[YKm-RVC`%FI+/[=X4kN^*65:1`U*n?!&KKUZSfu6^>-5s_-;g^,
*NFW!h*WtnuW=GZcSC,(/`'?]A#2a7kq:773+f2OA(C[#cN_!g'-;IGlJf_h7`rqbAT!d<(<m
d!o$m@)`6Y9^bUc7?uKKi.s%K00*5N'A'4kE#quXj`iPbX1;KLjFnLjsa![:=_f)\%#6!k*e
nIg/e^e-ju9JKsk7/9#g4h(U)_Cag:U@U>sfr8's-!X*W`CmVo?D>"0"P46I6f,W&!,i0l0a
_*K_#0(gkpY'<p>d%<Mh]AG`(7N-W12&AA\`!:3N=`0.kJGeC,cFQ2iI`e=5\:rr>:\UU!OF`
,&TT^.5[01ArH5[t@r1l@H^5"AE"=dl@\8XH=*_0VZJf76[V7\]AXWp<)E4;(AV'eoMK5Dip!
#hrWAuF`+AfRo2!P'Qs7ns"A3q7LO$!'#20:Q;'eAGe@Oas37>>QA;&_-c6Pq-694?"cPjmL
]A>L1[XN+sYoU5Va20!D]AQW?rMj!$6S(,m`1H/)KPO5TJkPr[;>Fd?01n8PU#cMO[*F]AHrG]A:
Ib^=L5OiZWnkTYC2&(-(`LW<t,fl8O<2N.i;KK<":ooU$o@q$)f5"[A>j2U*W>L31UsdB.4'
C1QQTaj`LmY!iK3X_Z57h%m:[(d3ZZiQ/uL0?OHm=8\YYmDi!D2!s[t<`om&Rl;Yrq8n?4T6
kW[dI5KqIG46O>p:)2iV*Oj,rjONE)k6<lBg!@9DXU*q/G,NbG3*Aq_R&8CPqY*HUn%CWf]AW
I&ok(TKZ<AP,_arXlq`kRd%Ts%`OsE,=^Qn31pB.d6iOYV_Y.cshs()BTGo4GZDW>9>FK;`N
Ve:OZO:peZCbhEB'QGb3'>UE6u&:R^o@'abcO?UC8d]AJEn%`M!4=g!WR/D4Bc_f-<0d3%JOa
]AlQGY'\s02btU<de"J*KAUC"B'BN;'BNB(r:mMhUbr.)&>?'Z^1>O'!?_+sH]A+=so#4:3/$:
MR3k$5Fe5,+$1=iFK[FR^_Hh"VRbi@o3JcUVgeX=J@PUsf_fO_@#PirhrYl1`"-@f[mQM&o:
qc.%AeEPjD'O[\IsCTbrbM)cIk[&iR"q9(#$DRnCeMf_PnC**m=e=7E5_M9*-\IE/&P"3Z16
^ke)Jf:_]AAHc/R]As@7ERJn/fmXaS*i1m`WkdO'(+s'Je=(i=@q3biNU+^_d!$6!AoFm4-)gi
/h>>JUI#Jm&AH2Xb8rs#tdVbe5'DZAmQs5S`18>=&hmfKt38"bk`3EO;Cr10[FS=9.I09'k3
LP@bORrB(jC3f[IX.ZjWEX(j7</95MECO]AALK4E]AsfW:e2p\?]A/A)2+-5Sr=L/:/5J=W<7L"
W;W&8Wg7&(38<^kO*n)Rr>LeoH&JY5QfF>YV[?@aQ&=X%s"h`)KT9GO#pJB[7+!?.46#d5#;
M&M3WqBZW2jLW9"L\\Hf<qY1RYI@hcp>hV<>A@`CcB<fA2P2k*mYl$JWV7j-k/smLsC%n?,[
_\/qO7JqCip91L@DjZ)L)ceq=="p#)-gDl<=on85tU#/(W@q(Q(MgERlL/YPceFa:h&ll3P@
?$.^V4!0\QE,V2lJq"A3THarM4Z/V?`cu/YfL^hp,Tkho-Sd.p&+s]AYCO(,(D=LQ6)pLM:S"
Cuj-%ai&iN.]A9]AWKGh5'@p^iIg[$)+`rkMO"d<6fOgmrA_&Nbar41*k(BO@H2]AF)qjP@$^$p
$+:XE>s9+@9J%hON^EiB?t1D^+Ok+;.aI:'Vi#8KA")lWGfXSdD]AWK%US2sb\\:,;f;Ig]ATd
9Z8(LJrQ>9!Y,]A@>3`JI)U8&@)1&/moL\F2+[<P(K6[Ychu7N*mH*9RM<FBk;^BOd9hclS;J
XKDEk)_d&16$Bp-pq)'1r6`O!YCSOmfJ)a:uhGLu(]Aq%CjVY9R56"mN_-@U?Gd/MD:DgJfS`
"^!EYD-TCS6FEHl9F<Ah-=,]ASZi#1gQCg4[^1Ue8+NH2=FZ?W[jtt9ND7FF>NUWS2:I9?O%"
VcH:(#\4jZU(GF<e[.@Tem=2-[njJ%1EllrK3NMrtDH+/+gVFF_Op-!Kl03=3`R,V>Mm!qB(
3T'K(hKmbR\.:/$)jXCI-G*N8LMh.]A-A4l&RE!G@??I,C^5HPZ6r>D,Tqln&)[V"%4%R$BX@
E,a5Y/4'#sjHQl5(OnpSiDC9eg=>0.)>(dO?r-bqfs_*d8)3f9b)1\:Qlki&-^6PgeAfoa4-
bV@t>2O6J9T#O%'Ts+*$qCL<*=>2B@iqiD,=5ukQrD!lsB@i6aNGb=s%QU2+OYB6+m6ViYWq
EC#i&Dd-KNFY6bM.:;hEbTH<#J!+:T^s6'^q/TN+1\2?i/ec)k8F`/O@:qaAZ'%Uj6qE4Sii
J@peR>%*DVLFppR0,R1?=..1d8ZS(=FHc@:J&+-dZ-5V[H'bA0Th+&7Zu\UK7NNK*:QaC(#o
)OZBn#303V*IL&b0t&#Ak-L'9:;:6EIX+XH"!Ud7_7Xi=0Jq\-(Q?DFp^@-_+P-,[:ACt8ms
X9>^q&r.(Cahp#>Eu+oL/(jf9;dZ?6\LWVPc>jqRUaU74--4)soFmJd/B4WNd8+EI+<qGeQd
I!a1(Pg":8"243fX+e_Q&VV`i:\"BCC3&^!hWg4?[']AU5G*KL6n*-H46EWNJo+8$"afGJ5Oq
,hq:W'T.\ecDt#9-\1a[7aW]ANLPs7U%*!nd6coiS82Fa!?9@0O"eGrR`M=#WhW;1WgDPVrWa
eKeZT\PEPW"L*3D+/<EI<W<99n]A/Cu[?T!u)`]AmRB5b%9@#*u/tlO5qK_R?NTmFO"(-(VKJ9
KhE4FqP*pG)dd!*5!>h"]AF6n%GB;u62(jrC9+*c\!$^CnG*7jN_"N%_M\58I5*JP*Q(n#DNn
=[0\Y<'Cc5L4abJgEe?&L]Aa3`u"cW79j!PL/:!i7.'KpEo.-I<gBBbbis3G,ZAYLP.n(NH&U
e7L=>dK@rF-W"Af,JGcc[R5_:/\6g-hmUYb;rYa5+J+8R,L0u8Oc$/?B<L*@uH?Y3'`=-6mk
_4Lu2A52?q=IeBd^=>pb;lToD05L$bR>R8W:TD/rYm+\UVV$agDSeOBOZ"R't=^L\1ln7jO^
D3WZ*JA?b)qiSqpH@f%=ZiBOQ#'N^s3e$*IVb2ktk33lU7sY5_2u[)BqolZENW]Al]APn$sL&B
bCMST&C7G+@bu^ReT!!?F+U.A7S;d#^ej:<=pAJdOm=())(pIjP5#cgc@uW>Xb/!hpIXZ&_2
$#fT'@?"<<CT<0E9qVi--tC?t1QT%6-Z*P5nG%i,X.@>_fUZ#]A^qX)BRNaj)gbG4mruMiD1.
"0.TLm[NtfkP%,b\:`"XiB(AIWWXls)AbU8EGCE++G%T(=&4p=Xg]A%R<oNiYq30!'EZ1Dm9h
C0rk4F!ht;uFF@et5`$bk'4g#4nQcj2$Yheh&jO`e*RAabm/BAH"!gAZ;4'I]AL_IJk*L,CT>
E2[lN'>s1r35DOFbnhW`8Y1t&g@rD(^Rfs(G\Ln>X\qjPT!Ns>:m?]AbEYZ$&C?-.>u:UhCn6
<ta]A@gUn\o_dkZ`qbBP?!k^RBJ/=uN)/H\[IVh%1N3.Qe-SI"pM/(Hu+WZdqY#.*uV5V89G3
21R-a5??lmi8G?4V0?0eV0G1p6A2<fSo:Z$ba^nGZdb?o&FdhXie,nR!C33#N083s72d4#"X
V"*nqns4L?JJ,0XPC!H2V5Fo.s!@C>s'HeA3;8AMVXnW%h<CSUICPLW*U%rW9Scei%r2(i\m
$MGF;&K,*d?sN<s'>TI#FhC;E@<?mpkK7s8iA.BQ_1^f7>SLuBGS@L^-f5"@n;0Zd_sFTgeE
2?[!tVT$S'hue0"(QH+J'5M"c:%'Ucc[oW^<ZBZ1G1D8*gk4V-rrH6pX80SW\*+?/Xb$<0]Ae
YN@rNVh3e(;-^@;i5V'*d!LGZB#g\+0CAI9C;Q^[q<,)^nkS3PTo@cfNMKW;ZH1g%<!1IRUW
41$\#Z?!]AgXYK;F^&!^Y(9Qs*nIl(fW^r,hqQ>Q9hj)*FEdL2Wd,qOkSkX$j,-BVqf)[V64H
'9Y.Op/gF;:Uaq-o">T=/IFD9PZ.qr)<il:&8SNanV*&dhs/RdWSoqPZR^^Nqb<0iu"I*m]A6
7g,cJ@@InQUsC"JAFj["=ButmW!I'9WZb*g34GO'R,UL._qqcBr7hVeZ7Nj'((MqK65lFJ&F
Af.QCMgW-H5tD)^X\!S8aRCTDDt@aA*W*]AoV\>."D\h*+'2D:(W92fh8u9>J0+8J*/\K%+Q+
8YB]AODL0]ANA<;pY3]AT:qh)EAH3njGo_WUW3(En?-"7u0J:b\f.H/!?g+f#.-%?#MKMW[sjKm
d%$7AKBBa1,#'5QS13b7spGPF@Is$c(sSb;<n\6ak-5,l-1@;o!g<Ie;,5@PSK.2!`@SPZFT
_U,#+=N=L.'>$VPR-9$.OA#`$hSF?]A^PH%S-`C;-SW`Jfg5N<h:O`/PpMfJ\F".QH^lpa__X
40o=F4N7iE<n7q[$`j9"g4/RjRh.5*!YLJR8)>6*3E<tq"Q=[UAg]ArG'-C6gP9(gHZshV&>H
ul"uB%7bFUN5/(L$kF_Dh=Wmf[!c,2Jl>]AEl#Sc#0PWT=okabs="Pnjpj]A)"M5UY+Y1ad,V/
#j@*JZ:(S<em+Dfd:1n0]A;"g#_b9K7eX,2UY.b`b?$Z"7%)53VUq5LW$_))$n6P1TD`.]AS\d
(%n!cRnrUK>?K()b-B1(JfI$R,'+3*'Ok=Z9-BKO=^3_/hu%C%->ignV!7rNI(WT<%DTVA-?
:ChD2u["T\(.QQ%Q'Pj9BXmqCV,V&JLQ1`(ECh^Gl,5^L[e(lQ41Tc2V[QNt&rnT4;`2![$F
0`u.\FRV'j.^`g\+1Sm'";2@]A!bpkr/Dsb9m[J7*i>b8R$C8?E"n`,2lh8/_:';e^r'mGnMK
,<:[3,*QuWZBYchRS;c1GrQ;kLI_@LF4T4rRU;:C?a>cSo-FtZKSOu*'i$;V,Q=HtpMLGN$3
**Gj#dR*QAV4l#Te;-jLhYV`cnC1WmlDjgucgR/K\I.BEk<G*5q>jK0;L>PsiS%*^;?UQJFL
R/odjK!'\5(5fjF7H`27!,]AYGm%KI$aWN?:]AP7?H/gP3)f]Ans-6Ig\m#U0A]A`0F'`o#(5#5j
f,8fgKJ5\J:/Y3H!]A?Mmp`3Augi=/I";XHH\\V_&sCr8;U/0hXBe(cOTSD>k)X/(#o5kOHn<
(4u>&D1l?U^8"Idop2dkQ?!Wlt;8=g7A7HLC'eF%[:ekRC_6bN]A5#pK8B3eBZ$G9;n<9@L=!
pgd+o>+Q@8>l'>K;YX7(YiF3CeBo(9UW)"/a&U7mtTpGZDP?5)N7+'pggg%rPaA[*!4GKf*r
ol=KOKS$Ah`7XO^2Qg`M[X(g>_VXYgFs/A<_tBh@BeBL>Z750J&fi<h=MQFTX93&$T%_YKm:
Ed7\b9*Hei#c+7n)0"=4=>3(q*)NVhXMG]Ad=^<[]AdnrKJ!A3HuG/+:P@5_P+nO/\:B3"C\i^
nZFfc2PCt:7Gn3Ajm>R'`4fV#l!iF]Al_4s(MX$`KC('[gA;jjRj)`Onb8Y7Mer4Y)g?d-/q<
)_Tg2B'MgFAY<f?'-Hc+B:ZXLo<l5*<cKfoP1'k'p'>kJ=qF7.A89*GA2V!J:nsd&5"(U!T*
F>HcH#*^\d=XL1>m"p0)7_B0LD(]Abg%S"rZ"l%^E#EQHr+Y)te#%".GJV9op=_f[=%Oop*DD
5[[S_"ch]A("05R<:ejgmQHGS404\"oMc>=RQg`k\)gLpGrd?'h(hBYsota$?8_`F7'5^KD)n
5Hi*d<>%"&k^\;Hs8UQ%3o1LiT^@-jN=6OF?:T$)a"Z95qQMGnr4n`0U9NrL^gf4ah'rb#k"
V,AV]AEO"aq^8d:J*JdRp^IbZh3*QXL"h_&$_]A&hpXMSHrSBjMd8/VFWdDWo,Q%pQ*_g7\4$J
1t9<D4C<9TamkNOA5`EVcKpj4C;#tHU`uEnT9h%."qh6TO%jRF'k4kJBe3PWa1;UW?FjJrb#
m6o[^,YW6'51cc#.\NhTY-W1G(Dd:;o+7a%&XShM8O&*EO)K1@-bGDCgf:q4j&raNjST6@]A/
p[jIgVVA>e#pGq->,E9@G:;c*%*&OE;B/k'R\Kh1LZO0in/`j#4lM5jq)mdXB1$rUc*1OL:D
8''``+Vd2J2]Ak"8$?QEngW^Y`NZ<U-?>:_oT&7i!l(6b(&TDeJrCNAog/c6#$PEZ:M,G(Yo#
#miBR>*UUri*seI"`0Y0*?T-_6qJ@DjU.g1tTpXS7'kiueH[K(^GTT+6oPCYM'_&e-^&j2`O
rF*Ufq$l@locXXSZT-erSq@?7s49,`I=F+qDVp1T3:>LeuU=RoqdS!$_A/g2^MD,Q-I,"CjT
FH\31=d7e't<rr_W-m?T/-o=.DP5Rh'kX]AJ(n^WV"7F!MXGp80jKrQuZY*WMnRqK7C1@Y7<V
2^&;,RQ;ihj>ij0h'!#j(4,HN+o;rt&W+d"BKc:,^NS)*AfF]A7+p6XRoBaTM_CPl=:qDiLVe
\l1Ko+fn5ls]AoEI>@:_61OS?@(E5)Fd^gJ5ejVMn0/lbDl7rX'D8c?&1$rBVQYoD4CC\lY"9
R["a/-Ri0uZm>5D5O7E(;"[9$<adY?&i+fU>XH*Bd(UHe<q,FQtCk(KZ^WkM3F*ecLj@U*G&
dXYme1YQ@^La=DRsTW3S#$r>_6W9-34@G>ruH$^AgUdBi!g`o2)*IZ*b(7/\6+FkJu1?m[QM
?+nLka9*IsDfbla<[YTnURY9X@7R*.s+'Z$Hj68mf&"Yo%c8U;Yu#?5Z;OoHg(R?I]A]A%dHZo
lSJ8G$'e!9!AfXoDa;57b^t`m;=3@Hdk[="CCMY.L'g&coM\snp0+I!SFD/IWgpWk2=J/gcP
LF(1W%sr,q_]Aq$:('j+jp)!_1S>,l&1>7ZOqcP9[V4\j4OZII8O3"T-;qS^f9TQ,?DXXafuM
V*V"Qe7HKP.e=L)O-<;2;O''bAS2CSXBKL&HgmgYY?U<gA_2CF'O;t)u7RhUsHQ8b/f"1X&q
D4d/Hi'oAPA1d+q!SGg[!JmGOL_tB;hI2rV4[QU)J)A;E*9HT]AUI3rKP5`)^(jGZl/jYu>h;
#k[eM;EpI#,p/:tu^WrA"m:JBtEnj=YqDU`T7-6h)N!W)L$_Rj)@E#N80V"D.f[NkW.6iG5r
ZokkV]AuKArr=2=>'0PBGU'to*1\4e)bH"ke+tT>MfH7#nfLhP:RUhF4qLI:J)a>.@UdDs6MQ
Hk(n*ea7gqdoQ^I1mOZq@"G5Z^J%pIe_TV8-ulfm9Rk2)*b,(?)[5(M^cdQD!`_:5704)Q7C
gG9<gCdBsslV0&`%.X#KHn*^S4%fWqc=K4m_>B`Piid="jg>;:H#iB`11@lB>>V!q@!4_L$3
!P,M[a1e]ADK"&IA_:+N?K-2W-?dQ`-^f[Q_d^[q^91JAO+k"@klRE2B[q7X<e:IRD'"-i$AI
O\[99'/*I!'GX.d@ZVJ_Dq,$26s#^KKJ[VsL'%ML74:nXqoB2E$G[nlq10u:`3CYSMdp.o)$
mL@"Kp,$G%LUquq%sJn!8/p/uS%n).I-p!.[X;Ej,4t5kLF9:6/Y36N[(ubjs-.rG-MD[6$4
0eJ4oN"grMZc@0D4RJrPucH*G;jp:&$rdHuM:f3k_4$H+%BG-c^__%-Zuho^AIScc*BNrHi:
pk=@i/Iub&sj8"0fjJ"M&7,ce!m.EnUb-S-lHS8p1R\%X9%]AH"</$&ft+G>k<*DV?]AM)F<82
=;_m`66@Fm5&J7%GP]ABn[a:c_opU(dq68=QDE.Xk#3%,K_cG,IYcW7WD<'.IFD=B4'hL%ffF
_4LYYrGjikhWa\\T@O:@l@[<pt<NH\Q[I[\lHX_RgS-GbSofQugsplBq2h+OMuMt38?#*kR7
^c2@<S&Oh?d(:$EGK,\G4ZSHr1iOhA$"ZTfQ/=1RFZiRfIeo([/E(0qi,`#ufKE2?_;hZu<F
!F_eQ;60a]AQM6GJb9*aY!>#lp7kXF_t8ompQ\ZO`]A>b<<Ij-D$!5,5/SHG/st:"XVSoVZl2]A
rF/CH!-ETPA"7MaYqSW2hhmdp)4=UH5b>>g&ig7.eN*m`]ANqU?)GMr2Q21:p7C&.$/]Ajgq@,
Mum?.>9qmHu7sKGkYK&S\#n%EBS$op6"j[]A<.Ll%-STTAE:Zh*ti:726A#:alDM%W3N!=i7B
%O".F?D5J^;7]An=1$kf\4%]Aod>;(NjYAjQtJ:dcuaH2`pIEd/*Os1&ZGL:]A)*-l:#mRJ6:@d
:*se6,>G\3_.$oHR-JklELkT4LFb9sQCj<699V8s>q<@\I5YJW6barV^g[lXR`fKs)+FHklu
q@I)gfrXN%]A[_Rn?-D?mQ;U?J)q4KQS2^XdX5_V.8GCV#5*<?RW!+>!$Qj-oq-q)Wi<^,eX\
ViG(V#Nr>E2pP*'W_*,oC9`%4]Ac0e%WcgC[rrN4H%8JG`b980On/sO=R<'+M4.EtP=m>\K7V
XXNQ:DqFT^A:/aFa?\:9YW'A9X@M.;`Jss4JmWC30l!i_h]Ag0=$+En=5>Ehs*<?Nm!7*7$]A\
Cr%QeX5q70#H:ai]AiYbZVM,3NXk(UT?3P#,I@d;K_k!R8>/*ba09=ZMkc!rZ+;:b;j=O't$T
8RtW;;K((6-Tcm[2a>4NV^8F))hfjnBIU.Kh*\U-ZY40/:\6gM!WsO</5(qNN"$k;+/UAPZV
ugR*7>GQ%R]A1YKlq4)0mF/mp?@@/bhI=F+]A]A5M2R`P?&FHdnDa"@G:7sHJi#s^V9jd<$C?9S
Bef.U\T['SaR-YUWaCPInO.1KKT?!Ip>\Bs]ABICd387Bmbki;$Y*+?E&]A`b+WEf>Ms+*HP0q
kAs"\K,BNN=lX$W[9ji:ppBhSuC95GFLJXm='9"E.`-OdoASqX$qmoZ__L(I:s#$-M[3@XI&
H3O-?8i>d+*)=n&7pY,jVI)ra_??.2GA[^cRGgR;G'Ei'F;I)Wr!GAK?LLAI.54NlV/rYpp4
^pY5BAFdH?C-VFZVKss'B<V)R>OO6@"k9Na/Vthg$S'4=-UUauOmeRmQ&E.WfPp>:d?41d%(
rhN?3Z)0ZBW\u2:4"L<jgt<AXEc';O^C4doQ"iC_D1dJSncWd2XtVEo\U3;0T"Q_U*7i24_!
J1TS*s_1CR`YVY)U97<7="28u1Q2Ci[hcHt(3@.9T_S?45+@p\)j]A?9S$cYB<_k0o$'UOf^9
R2&n)k3tt(7fK9L#d?:P?VL('R,=HYV4@N)-'f$,?Nn=i+S%,)1k2cE,\B,h!e3Ch72'cgr>
_:Ak55i!@;34bbq%r0N7\:n1r)V(\qa4k6Lu8N;Mp`^Mo/'L/#CM=i"3O.LL<?-,N2bSoGkJ
9^fJ*pKIi)/+c,0Rd..-am(%D*'*#o2cm2$mj1=d,Z*9(9o^e>L0-0/q1HOlJZjJu%:n49_0
fD>cb-.,U[kIV@.:hdNA[_)>ZT8tY>'?#S">#NCu9LN=<etQ7`*YXNN^".VTqCcW=)k[$fq>
:epQcf.0]AbC?1S_P`W(Al*>_BGh[cF\+%+g75`39)1@kn(i>QFZI`=m9>lkW.OS%;6\4Q\aZ
Qfu,WC]A&J"G&J63W#[HEf314`.[Is)^L6g<CM(cOW$k6B-g(>+_b)YhP^_+qKXu;d@U8S)1o
AX)$`Z&T@A+Q`.5KYX,IE6EB9EK@4QGCLVM&]AohY<=fkK8)f;fd?i`Eh8!/5RgG0-K-XSa-r
bj"L(!aRjhM0Hm5%P(`Q<2h3//WnX\MVIC:>KuZY::MOCOmT7<n_,elp*o`66U7OO;r>EWLY
t%IOJ5._EjjFi6I#!?8!%jecOIKC$g&/jB<i'+i"!2KJ#9rA$t\d`3m;!Z))hrq\#AVpZ-KG
G,&)='S70TJd2,T.*XYjbZU7Im!H_]AB/D^Q%r\Wg85J8%U[M/L*R.KrJWA848]A#mT3IHUV\H
hdWqA`[aZH[]A^"'0W4edL(n>@>&+s;kXX[,]AdF(+uq=W^JWT$kga"FOBFO`["d7Hcsi[(#is
fs0QZ;.DC;c\b]AUWMZ@0m^W'SF5D8MZrk<Kl@Yn"\5Yt7>pq,5G,+3X''!TN0I\&67UFOFF&
1Dco-Nd@bDcje&5XHS.r2"&e4]AV.k)lm1@-IHlM.c,c1BpU)Af^q;t+Y:6`bo+d\3EXRu6\i
$`=-6,D:6<kJ%FYRW9\+>utSZrLQ$Q&Kn2(c^V4flur$#J:EoH-5A_q4Hh>C+73>eVk`q9Dc
'(jPnOmKmTJ<98,sHF*(B-)"._p]A)<'[C'A='r_*$)jibQ,_A!_=?C^_AF=TTp[3odAo#*l3
+cT)ln(C0[r)bHoGj?3X\<KM*=V$l`8g"b=oN2o12<EUQ=9:o3N:B'dN@JSE:E=\=!rA\3s-
c6'1L$ifXQDgV5sO6-NPJq;[+XWQ"B.$SC.N>%XIXQ)s?9E?%",ZZ:uPufVI#\GPGa+)i%Cj
&NV=FN`N''XGrhH%WS1N^F/[?BH;n\3%d$>SicE+?K()U4#E%J.ZCPXGiP=Mh'L+h@Z$tKDE
tVaR#a-OgdiAIGE+N+V^jY:d+<p5#]AS'`H71?<if^CA6H(95e1nG<I,HVrT"!.Xd<._GOYc[
07D<`"?6J-.b`GBbB.s#JgbSUK#raIGUs_5b.P.I[bJ%Gn5GEIsh!2?b.F:\'5g5(_aX@oi>
+UFKUZF'!,3/\:HHiQL>8;9Lk6=Medi&Sf8P)CnSn?i"<q2Nh/'=Y-c:ILe&b[YR06PXVQ:k
gbB"@hXb)3aXYUOUNGR[Um+o^[$9AG9*If7i[7U%`Yim&:g"UKAh8S5#%n54+:C32%ifqh/.
&FlHkel&5GJTK#GA4us9j#;,R`\f(%8juqtJWL31Z!f#W-$>$Jo03"08h?^ijnM8PW/FkEbe
/kh^JF8<__GSN2/=;<hEZV:^\Pn(fb22O%;f8ndYJ\F*-q-&i$]AaFYkW0/f[@p"a5[>i`P8?
=!T"c.V^q;X"s_:q%WtqZO3ECsd;Uo!FVqD6h6UC?5;MH[gcai`1S0UH-S?9T;(HL`[#E/&*
h%*_2Ot-YCG9Da29XmJs5jC52;,0K.krjS3%SoLHuLD78iDQiRPZ\=Qi:i\R[ZB5CCcFo]Adh
&lO#eMAcg1*O/>rg]AJ/]AplNc+O`ALR>^^AaGDs%Mrj_3bAA%:q?aa=jra^cL$adXD!sR+t/*
%X.`f8O8kY[0Il*-?2atg'Pd*"sV]Ap1*b+G&cS\pHSl%).,;0cYkKTL]A#^fg("a0;F]Ae$-%(
l;n`,e<("ukosK_9*>O^B!?f[l:CJc@JTcOPPdp8h=io1#QAYh?tT1e<*4;)g&2ETWmnQ1oa
qAEBYDng%&@.I/7DS;smVo/m/]AP5d,H_,mi0K684aisqQ%1"3i.-h_$WWcuq[YF`pkMObOc.
R9]A@2;^&N!"(/AG^S?&+QoAHCn[[*:ML.%URd*>O9/ifTbp/;$KmF,KU,hM0k>.jLF]A(mc1K
k4l%I8Vd3Ans^s$!N`piO]AKYcY3fk]A?i[duQcddDO3`?o_L"^fsD4F5i("c+hmO(LC-M+pM8
oZTcl<j.(An:A@aPTP!A!fAco?:Dm%.4?>tIME&H2)YmRd&UEKI`R(IkX4X".-Vb+g=8t=%e
mq,4,.P`*(j[6qo^Tf?%>JYPm'ps5KD;0m"[o=phnm%V=091hbu7Fct5FUeqtkA"AJ[^.32B
SX:rH]AG%QU/)_d';,NhWdm`mO,T.kn&b15cm&p6^;X!=]A""B4di'.A!O*]AlHffOWNPN[nd>_
/bu*o4l`L?(d2WEh;@*DoW*=O%)`a4?g%kr1r>T)1u\-3bK<#`\88smU':T2WQ@]AI<SR*r9S
nNe'>[89rqf`ZXrae$nZ>3G?N40ckbTMRPKrUh[LPRU!lSd@d'-H1+GHf$1qQdkIlDOI>_j\
3E$XShI#Y4!%&<X_QBrpq,I_qP3``[f9Z>o'21;J1i"ZND6,s</4[K`>CHT791/%H[fCsIS&
:]A=GESX;Tt-4SZCB5=^A.gIfXk;=HkFpD>2Q#+!DN</O\^*;eto20$i-=/Ef@EsXg0&MJ58u
SkkE"K\=3D<:8h1<'.LI2.DNHoISD4,HMKP2TisK[;7?(KK\lg/>7IkY1`P(tBG*?XZ('<BB
QM9^.]Ah!iU"l!!Q^+*S)l-PoTsChb.,'D[R8t'\S\KV4cqt:(+p_JhUS!"WL,e@+ll'?=<#U
<7+Zsm-;[@+-c_"T8-g+VCh=:RIZ7FL:]A;Qre*I.E)[\KPb?^)kC]ARDA:9N_;]AlPRn/k@0W%
T6UKC;gc=&H"k&0%A:\01Ft?[/Nob%'U%B&.,4$eC8fZ$-]Am7kG#AFPGf>[WXEdT:na+GOHE
<kQWXT3NaP#Lt"5]AbC&5ogkdWAm+2.:]A6?t$emk7DSPdsjN%f%k5go%]A8JIrNas6rI^.AqG[
VaW0/CnBFJpjC3N:5r::uY@[^BRK(*jVpV,-g%jPgl/L1adu2@E5@5MGEXqU4g#$$_@-e<+>
0iBtI#ucGFQRZ,f!$JDrh!E6J,h<FSC5f/0-o-@Fn3.0@O+m*g`@Gk:oD,LQ6eC:'%d++.BT
h*o(BkZ&h8P=ciuih3cfcAN+R`?OJKT-9pdNDUZ>V;21(*$'3P4rN[[gAr4=I5/s*:hJIj3G
/*6^WEK((#8bJf*-FG(dPjJ-/dXCM:Y;HTT:'(EPf'UPn=Y7^IOs=i53d#RP<(CFH4$DR_^+
"bLZm&AVED=Vlj%`fVUJH`#]A!^*:B70M0gRT&R!,9$D1R^oP0+NQW!@bgbR2"SekOmit!(*q
"dKV#VP*[tcO-85Z1QI7LO\:6MR]AYmuQu.pu<$V[2"=)k@?mbSHV^3be?ALBo-%/Q\400^3T
MD!cnG*Hpelk@_fP@HPo$BaC(qs?W]AmKN;P=*1LB;lLm:'VM/M9B*lg$S6M*;^^sdtJ7:9T$
Di:c$MM(T+j3!6:1M\QL&PZ7@]A10M-[UI;9W_;5NIQ&"S8:G_dQ;M'W,6%6-/f:0[U$Y%$Bm
[_]Af&(h)5V9q_/T#Erc7Dr@Cp'*%<596.h$O-=']AdY*[Ppo(8neN*r*=Gk(dG]A(k5"tmNO_X
WQ?=lf@!q3nsR0?6+V+FKM"</e(,;tXiFQacONXs04h4c>s7E-D%:Q$\E(]AT+Rs/f/t@-MAf
R4T%!qND.uXnOItXqmK]A:R>8X`77t)WP`O[3U^1'p3K#*l56BRAM!G>e.t$A\gZ3nj=&jb_=
=Hg51CUJ^7l,i-crts#CE.8r@]A_>u^OAe79N*V''\4O\2Ue^pU9e%UEt;$AeN/oF"L;+Z<a_
92FYH?[91d3-6r[u>-3`#Zd(Q;j/7q#HZ%o&-Ekl9fIg+IhA%1=kAWp-,PAf&F/l^au*\#pk
m:`&eTa#D*%Z(lJNpODBOHK)_&%H:lDY"u)D1.K)5s.'cgD03CW6oHr;S#QQ=h%lln\(4.Yr
N=dE7q=?7QB2WI[(1;4g\3'3B#u.T,a7FE#]AS=E?&9"ZH6_HZZ4A@NR!+VJ:#sb\^1@d<(6*
i7pQ0f!]AAi`BH4\C$:EXsd_?B"KFhsjS\?I-\/%C>NX52B=#3_JgM"u=%TKa=dK7.eOciiBj
r)<8WBVUM#fF`n!ODmil41QLFtU`SmKt:_#_EX;2U2W]A)*jSc-0X-_c&Yjp=#r9(LEBT(i_I
,mE'(D!'4fYO_$=oa!pB9DR]ACEuKPPb_Ui!hYcGclYi+Ni*&@Q,Sjj+D&-fn'Yk*`>.4j<OE
))I>6#sBnjB9>>,')ju.+IQ8b(P&>YEQC_k%We3j`OKP3gA1eH0@%@QjNT!q?+^A-gSiW*ej
Wh3cQII99e\;Jr.&<-)\P'!N+j7pH!R`A&?(f:Ot;[gUtFtQkbj+$.60*>8S"k\$X4F4n-(H
f(@2#$[WaD\k"DLT15.DaRYh-b]AY?Y53P)$<4r6^'C?72IBMuWO?EK6W]A&j+?W*bu:PmK]A/F
gDK*B1g/d$u[+W6[YW]AXs"2"G;L#!9Z'I6XEC^/B\#n(l\7rg*2Sed[>D*g+sR]Asn^nrHhYo
X\[S^8ZYaDd>beY<d_;fc5VLl/f;jdQ49dpt3?n'`IlJDj'-Trt=8Xh1H`Eh_=(1sQ2L,+*:
&E7Gqg0CO'U=8`&;M33%M<oDs/-$dr41)"W@=ENtFZ?OJkYkE$^-;.Jq`_=QJbJ4AK)RLMB+
:^Wes#Xp8/QE$CQ&(2S%oL>l`LB-Fd(&ma-rD.-G0?U1Q)*!E6nPu=9NuY3;IfOEgTk*<DnC
BX%p''rR>$*_-bU5>Fg(@8MksuF.9Ep8.ob57.lfbrIS3-;#h"r5#AViPT4lf,WUAimjX.jA
ps3Qs+!;`ekP]Au5Q.fLq+>uMOb!1JRDamT7;2ao\&Ohp1K^<$HS(tN^)PNPFcQNTk=ApYDe7
k>#+M&`e.NM<4k`RR8RW5`ceTL>@NZB`-'`UN:9"Y@"]A3,P'e(T"!fL'n"DGQ"WW6[n<G53g
/QQhRR,gr%,\XTDk]Ah8_GpXsTft12e5j@>6Qn1IDr;o)gBX9eK"?A(C9$4/2s(D+ncdZ3W\,
siiV;NUTG4/L@>0!n3&Wf1.b,mt,'?)X(%X"pk-k0s8k9.@<EK_hAS0_,.I]AjVf4FVg2RG_:
@.e/!+[R^,b-N`VQ[BXZ2!s\8hP;9jhYNbKmXNZ#$dr=%d(@]A<*bZB[]A3uaJ=71n#^D-aaaB
s3&lX2-Z_ASkbn]A7+"p5Xg`F!9[?,Oa:o<1_I2JHI['@&pU^(ce6adId7Cl`]AM&n/jD*5qf\
[0pCG"BGnD>H/jAW'MA$_o0oo:Ir`le=8fR3bLXL-q?qDXDlA;L^cFRC!f4SB3NP5_D4Ve6q
lsV4E(+sB0kc+q<FA)_h6OUm=`a$%H0U$j6V2n3-)aok4pPq_6,<geO'/hM3Im'"4NCH2uc&
,_hL1*Xe2p:*)?-,o@VYloQs5PPrX*&<15qX:m[Xr&"93%ce+Y?H=[eP!u[C%H<Losq4N/Jb
.onpd]A'f,cMTnOR\&&U#N@STsPS'quJn_5c2K5O34BcT]A;4?3)$jpX3c*%uqKo%SC`6uE#@j
YnPcZ48RCUA[@)aFR4\D6h5Rm&[Z+aH=h.'(FOlX)P7Jj=7t4/CZ]AC/'uo-Z!'Pd[B$jSXPs
)N?VP]AY/6NboV.>4W!HDei-!Winii4%&K'dMpO?%<JeX=>77%:n:J*KVrGQoL_qbtFucF++U
?JTIb(:_\7d%'11jBj$<TcQDV2icF_^I0k/5q1r92KfU.UYd`"d98lH*OhHgBp5s74o!#VG<
pW/<VA<.;)Au?&13A'*W(CQ,/h4t-]A-r+#)FM&3Dmr$%?(<0,"]Am%9\%`El&GTZU=*hu/rL$
A(;]AXWS*@gNjf>J'<EpCH4b95-TUC7=R3/3&IB(E[PY[Ril^9PrnO#k252MK=Jg<fpU.l!'b
.pfjf[(=D]A3>g*H'5$22mi_.?N.p"eqjC'&Y%jUfBP9Zj\F;A3)r7<F(&Kqp";uDS.C!ajk,
%LAJE<RnJ?t2'8RLeTE+F/Y79B=\fb>oOfAA5Kh:OCUV'qH>q!`nAGN]AM9%lnf>bMJ$=G]A?l
`*SA`r*\RI5ZT[$SqAc;(T0PSp(Yl4q'84M:'2c0P=<G$ko'J?R&RZ&A5r+uK8^d:V"Kf?ST
a#d2[V75__R(gnuc+,dMk4:lV^rT<JP@VKiZ$5'*b?"BT.]Ad871F#Ob?``dO@M=2L69)mA"@
h4eXC`=[i]AGXlVKgViBjPo?/Y^r:cm"Lk\oaZX7=9$G>1@0]A7E2M!k(<b:\7pDIrEm%r!#N/
,O2!/M6q!=Y,d'I6(f_.]Aghf,mecqi;5IDU?+to4pY\PjKM%g(K_Di8JfQ5G(^rYe\P]A0'U"
:7KEG^f^Lpsn`!@79?rC3Uf'u>@B$jX)f>pV;h()p0pDVYG%g"$69SQk;mCG*I$*,@HZS5*X
a"!1-6<4aLeNlkuHbO`#3,V;9MpQb4]AS9mN-0*j4R2C_D.kt1cG6-NkT8^hG(Te^9f0*A^<M
n@p*TD9YomI8c)J>*IhB,F;D+9R0^;b'd8&MoIbIhg@N?iEQp`FI6<*U!HJ(e'Vpu9.[T#pX
c3:[Q'Si6-/n_f*rqQ2kf6b^*tH)ogW$Mi3S(-[1+6r+74>B4<@Q^J]Ae<G0m<mG%2-hu>=2@
!Pd5nDT(^9q#h[='1g8lgfUjNB!eqm?<O>]A&P?!XT8jXKp854h[%p4E2LVg>bWH)fl(Q5209
LEJFq$ZR55fEfeBmq'dMU"Zir's&1WFr2T\s$l]AjU'3UIH]A"6R,(Ae3H7I,GTmlOhbao=4pB
E4i.3g0oX]Aol3tJT+#BG?rPFB*V`MZa)hJBUuHJtZ9nr3#_O-;2\A)G&ET$7a@?l1o%JG^"e
hQi_39dmhsZPfHrtM6/&o8q4h7Jd@Bb/&BA:tk5EU;Q-"`I@2:U+oLP0S@8*&6(>jW"!kj>/
.a$:W.Q+DL*lcYWs)8OFiCk#mArU5@Y)g=A;mfMSN@[^akqVEXIZgt1V.4P'&+EjA'Y0XL8-
-g2aU8Q"*9@1*eZ[0FffVaN"[WcbFa,Z^;1q,-lc,\)<^7.]AgrSmQWB,t>0j16i]A*f?BJ_I4
"M3$kaT)4s@"O$%a/OV?9jLa-Qa\e!=/4OL&*QA"N\bfeAu9^_+6oJ/2&_&!ibjE=dQ"eeF#
f"lY#,cgm#b+-/g&X&L_X_u"Z/D6tL&-$)O-NQ@.QE,NOU2=\UOpX&J_(P3lQP:$[\F($=X+
9K0$s,pb5kWIapDYobI)*6]A@PC\(F,IZIn%6G1?s<a[g5G0a+TQ7>5T+qF+^Mq]A8.9q/6#4=
<@L'g026Pb9"9b.giUXCnNft.\&=J:XK4sh[a$O&;@\h]A90ml=eR)r=d+Sj4+q/pSrJ^\]AU?
d=QMpr(Vej86\_'N)/$L;i@'@K,ucUW7.On$?l\57R5VpY7NA`;9bhX<*^B>SPIul;0F50gr
D#^/)]AsV@=SB.V9a90uqd^kJ54MPT#BPX\No(8.l"3Hg7U2]AFAHJ=GVDkXE0QReR5q'G4:fX
8^Sc6auODYGp2Sh^["oKM++/$SP<[)Xg^o$(oF-H&:<^XCWY;o\VIQN!qL[E0UV3QP]AI7I8n
L=D1o!h[8%;^$`t*mbUb^4^,e-ULiu_nI^1KMs]As+#thPbLZ7QeC[<uPVV9QrApaulPG'IC[
)>@Z:W9"pNLG7pEVDbj,,GZ;u6ls;,$mHZ>&+l;HNfaY*O21"=;7_"Ru]A@jqmj+<JqI0gq70
f=g++.=c"PE/nBPAjsUqsTnK-kqFBhOHtQR['B$C8@^H&hPcdH@8&&es2oJ`SOc?SQK?9+Be
[VF!u(GjmNC77u&%ekl&'Q4rod-.F$`5YQaV+$t#5a5L2LO==?8ekuH+f+Zug9Ei0G!Ta@e.
E]Ag<_SC).Ram9#$;o[QC1Ee!q>%M<e(XEd,:ZiTDk)o\_@A1tl6-a&^PkC]A:oq4O/l8>Nm01
3`ho026j_9`E%^J-PKW)kX'!3=tSmcr/N2E_dFOMJK1]Ai(h5>W$"6AU9.O6\<f@=#$og#*L5
(&:7MihR$o#WP2;bST]AsS+/";8A9\+5r<2#)`CWT4?'7OWrZr1RW;+VWho2sf-*rQ`1D`)q<
DT]AR`qDSTj\K=DF8&u$MlS$&EYb::2O*47pWd-KX`PjU!?>F\U.#b>PsKK_;oZ`>mu_&Pe.J
K)iUN'%iinmoEm-E\s2ut(Z?J@(AQYn-s%8u%=%:WpnKsdk#"ni+Y,@F6:_\iPS;Wg5#C.c"
)>D5HY(2@+.WFj(]A':Vp0WbbGekcGE%7@=r'k+k5M8X\(#ifM*Aq?SA36s%oT'H$W0>es3Al
GZg/sWjoLbJ@(^B01i&9$,beti2H?@CBg&f.1QHE.6t%"=l!0k2ka+c["hh<9VKm-=^0WXmk
S=eblnj1?dVNR,MLLr"2KUI;\5_O?Rh('?>Hq)2&+)63*`G@rQk&GsqX]A<;amJ6b0p_p^49G
Ac8e.k5dfP_uW@dN0^`4_0U/&S+*"OI[HG5(;naCfFg-E\13l<9V=3N?!'/B;Yo(j2:f[s)-
M(G/,3!mPV1<"ER[T<r,G4lCD"f)%nCebI9Prli-e`GMk(rlk@b$4cj[)6mBm2PZg`kQZ^RU
-r5-),6h9Q^Vhs.=(IaU=(j&@3ugKG*V5Y6CZa!cErM-J*gFWU2KB26/s-N0:]A0dU*U'^-m;
Q2Gl)M0.n!C!&A*$`nR/CSenX5[=64<<X8ojldhIt6<!p2%uh)&^4rh4;K_q1GDb_Z)aM+9?
SX8OCMG^!bMSPNFIj-_o,ZA2Tq!j)H:)MK(a(?/*["&.4C4IGUHm"j:"2LoXl4eSkJRuK0=e
m*tJo`+3VMBsSbAhLOiq&EL=Qig:JON2BER14p>*d^S..Pk.&&(?>hMXH:/L12<a*fWo^,<W
[uZkuY;FCVn;bu2U0AqV1rnC5`M,PXVS9nWLde9S;>AOB]A;/rM\"+Qks8MQaS;,G"#n1isQ3
=Ca-&RmSJ*%'t@&D-`otHfj_F;+25%a02S=T3:eVfn(!JLKO2)4)aVH8Fi&5iSoD]A(8,Ls/%
s]A;mA>C05F"AP#!D$f>Q5N@P8r^i-_T5BDTRp>hu$e#S(E?M.OORIDB`GaG-9jOEQ.n5UbFp
V2=i!lGikb,XlC&;\8pq^RDsN0:SM'Bq_,a#GnOt*JH9P*pk"+!Sq<Bjg9cmlV<D+CT,L_q@
og"InZ<FpO@YQtl5TLAO3ks#/pl1sP*MP3WF!Me,]An!Is(3os>&%cW`5j!Ch?fVn*_c(*-&<
b*V7)mM$/'9BRdZcm$.(Q%p'Ah8edb&!?!Tr?XHG2Cbr1'_dIc(r*g74ap_,bh*>UNZka`R:
EEe+%a<(H3MKjOg?dI@jj.P+$G^2XrkJfs3c/l5\^[r)Hcl3nV&2;TX_'/7*9Cc+ag"mf]A7)
7G++st!N8M_+.ZsOW:c3!s1Yu?GE]AS1Z)VOVa_'\"(]A`AJ#<IYRO11iM/3CT]A"6R/1UUSSZr
5WQ=s]Af"6*F=j[EfJ)dh4WY8;YWQQPRV/<*`DL#<X$EGsT'p$n(Qj]A`Z>d"N-5M<EVc:D;0a
;\e;i>qA)[1A+>\g%jW>EH^PkT'-N!as.jitO4\pa1@a`oO$QkYEf]Ad5TpQ':qNM+A%,OUs-
uZ]A0j2_2<X_33gd/?W93jN:5F(tQaPDueZ/$tSqh/e!Z?hG:pYcb^_9u74ki+0M0dl*JoB.)
JsWs^R0>/tZ)S6@Rj'9p"Xm=Qe+DY,QF-<'-'Ps"p"KE)Vm7RG+;Gj<?^Bqf6/;QO4Lg7T'Y
]Ar!;0J)1*tOeYs),_%Np8S*asJ6efolP;4"D7&Z9HE>[.9dpNfM0.>e#<2*r4s3SR(GZUAqB
;d]A^r#<&^I/U+&+"iUr8QH(tR8Kn35DQUI5daWZ\f%=\%8EKUgB5q<SbHP8P<1_?s9h/k'?1
gkTGrACX67-j7A!,%?.c'(4&&rVTE2Y'@=9^sQB[C5[t/&\#cbp"bj"H5/b2]A'OgMCqiQo<+
N/NK0N%VKo*=;qj(eb#mDir?A@MUJ@0g5qPcQH.T*G5I.7=.Z-*K5P.#Ti9^!s3t'X]A%OQo9
2KYDorR9C#P^9@Qj9Nb.%-:N+OshcRr+!\kXG+0#q9d0*(c=ufdJEg[\om:oU_`slJ+jkqmB
HWu:A9b*c'@6D_n1NKkc!`0LdSDi9nlV+ij#<U*7&2-V2F:A4A\kRa4s3rYAn/@9%_NdQ$1n
m1_DC*oLJRO#%BDbJ:cc&dD,jXi>U@!9dYM[)ori(+S2(`ij$%cPZtI6iiBi[)E#A919e]A3:
\N$L3j4D#1]AA`>NCF-d'9aJ*D68UXi.BgD[I1nQjio@>l+&dGW6i;kE*hb+%c[XKPLnJ%=W`
)Bhn#5eF7[N(-Rr1t1`i37r()3#DBN4#M!g&UIVar-9gA,Kb/>?W5rRZ,efaF3^"4#(^VG<5
YF8.pbkJ<cIsWJ6!AM:g_mW&MrcW@#m=**sEskR+7us%&Y$ZG$>cWo3b@]Au,\0q*grYPA7[p
=Kp)P1<u8lcMV_)KNuE.0]AhYf-5lX<?aiT_+Of`?H*hfrI+VN"KsiFK>/'EX9ZG<d5)Sn<>p
GZ`5U(g>KGhD_im+nILn3Zmf?1Tlm>]A?cu`-St6%s#p"*Zc:"D4,=KKK[A^rET%aSFYi`Oa(
9!3KUsBhRkPtU4dgKEeGIjNZY8227,3EH.4O4W-4nr:,I+$ADMsU#2QS2_&P*X\\Gl7?Aqpb
CKQ>6Cpao,Ac_T?ZD[]A#G">IuhV(ItHt3Efk\04MY,.hB]A$Di'tE2fX=>a4k_PH:or]AgHj^E
e80609A,A>0hDc!G6BMmP(e/i%hDV;DKGH]A.T(K\!sie\;h!OR9,0@k)PCuE^3iRK8c%R0ed
<;q5W8u7["#F\!([_7lR$*gd!=S]A@n*:LPB;tprPMIQp4l"b!!"2k-tp@R;'s8,!sXC;2?a<
AK="EfCTN@b8a6"2nUpNIj;4d">No=jIh0<-;A3$rLII/V%Q;c:be7dsVe-%mDH>;BZPM0"-
]AHZI1O:RPo3>#Ypt4C*:6d7QnJ=IqfVJ4hk-MC9+2<U$KL-FPC\\]At*o2MOZ((VlJOes40KA
_@dU*kUWWI*nOKYSpmU`jWkor%Y)W%Pmd?520X2O-S`>N$-8[X]A;U>U4_Q>:?qAu1;.aLC\;
6=Nu_nn;06p@53pgZ3MX2mi%HFE<Em3sA_6PuF)Y%E3_1[_=RmN#iAodLGt=4Lh5J9ClW7#`
AI::bf6*!TA<.F'nt0AZ5nng'(A!TJDWWY=tm;;h"@p/nOheXGod2MkRTlc)UFcWm7pgDVI$
R7G?%hoY!&B/#<i`e<_/*NL7M,PuMmBJm[d+jO.Y!=2uBOA_?;_Y,k:*a#_oGX>i*068o+Y4
!2Npb_]Ar1r*J;FQ_>2f[[IX28g>0.9%!_HjC!!CNQKf*_6cuV\2Li#]A3[B$!W\Q%([]A(%W!&
^Ar\@UfE`2pBnbruYCI*O3W/U*[:h7KCT8l<Rnb^1Q1L*$nXEkou[;+uCgakb"kKqHo:LJp1
U><=cQ,_J&2S@I0HVh,p?%P5..N$]Aef5RcZZ"BYHB80N-M0j*.X58HZ/$qbXpN;/dSdoe809
.f+i(K3K/'ro>-2R85Js3F:1TW#CYMtF_peoaI`fg#*3qWrkCL42I/rO;(r*\N'%-iGn1?VT
!nrCoICaq$G5s\pe8e">4f9C6?fg!Xb6P#d7&Q\VRn9Zq9>[XX+0Asb&/UgN3dt'n3?$<glT
7hl2Zp?EhPCU:saX/,)1H<o3=OUmuTjE4J`ZdtLli%d@i,n#&ihMs'C"GfB\MEqEJ,W&O>^H
>RMqJ>(XinJ.hq.ni/T#UoNCqAm5I%2pC[.k1=s7`[S&:T%G^L[cU=!7q2E!1AA/F9j,?SpH
XW8GWhWi`i3g"5;$"*R`1mZ6`Eq$^S*KX3?NSUTUN+#*6,tPUGVtKORNK3=/5DVu]AThC.oCu
p1m"I;EpqZbhr+LsC8`\Pl8,o.\W_qDRt.kn-bQ9dI8"i9@0a!lp^a^-*"oRU6Z0?BNt9g?$
gqps"=7('@hAj%e3s39FgC4tfYY'2a-*+:C?IaPjWZTerjl(9Ae"5_HBS$mH6;2j*pYSQ,"^
=lnKD5KPI3F:Z.=-;SAr27^SWer1trP'o?fOieS18e@Yo:SUA>9c3#Dp,8oZQn58Sq^(Jj@.
iXJ:$t)ke1#+r_]AgFD;rrUYG.S'jUXE@\W[fg]A<1l#B3(tQK(1&KBCY;CDRN-FqU5BB@A((:
1H%#IQdoucG,@OPH0(/]Ahj>->e:#fTbB7Hhm]ADb'nHd8:3*qP4<Z8=;NVH*9W/OupHM*SeP$
+I/jdYTKN5F?GZC5*[8+c_$^l3IpAA<0Yl%[cdF&DA4Z;7btDV`fiEGqea(q5At!-&B+TI>#
a"Z")MqOBJa<:Me]Ag'rdD/m!Oc(b_.b'J4h0OAV)]A)04]A";k$74U3-*JC<;#i,>^qBpSMT'[
tEBB1>0(5p#qQC?ssgZ;I4prhr"0WQbuX*ZesBe,2s45h=N`.TMJ4uo>JC4@;Q=#a1hLjdpS
@`?>]AGZrT#UDXSM@CUC;cK(9J?BhZI6]AFjZZo(0?ok^/6YHgSWYEX#[VmZW=<98Eg*/+/+i;
eF-$=XW`&cE7IoY@;P@gZKY@^1&t_^r\+!39JZsVcMV;9mS$`m\5!?9&-W=dacC7ZS=R+SD/
>W+%q@aQGlXnBAgacrYBbhKHFqi1!%7N9T&)U&!C\RdR\gk."_5fL>ARVOA,rpD2c]ADoW#,#
A^Zf"bX/OL_9`hE>qo^`g1is8Rf62DM^NoohO<(5\*el;PDS)!nVW2IulWR>jF/e^+-,*&.!
%2FJ'@RRdW7a0#deZ,1dCWf0&%Z:7RL:aYh0m=PrTJVBREJdO!`3'NEG;F,/XZH@935K4aRj
?/HtNOQ^ZTc9qNHXj[6-t51llN/nEbB+%W.tR*qWCi/%o#L5!Hf_2S%0l-L\;P>m,tRfuQ<u
^<TJ`$UMmT28L+$r;(FZZnX*3D_>Z."".Y^)[']AbcgZQ4K9D:='>+I%m\.H:NE%:J"9@A@m3
%kWn0#M\V#T!:=%E]A.]ATds<oqCqp1JrY9Y(!IHjV*m-_$@/TITP_IQNWA(G<X1-YqrV?fq3$
'_ik=-9)*4BK&1,=,KC&e*uEq]AL'=YW1dUuW'`n7!FEWhL?RIUI[IiL>j4YfOY$M^jVQY0N5
+l)dK<I*)]A-4_j20e_TLrm*2OU:r"HIGiPemo)tCsU-i714!7_UG.KWXl]AIWQj[#9N$?M^GE
>sml`QGlRqJFl#;G1=`<Mp5=Add$4hLG/9"BK_LDD[G%LMra05;PKF+D%*O&]A4//"heh;?o?
:g3Yq3s$J[I_^`)ZD__IpX"SCFe$OF#od9rb`O^S1LcG5g,93VIqQ-1jV:%^g\0U8WZ"Ki+$
^[=!8Q(`MY2VB4=1`)YE]A:oU;pK-X.>pnanAqpRAbrVi+*P]AKnn2H%"9SV;KH<ap#Q[5D!Js
@C6i:#NmZGA=_nYmj8QWcK('+lgLX(!1enW!\dE"^,eD!V>A8I)DO3FL(QMCG&<R/]ACVlLV=
T/Yt;(c92`oi*Y?b#2#FM%"^p!c8gA;G<-Y=,pj<j]AOZIhUN@CPRbG?>h&:oZa.EPo!';a7r
@UN/^K+S2:RomGPEI,-:#T_-X>b'buD!S8pec>-3XE]ArIWNR]AO&8^o?-dQH4C[Z9CA]AQPE'X
B9ko,3o\dN/Z)p@,rCq4F5^]A5(>%'L0RHNh\p]A@K\+&]A%XiXEh5WoN;o&BX='!ihQ3OrQe#u
djVA[?/(hU2ku>!nt6@cW=&d)%&N>^u<7(?]AD1\,X<2GB`d(!DNd.5NcZ%4*(ZdWibetD/il
re2GI?^OH]Ap?@0#a_V*C_qG'85;ThYV\Q:jt(J`/p?>Oqo9?p-@<:B%`Z5\_]Affj4".adb,M
,3#*a5u-:r/o%+'bfu?PrU/RqEqn-U8INBK2_H[Lh9$3V>k(`P^l-PnMq\\h-`/TTa-Z34%:
8l_;>sIghOOmBQa(\)b_Mr+DMNjmcBmt`^Fu:PlNHu2a9pE><m@Qd[/apQj0-qQKccLnC%]Aq
+D,.>+A>.^U)sOrfIV:YD?smCdF)P)_M1[!i]APthk]ATI'"*n!5f$b1SQkpYk$jhdHh,]AF"*D
,,:b>'IR\F>l\"-ZRO3u6T,,Rbf24iNWR2ni9tmG$7LD0'Wj`'npHXQ\FL%W5L0P$:fpPF$P
u<;O;9:W!O):>[KNANPmDb-Z.8ATG@sa7f)n`HA3N\1c+lT'_]Ao#D!Fo#'s>A-e@SAXn[t8U
>Ys&FSEK-A8f)eItjD;R3C!0X:H<'/?Ga&b-c?J]AQ^^OO*%2XUipin=C$^+@9<<dK3.MBOu_
@D$qSa*>PH8U&?3XRcm>LR2ADB*;iZ?b_qPSr%tGC/oH^Y#_p8m!A]A%*aOp<g>r=!0bU4e7\
+`b0=1WPIW%fZ%ML"1:4[.[Nu7Zb[R(M*9c5cc(9B!,#Ec6X!3mEDGS`eNROmQ@<+R@^25@9
KDcnbk&6#5VcIC_1;If7:EUdpn,@=2-/Zp#O5[[eBD0T%gaGTAa_FF1[^!R!@"))"irg^N0.
;J9Uh(PXht2LL&/Im>hk]AFa&a-YNT&ap4%Le5LJd8Yd%q=RY)1h#Z*-/8?M:V9/^",2.(+"0
9<Ifl@iIuW5>?7&cAc/YnWD1#R`\d1u?OJNbLeSdR<S'*J:GKi;"$#j/QmBD..i;>--N:9]Ag
P3NNB``94psA/\9Be_RbM/Sal^2gtWi7&X/]As[VrASH=6+V0CE%e6rPI[`Kcup!P]ADI=e1_F
RGqf,CrtIId/c6K+hF5NCr[7#]A]A$OIPIU!CY:0rHF6_nC#WZQs%ODgF+MR2@WVI#hLUb9c9h
)L/g\q!<b2*'VA:^CMJ:@a":_Ib8?$bjlqOcb\$YpluY]A'?NaL+cD46DcGH%hbAkq-uIAeX*
AitXtG;S&rp@u(CC.5eN+_;dTGa9Q#R5/aFV>u:?DAkg6Bfsp@+&URYq@hIhcD1NJ_d(7?+V
J3[G/YJ>jV^]A<@&pbqUm43hF22(8U/HjojgRu.O,HL=sE/:eENUr>?;oF\u\LbilmO%,\eGh
YB_?35(nam(i`KGoX5DW`LYU:'D6'.4I>2s@kFLQ+l[dRFaC:8SWeC;P>ZX.@0E;X-JbuW]A%
!s#Zpq:gm<XP7*fO8]AQM9Y9O/q53caJ/YVB\%m$0aPGR=")a%p'gA1SXKJsl@Wt44pZ_4h5i
1:X##b(Up)rH?l2Q]A6W*$V!=0ZcQP#0h-8TMc!9Vl9Q#[#;(@i\)=W5CQj?ebk5YkEN'O+'j
65EWb"_;QpNC*hnS)Gn"h5+8H5ku6.7G,ddjgIi0GAY%O8I`3SGf.`I8pq'4)h`ImuIHnjmX
2ip)URqtC=]AhkjE_VhL_KtT85(qTSmrkM%_!fQbHEE43bg,+J;T?CAhs"oC'"d#`jWX5q/AS
]Aj_G.Ie2gZad[c!K(.P0>W!9m^Ng!1g0Bj^hiGs9:K7YJn;k]A,.7c9SXII[WOMo$1,l\m+;f
mE(QK"`(74GUPH(-RT4P=qt)r4[/?ti9dXSNOk\dk?h8.BK,Ei>]AP2C>JfBW9.KB_d5*NbM<
WcuZ*.*r32#KFh66>+bt'%arU,%PHS:mX0Bda68%*@12i@u22L2LS\T`2hrgI\$qZ1<t]A/bP
kY`It`4ME_enrh)'T>jL\cI8iZ4=U))8nThfLq-d/VsBduh;FJ)a4h<$g`apk]AO09XK5ROOS
VDNi5`q(WQJ24Vq1XgY[)JXe'Ql2RJfapiHaUeX*'gE0r;HMk+Sun3&W=EfJtrPrj5OU(/N[
H!LoR!:0$?8/8B:H;O__LXT\'J*i)i1781H:IacUbI5L:<p,&1Lm3UDW(<UQVUQg8Ir0^5?k
;A0:QOIBlWb)?o?-V-Z3A/q\Efr"QK8cKsV.,i1#'IWD?]AHSK$FA!0%d5(/-Qfj<YB,6mc9e
n2/$Uj:Nc2?ek6A3'hH.VUs97ReN]AX,0H1\_MN7*mik_ZYGK"0A[+9Am^U\$i/7pA>UQ8p$F
JUM/M4%??EGB>3nAJW(3)qBi.4FWso.9E0@<nB,SjS--tKg3u=mO93P]AMJOBP?HkupgjKn@`
_lc,,%f.o#Wm(Dk"6m]A]AFlea#L_\g_)^fr/kn?t^P9Kp3_/^m!btU@[f7me\*]AF)hq!m/elm
%#]AN7nH>CAU4mdo*0K*(TA<&dO#k"n]A`#\PD_:^A1#QU3kqHOK;'a,RKA=B]A<XZ1^J;=!,>t
#0ufcYp0!rOR:CRe3PsUNW-Zg;/F_008Ab/UKu#["Qh-uj'GM_3IS%3/*cWL4BZh=(eGE"qR
K\1IITd,ls@kWP/,<-jQT9\"eGX]ATt)@d3-=OKjp%j+G,?rIFJUF2/@7F:k!d0D.]AUS)d7dS
pd&gH@0lX/LVJoaSb^F24N)>g`k#iW=3n2^"G0=ccZhnJ5UXr41O6!>'fg!-JIW=Nj05,rl:
"h<>Ut:TB2sQH=f&d%$+o.bbAG3^=TdZtp6>\EX<*%*Bq=s_9AA]AW9QB/?*X>Oa&T0-W^&dN
W,-&#r<7m)%c@-X%er'MJUjr638^2eXA+B,7:'g(1W=bItkBHGCh4%U+gH[@O2NXH.EqYj+h
?YI7e+\^7+V5:`uGrslGR5ZmgUnaOd#H?nS]A(n'N'T@O;LT+VCQ5&K@HFJmQmd:7,R4GTcif
<h*5a!uQ_>]AbPh"<8\Gf0p"G4""]AXW;G\\%Rl`YbhaR"!f/h[=tH:*OVtZ0btH\@Z6UU(>gT
d"0T-Mi^h0D(6GIUR3i;8R+'@uc/-2B*!`XH;!L*TXAK!HMu=A4fJVA')E=\47-c[WD.`Pm`
W>j/YI4A&[pI3XiC9:iJIr[LUQ/\1d2igJ9aA$:":<>G6RVt"Huo]A?o?]A9GPs82tb7k*>oqq
o,kcr#8YrOqVXQuDQPApcPep4/<Q/_\R7tt87,&&9Uh^HX]A3b*i-!H2Y8r2r+V6=8V3s*O@4
[khg2i2r>W`W0R2k0-^\V'[&3%_&9?OEAb5R59p,TZ/PTFQ(YGZ"8iTlQaH9h^rFB&`;J%hA
S_<Sr0lt>9S79Ji83H[>k"P`8t>Xk8s?>"\/k^ZNaVK$Lp4bQn9=,JF1#iK?=#:<[%9.Npjk
U1Nqkn"u/'kp)=q$qI!=,m8=o$<9a$-!A7_=fui)fBA8"4/lY2[6n&*9q/bI6ICP`=%u#H2B
Z9q,IG'c#8j7$cm@'Q4.,F8^Oi75VWM!/XBo_Yfe&+#c(TI/O]Ac6JP9f)f[#V25-f""Tr36\
$5qIIkPo]A,gKq3TH1P<Rlj"pYsa1e<UMb\><QUWWoMYBK2"Fm:U:.U2<mRu85a9"Ur`KQIQ;
%NH7f=AJ7n8",q2l`=E(Q>*W\_H8nO<IF>m$.lh$!>Z)O!!p!AVdH/fDjOO3*]AXH2!hM:Qfs
-[,F_"g2PtS$kU%R'/E-q-Gm@V,o^QU6'e@sj".ed:H1`R'i5c/7A51/K#/P:Q[:Yc2+D[,e
g!shnh*'$3D!J%onKp185^nLb-?Nkat6e71[?]A?hlMch=RS6NXWQ$hFE1pmQ;+He^B4D`2`_
%(tLa>eMWI/^Vsf/NW?06]A'$^?#;P:[Bm--'kSglNa4b-D3Uai`f;[MGDW(0fD:_ko9Vb=e.
K2FcZ?Ia0sPFo0pH!jd%WiP5hS?lgTZjrr4(^at+EQ8:t^c*JK]ABOVq"c7V*oZAZt,B;,VT4
)VHon]A/(+5L;N&2UGK50j7bRsqgCSUJ&&a)n+UT[a8::G&+L`m\9H[<GQ0X<c,YR+FYOmMFA
@UDrBXpuUPJD&FJj/peb0\_r5Y\:g1l@@GikqPR4n(:G[1YapbM2ac12p:iFCp`DuiI%Bi?&
ms'TdTSa=cLqr-OHkH=d]A!6:nR"pG%/O^IWKTBLs]Aq0)42gQ]A12HuB@"l%%OsVF*9YEBZfq)
fF,SH:^'O5_.,Zee,i9p>dh=PSo^%rp5^$4do!Dr\D8@hXk9$$4@eJjlbfR@)UV="6>2ERQG
C`DJf;gY?!pBZ2p8Ca1bL62@K.4_Uh=rFBKL/P461Tj=(jsb/Ydg+g8As-$eun-B<:"="s`5
dLYJ5"u5LK4EandpGPS:p4,LYa]A^!ke):#)JL$W%%aS\0Yl6huVtgEP1:@f<fN0!CF0VJ^%h
h6LcigVHpa/U>r-SWWVX[GV-^@0Ik%#,CBi,"`!o[qMec>*tj[[&826>iiH+3qIXG^;r>!aW
q7P+P!1!=a9jF&!KH1[N8PAapCrX8ch6m%m2^a$o)?dFsQa269WH(Q]ALJZ)j=ZoH%]Aa?Z-g0
V#"MReuq.T]Ae/nrB"J7)RVC,+n%Y^fGXf$FS#kTR5pe2b"JQW.((d5)%O9d>ns*S5p5?OT32
DV5@5ufr0a<fJZhWqMM_7RO.Wk,AI\]A*+B]A[7MGEn=4qahsKo$O&?3UXT^qXDa\o=jA\LLNB
G$\O@0<+XZMa2g7rn%0lZLM0#JAScCO^%5<H/GYPp$COkA"fIR&?=qu3:[?.TS^)9R$Gq?r-
4['3C+fk>nBL^dS(/c%Wo-C!'n+*35@V-c=1o(=,(nP5X$3]ANdhc[7M-_%h_-Te7ej)]AR\f8
DedssTjLP4:/-&Yp9^7(0`"+ZhHB,?e!J&:Gs7\.>Ec^7=:aIj48=6k;a1a-EhQ@GOHSfh@o
P\^'5MSf")<cp69.UGIcYGI*.sV%84pjRFoDbC)+s&r207b%YE-fK1gOB>5eO-Meo0criA<C
k(L[1H>0;AOFcr?5e/jV8O4KDAX<P^:O)a*,eGPa6C:hckIRtd[!XX`\V%Cqk#d;nG`0p.6N
KgDhL/..5VMScHhOX\P?$ei]Aa:NJ+4!%Ub%lk[tfrJ=9mP8+)#:k/f@pf8>mVcKK*L9:sI^S
+$@(!k&VmcL&YkrEg>-@3*bPFL^OBdSW<A`l@j1c6"Eo>%cuXg:f/E^4!d]A;.bk1U9Q%brD^
`_(3C$6;MjFQ&_,Y1Ct9+@ZCpHgPs.*Et+,K(V[%m$pA+-@CUnbNM!JJksKtI;B/o]A?ip0ZZ
&Zqt?U?NnOjG:#a@b0nWR&^N2id_AgBtW`pC(!V!,BeaZM^o"\F@tTUTN.p.4?cLTBr2"-2-
b$Kk=P=!EsdrSo3faF2'N6JfE,\<Oq%-;I[iG]AeRJ4TE(gn4Y$1n")>-"h7'=r[7Cn=(!-UA
I#?Nu`T`I5gNbQp`u>QqUSfHp"!'5N%0iVTp&T^'2/k?6g2[l[_=HrqX:!]A\V&\*NA5crEk+
6I_!Pq4OH1m[T('q3mg7#4)gpm9gKG=dX+rc!h>`(/f>8h'5m0DmVVhiV95"baS'POtJFE_n
;gQ2/MU]A!:&E#?YeD>_1F%:Tn!$N"S62WYYrHa=JKA&T<[4-[kZ)1+/*7SYH@JT+jq#BsGk_
Tlo*/Wj-N#VsPfHmq&UkW8MG'81k0?Hq07]ACA=Olr*_&gEPk<UhI<II70\a/!EjW'HTCBnPS
kDF::8!`d[K,AObt:G'om1r?:`kV.Aq+JOLPc=#WfWI"uKT^4#P6VO!="!\$d?_a(`cZ>$]AB
[8XnK"(jWU**L%cG4;A)iJ]A)".b^Ot)UTr8'0/`;#,qUU4;4RG558R]A"f^XANuVP7k%;+Adf
:L;qKSN5.R/B.P&>%;PMd-a4Vs`'&bg*&-/7)HW2DRpK:'C@4ti(@nIu!earlEMMd@_jjPr'
KS4)cTH_]AiScBmOpRH9t]AcZ[l.*II%607'aHDXaRW/Ik%5o[ZUHdC]A/NHJe0YC*:BSI!:s9R
$k4IK%N[PKnI1o=;VV_e`;#&;<JDG>n+kN<sQ'sHc(e\%<S2[Z@,`;_/Y+A5@u-T't0?"K-"
MPLt5/Tn)p&9=hNmTp;;c9pU/E$Im:\q[bq)-Qlf,+(hGY5oAG/*Bm$5n;#aDLn\gqZM'#E6
^LZ7'"4@k$:L9q1LA:9RM)@5j\.1eJ:%*$uBr$NijglSqeV35/iM(hBfW0ZNVbGfU+jh_ZKM
EjX1M,8\7ZtVR@Y9gsnVcUa[@F\"a5\O+>T3aYQg<%LrJ<RQabV`fg.A^cq6de5-qu#D]ADA]A
Q>(%?H6oX"ml97WD(8[KF3rEmZ-t$-QRlm4rN*53mT4P`cp^JYU,3=Sh7IG&FB7DSS?#j;r=
CEn\ag?fVJrA_kl$KJC=/-#CL&qc&Y5nX*/GYl97Io-*&;$XCnP1\6\fPH'[kW8\.%+n5l1K
IoDR5Zs6:mdc/[e(BhP`03P!p8h,&WNA'G:&BLd^p"1*kS'Y(p,cT'J(S-b-k&E4YMd`F^uD
T11L>NPGt:a<#'U3[.m[/-J2/eEC(._dW,NT*n1!:io\!S+Fc/.MusDhn/?gJTINU*gh`e>;
Ci)YHn4us"8i&b5YHbBdSFLSjZ)i;`+B<IWeJR(hpM*%1@OJ+l&gHZg+st!n";tTY,)ZD/dt
FW&9`9$,%;#7pPMA]A(>T#RK;[BH7+Ep0Ds@b(,21]A(V)&RnJo4_8P*TXebAOBT,gM%]AG6S"r
,]ABao5-ISrNf0Z(3L(*RY)O"hQkh>FNQeh4o.[fI>#>8s&ZId0qWK6*i6ml@c9TuV82E&.nC
onL!rnl@c_E>at9Cm,!8Xr?jUSp+"RVdHmA^aAN!+$/>jR">]ANoSU=J.)!OVqWn?Eht*&"Mn
7F'bp:80Z*g$UAM=6$s%e2SN4WP2B8#`Mj?q7Q9-TZ>LHYaP?d5h`$<0]A/O#NeLpO5+Jbb44
n\c!$c]AI#T6W1)"BsG(/Y_010>e_;/s$eqC\N6qHsWg#gM\(<,kM.pq9;F&l*ahLOBb]Ad3$V
dT.R9,#6:Gs@/#K7G*.RiOX1UqO3=S".43+0\L2[EGc5Xuku0`)<n+tLk(?ouNJ_dO_!oAL<
3#@2fI*H_Ei)uVo8a\sFQt<#oX3^+ALbVr@uPKT1ifVa#"nk`9f6D`dl28646hO88SeX8CQ1
LY'G!;[@ma<*@Hh?s&FVm?-J@kd.[tT3FRQS:bcC7a>@FOV^V3B-H`o`>M79^=Wpm`G[2,F8
i?B'gDT6DHgL4o&IZedKksf,@_+:)&^iHe>'.HGl,N>Q(n%`h4S%FY1c)i;6E99!CMb4SN(Z
iR*oCFK`='#LZ=[d4sLMIE-I/@NdT&JTplJcY:Cei9Icn%m.\(NQcYrbZ4>L/A8W0BErV<93
S_h=Y)G:X3l'p-:d.M&KFgG4m4?dNb:+JGdO+)BtfLRlIeZ?uZU-ggV6kgtRtf%7P^4gcZ_V
hi2KWk,&[PoZZ<B"AK^9eNC11n"6;D9)kJEY:;u=j7?ni857[''uN46B=]AJb_k1"e2d[+SEY
'O4."o_J"?g:"D\1X\0P9`r*3uUn(1no"i6aA=J16W:PT?i>)quY(P.L,XOHmH01h4k7e)@.
RW>?2>Hhn$4I,6gfEk]AeqR1<1/48B,%KqU=i#E(G"%X!\DjF)Dn_E1VcFi$2TM^C(\Vi">pP
W.'^3Oq#-90`Q4]AD(eZnZ"]A^8<Ai8R8`:PreA0d#(=>`&>c(F*)_YWo$T;5\M:/C-@uQ.!M$
5U7_pAkm`\J:=`TU?U#'P'YLKGOh'j;s7TMoG':<YAIIF'cQho-IsCGn;5^)]AC<SHUqdiC#a
^!+Pi.Ys'iUWt8iC2Who4?U.ql9qt/MSGaDU;&%PY,5)C%-:`9A**HWkFNg1OXJA97p?tMMb
?@TE'K\8iWk/4SHYt,n1:mjN\RtZk\%rd*e<H3K2DT:oG%oCW(RtXDK"M.\iLV?(!P)M0>=a
)JN).abYV/ZX.Lt[aKXWk%46]A=uJm1?/5;)o/*n8Y$*ku:EGo4[OYuPg\r_S;="n:'!tg]Af:
F1S\FY(3:B&,iN2$iYET2)269$:hNI=5'd:3@)joS+YES]AXlF]A8MVC*`IBUo&c[FArSK>uF<
h2![e^')BSV\AZ$&Z[:`]A!]AlP2:jt=_RP%--NhEB@U;6:TZq%CVR-BEIq\@^2=.DPi8i%&jE
D-8^cD@&8>RJ.L-6Kk,061^29cg$XD/R9`V9)&^EQC[L.>$>oIj\.(i:XC'YOY(65.hm?C%+
0<#83:]AniEN[-YeabhQ5(YU)YfRFJb=-ifFRGS6G&>\Qi0tgJ$CHFEHJZ]AtUB;\;ofsqkCVK
kL5)SjMe7QC`=5+0$gZ2ID2$PW@X$9+[.jB,\T+%2Nubdj`Na/$.64]AAA;9h#5.]A`juh*);=
]A8=2?-hbZ"Wm9lE>u.8`8=Rjm1O9'b[@["-26qi5!Cded\E;K/rqr;EcYeIiNuYl>rD7K"UK
3W^[oe=3Ys%Cc*qfKmqaGS=IE^GY8c!"O9B"`k9##jlP$7GBL=?Y&bZV1*Bc@F*m4'Hs\4O;
,jFB-YpS^4?45'j_kO72uFoZ+/6E\glH11LkaleZ[@F&+X+7BkK*D$e!qY_V1l>g#c>J<`RL
trF5i^\0L954,;?@8]Ai[kQ[>i*==Kk:tb.'Na*nO[T2OZ[oEqlrgiVn',G$0Rc4ZuLBG%Y)N
=Uo]Ahj;NkRn4^fXXR'bMJ&h"pOY,IU&J"N`k]A`%eS>l=e6g[6LmJ69O)5/MV6_!2Tf,g5!\O
8(PXf[<7X+\a/=$Y6C;5_)DG/i]At><tk;5"aF:`3$6J47K"3)<kGM$T]A*^.VP:(Td#Ol`j3=
+nX3qYG=KQDYE(tl]ATJ:ZEL;WC:(u%XVu'W]AJ%gE4W6%hMOabH?qY<)=2u!UN8$^<_EfB9Ye
O$^OMY;;Z:hEF\QJ4l-i2AnrT^uZ?^1R1:.r*LV!5O;CFN:BCARR?V^hBeg`?Jg:K2Rm\<38
K`*]A;0$YC-9?aoGtYo2k/sTAYf7$Ab!KS16,2kT;_q"-YGOe,%1S>Ln"q&#T(&"1Aesp#[2$
"F$i9:odP4"rkZk!!&<YD,I6n;_='$[!T*)+KtVZRDfBE0lg+;Eqm>&^aBi+,_JXk#/[)[g%
`(s7rhbX-1jkV7aS5VMZp#uc?!a4b"pHJC0:Z4#7f\tJM7Pq+qlTkSR-D?he7At5DtB:]AYTh
9Jq^HTq[#DblD@)mEBn/)fC0F3.Fb=:7!aCS0EUeJ!=<aW)F%tu&",K6Kh;(KasE=`MnU&"%
W^)o.>'1M>B>%[K;R923GtEqQG9LGkO!)K9.U"4IM+OU(p4%AaCHO.E_+)p3tDZI#lFIMV;`
b)F<qseJ=Q11q<]AUYXZKZLO+<[5XU,e9]Ati+EeZGfZ^Rf\<C:OK$XDpeA/"P-aXk&`<fJ@mQ
V&q/n7pBVAr!W3a22fAUDQchTJ)+qTEMSemec%4\oPH+6'7FC&4eFdZ)Xd!UYtF)S0a*R0J>
?u9BuLJi#QJ;?=5bsRP>l,8k\gdP`VLTh'eN!rFBH8iCYm>FRGX?%#C/md!Fj:K[\=kDMc4,
3nqe\UY;X[Krf(E1F$HBY&?"?_oXI*#`oAA$R<5UW!0BrMB'RQ@s/ROnc5OY%&VadJo;AOUQ
S`b)FV>O#oB:8c&K7.-(k$Ui6/C_,EYChB6?g-J'I``-r(?20&A:?!cV"c]AZ1opV9mMMc9;.
F5ZS-l//E[l-X!\C9k+Q!5Rt'e+I18c?(-2L3d8=:[Q4,*.4kQ%l+WCkj*L1([bE2`+~
]]></IM>
<ReportFitAttr fitStateInPC="1" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="682" y="36" width="682" height="730"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="  " + if(len($company_num) = 0 || $company_num = "山西省" || $company_num = 10, "晋能集团有限公司简介", MAP($company_num, 'base_info', 3, 2) + "简介")]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="5" color="-1446671"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="682" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="  " + if(len($company_num) = 0 || $company_num = "山西省" || $company_num = 10, "晋能集团简介", MAP($company_num, 'base_info', 3, 2) + "简介")]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="ColorBackground" color="-2953990"/>
<border style="1" color="-1446671"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
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
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="550" y="0" width="700" height="700"/>
</Widget>
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
<![CDATA[=\"  煤矿分布\"]]></O>
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
<VanChartMapPlotAttr mapType="custom" geourl="assets/map/param/city" zoomlevel="0" mapmarkertype="1" nullvaluecolor="-14374913"/>
<pointHotHyperLink>
<NameJavaScriptGroup>
<NameJavaScript name="当前表单对象1">
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
<NameJavaScript name="alarm">
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
<realateName realateValue="report1" animateType="none"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
</pointHotHyperLink>
<areaHotHyperLink>
<NameJavaScriptGroup>
<NameJavaScript name="钻取">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="newpid"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=MAP($area_name, "city", pid, newpid)]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var city = _g().parameterEl.getWidgetByName('city');
city.setValue(newpid)]]></Content>
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
<![CDATA[="  煤矿分布"]]></Attributes>
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
<BoundsAttr x="0" y="0" width="550" height="700"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="chart1"/>
<Widget widgetName="report0"/>
</MobileWidgetList>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1366" absoluteResolutionScaleH="768"/>
<AppRelayout appRelayout="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1364" height="766"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="body"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="1364" height="766"/>
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
