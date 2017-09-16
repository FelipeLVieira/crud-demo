<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing ProductCode Items</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Listing ProductCode Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No ProductCode Items Found)<br />" rendered="#{productCode.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{productCode.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{productCode.pagingInfo.firstItem + 1}..#{productCode.pagingInfo.lastItem} of #{productCode.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{productCode.prev}" value="Previous #{productCode.pagingInfo.batchSize}" rendered="#{productCode.pagingInfo.firstItem >= productCode.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{productCode.next}" value="Next #{productCode.pagingInfo.batchSize}" rendered="#{productCode.pagingInfo.lastItem + productCode.pagingInfo.batchSize <= productCode.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{productCode.next}" value="Remaining #{productCode.pagingInfo.itemCount - productCode.pagingInfo.lastItem}"
                                   rendered="#{productCode.pagingInfo.lastItem < productCode.pagingInfo.itemCount && productCode.pagingInfo.lastItem + productCode.pagingInfo.batchSize > productCode.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{productCode.productCodeItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ProdCode"/>
                            </f:facet>
                            <h:outputText value=" #{item.prodCode}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DiscountCode"/>
                            </f:facet>
                            <h:outputText value=" #{item.discountCode}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Description"/>
                            </f:facet>
                            <h:outputText value=" #{item.description}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{productCode.detailSetup}">
                                <f:param name="jsfcrud.currentProductCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][productCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{productCode.editSetup}">
                                <f:param name="jsfcrud.currentProductCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][productCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{productCode.destroy}">
                                <f:param name="jsfcrud.currentProductCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][productCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{productCode.createSetup}" value="New ProductCode"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
                
            </h:form>
        </body>
    </html>
</f:view>
