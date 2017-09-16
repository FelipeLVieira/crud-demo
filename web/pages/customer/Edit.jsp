<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Customer</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Editing Customer</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CustomerId:"/>
                    <h:outputText value="#{customer.customer.customerId}" title="CustomerId" />
                    <h:outputText value="Zip:"/>
                    <h:inputText id="zip" value="#{customer.customer.zip}" title="Zip" required="true" requiredMessage="The zip field is required." />
                    <h:outputText value="Name:"/>
                    <h:inputText id="name" value="#{customer.customer.name}" title="Name" />
                    <h:outputText value="Addressline1:"/>
                    <h:inputText id="addressline1" value="#{customer.customer.addressline1}" title="Addressline1" />
                    <h:outputText value="Addressline2:"/>
                    <h:inputText id="addressline2" value="#{customer.customer.addressline2}" title="Addressline2" />
                    <h:outputText value="City:"/>
                    <h:inputText id="city" value="#{customer.customer.city}" title="City" />
                    <h:outputText value="State:"/>
                    <h:inputText id="state" value="#{customer.customer.state}" title="State" />
                    <h:outputText value="Phone:"/>
                    <h:inputText id="phone" value="#{customer.customer.phone}" title="Phone" />
                    <h:outputText value="Fax:"/>
                    <h:inputText id="fax" value="#{customer.customer.fax}" title="Fax" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{customer.customer.email}" title="Email" />
                    <h:outputText value="CreditLimit:"/>
                    <h:inputText id="creditLimit" value="#{customer.customer.creditLimit}" title="CreditLimit" />
                    <h:outputText value="DiscountCode:"/>
                    <h:selectOneMenu id="discountCode" value="#{customer.customer.discountCode}" title="DiscountCode" required="true" requiredMessage="The discountCode field is required." >
                        <f:selectItems value="#{discountCode.discountCodeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="PurchaseOrderCollection:"/>
                    <h:selectManyListbox id="purchaseOrderCollection" value="#{customer.customer.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToCollection].purchaseOrderCollection}" title="PurchaseOrderCollection" size="6" converter="#{purchaseOrder.converter}" >
                        <f:selectItems value="#{purchaseOrder.purchaseOrderItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{customer.edit}" value="Save">
                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{customer.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][customer.customer][customer.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{customer.listSetup}" value="Show All Customer Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
