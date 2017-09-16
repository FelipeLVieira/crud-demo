<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>DiscountCode Detail</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>DiscountCode Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="DiscountCode:"/>
                    <h:outputText value="#{discountCode.discountCode.discountCode}" title="DiscountCode" />
                    <h:outputText value="Rate:"/>
                    <h:outputText value="#{discountCode.discountCode.rate}" title="Rate" />
                    <h:outputText value="CustomerCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty discountCode.discountCode.customerCollection}" value="(No Items)"/>
                        <h:dataTable value="#{discountCode.discountCode.customerCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty discountCode.discountCode.customerCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="CustomerId"/>
                                </f:facet>
                                <h:outputText value=" #{item.customerId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Zip"/>
                                </f:facet>
                                <h:outputText value=" #{item.zip}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Name"/>
                                </f:facet>
                                <h:outputText value=" #{item.name}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Addressline1"/>
                                </f:facet>
                                <h:outputText value=" #{item.addressline1}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Addressline2"/>
                                </f:facet>
                                <h:outputText value=" #{item.addressline2}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="City"/>
                                </f:facet>
                                <h:outputText value=" #{item.city}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="State"/>
                                </f:facet>
                                <h:outputText value=" #{item.state}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Phone"/>
                                </f:facet>
                                <h:outputText value=" #{item.phone}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Fax"/>
                                </f:facet>
                                <h:outputText value=" #{item.fax}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Email"/>
                                </f:facet>
                                <h:outputText value=" #{item.email}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="CreditLimit"/>
                                </f:facet>
                                <h:outputText value=" #{item.creditLimit}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DiscountCode"/>
                                </f:facet>
                                <h:outputText value=" #{item.discountCode}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{customer.detailSetup}">
                                    <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountCode.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="discountCode" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DiscountCodeController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{customer.editSetup}">
                                    <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountCode.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="discountCode" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DiscountCodeController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{customer.destroy}">
                                    <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountCode.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="discountCode" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DiscountCodeController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{discountCode.destroy}" value="Destroy">
                    <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountCode.discountCode][discountCode.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{discountCode.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountCode.discountCode][discountCode.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{discountCode.createSetup}" value="New DiscountCode" />
                <br />
                <h:commandLink action="#{discountCode.listSetup}" value="Show All DiscountCode Items"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
