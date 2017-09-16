<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Customer Detail</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Customer Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CustomerId:"/>
                    <h:outputText value="#{customer.customer.customerId}" title="CustomerId" />
                    <h:outputText value="Zip:"/>
                    <h:outputText value="#{customer.customer.zip}" title="Zip" />
                    <h:outputText value="Name:"/>
                    <h:outputText value="#{customer.customer.name}" title="Name" />
                    <h:outputText value="Addressline1:"/>
                    <h:outputText value="#{customer.customer.addressline1}" title="Addressline1" />
                    <h:outputText value="Addressline2:"/>
                    <h:outputText value="#{customer.customer.addressline2}" title="Addressline2" />
                    <h:outputText value="City:"/>
                    <h:outputText value="#{customer.customer.city}" title="City" />
                    <h:outputText value="State:"/>
                    <h:outputText value="#{customer.customer.state}" title="State" />
                    <h:outputText value="Phone:"/>
                    <h:outputText value="#{customer.customer.phone}" title="Phone" />
                    <h:outputText value="Fax:"/>
                    <h:outputText value="#{customer.customer.fax}" title="Fax" />
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{customer.customer.email}" title="Email" />
                    <h:outputText value="CreditLimit:"/>
                    <h:outputText value="#{customer.customer.creditLimit}" title="CreditLimit" />
                    <h:outputText value="DiscountCode:"/>
                    <h:panelGroup>
                        <h:outputText value=" #{customer.customer.discountCode}"/>
                        <h:panelGroup rendered="#{customer.customer.discountCode != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{discountCode.detailSetup}">
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="customer"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{discountCode.editSetup}">
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="customer"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{discountCode.destroy}">
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDiscountCode" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer.discountCode][discountCode.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="customer"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="PurchaseOrderCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty customer.customer.purchaseOrderCollection}" value="(No Items)"/>
                        <h:dataTable value="#{customer.customer.purchaseOrderCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty customer.customer.purchaseOrderCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="OrderNum"/>
                                </f:facet>
                                <h:outputText value=" #{item.orderNum}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Quantity"/>
                                </f:facet>
                                <h:outputText value=" #{item.quantity}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ShippingCost"/>
                                </f:facet>
                                <h:outputText value=" #{item.shippingCost}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="SalesDate"/>
                                </f:facet>
                                <h:outputText value="#{item.salesDate}">
                                    <f:convertDateTime type="DATE" pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ShippingDate"/>
                                </f:facet>
                                <h:outputText value="#{item.shippingDate}">
                                    <f:convertDateTime type="DATE" pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="FreightCompany"/>
                                </f:facet>
                                <h:outputText value=" #{item.freightCompany}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="CustomerId"/>
                                </f:facet>
                                <h:outputText value=" #{item.customerId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ProductId"/>
                                </f:facet>
                                <h:outputText value=" #{item.productId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{purchaseOrder.detailSetup}">
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPurchaseOrder" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][purchaseOrder.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="customer" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{purchaseOrder.editSetup}">
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPurchaseOrder" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][purchaseOrder.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="customer" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{purchaseOrder.destroy}">
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPurchaseOrder" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][purchaseOrder.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="customer" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.CustomerController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{customer.destroy}" value="Destroy">
                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{customer.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{customer.createSetup}" value="New Customer" />
                <br />
                <h:commandLink action="#{customer.listSetup}" value="Show All Customer Items"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
