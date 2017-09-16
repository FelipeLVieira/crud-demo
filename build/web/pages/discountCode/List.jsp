<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing DiscountCode Items</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Listing DiscountCode Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No DiscountCode Items Found)<br />" rendered="#{discountCode.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{discountCode.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{discountCode.pagingInfo.firstItem + 1}..#{discountCode.pagingInfo.lastItem} of #{discountCode.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{discountCode.prev}" value="Previous #{discountCode.pagingInfo.batchSize}" rendered="#{discountCode.pagingInfo.firstItem >= discountCode.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{discountCode.next}" value="Next #{discountCode.pagingInfo.batchSize}" rendered="#{discountCode.pagingInfo.lastItem + discountCode.pagingInfo.batchSize <= discountCode.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{discountCode.next}" value="Remaining #{discountCode.pagingInfo.itemCount - discountCode.pagingInfo.lastItem}"
                                   rendered="#{discountCode.pagingInfo.lastItem < discountCode.pagingInfo.itemCount && discountCode.pagingInfo.lastItem + discountCode.pagingInfo.batchSize > discountCode.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{discountCode.discountCodeItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DiscountCode"/>
                            </f:facet>
                            <h:outputText value=" #{item.discountCode}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Rate"/>
                            </f:facet>
                            <h:outputText value=" #{item.rate}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{discountCode.detailSetup}">
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{discountCode.editSetup}">
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{discountCode.destroy}">
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountCode.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{discountCode.createSetup}" value="New DiscountCode"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
                
            </h:form>
        </body>
    </html>
</f:view>
