<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing MicroMarket Items</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Listing MicroMarket Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No MicroMarket Items Found)<br />" rendered="#{microMarket.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{microMarket.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{microMarket.pagingInfo.firstItem + 1}..#{microMarket.pagingInfo.lastItem} of #{microMarket.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{microMarket.prev}" value="Previous #{microMarket.pagingInfo.batchSize}" rendered="#{microMarket.pagingInfo.firstItem >= microMarket.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{microMarket.next}" value="Next #{microMarket.pagingInfo.batchSize}" rendered="#{microMarket.pagingInfo.lastItem + microMarket.pagingInfo.batchSize <= microMarket.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{microMarket.next}" value="Remaining #{microMarket.pagingInfo.itemCount - microMarket.pagingInfo.lastItem}"
                                   rendered="#{microMarket.pagingInfo.lastItem < microMarket.pagingInfo.itemCount && microMarket.pagingInfo.lastItem + microMarket.pagingInfo.batchSize > microMarket.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{microMarket.microMarketItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ZipCode"/>
                            </f:facet>
                            <h:outputText value=" #{item.zipCode}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Radius"/>
                            </f:facet>
                            <h:outputText value=" #{item.radius}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="AreaLength"/>
                            </f:facet>
                            <h:outputText value=" #{item.areaLength}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="AreaWidth"/>
                            </f:facet>
                            <h:outputText value=" #{item.areaWidth}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{microMarket.detailSetup}">
                                <f:param name="jsfcrud.currentMicroMarket" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][microMarket.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{microMarket.editSetup}">
                                <f:param name="jsfcrud.currentMicroMarket" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][microMarket.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{microMarket.destroy}">
                                <f:param name="jsfcrud.currentMicroMarket" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][microMarket.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{microMarket.createSetup}" value="New MicroMarket"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
                
            </h:form>
        </body>
    </html>
</f:view>
