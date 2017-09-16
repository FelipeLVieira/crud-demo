<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New PurchaseOrder</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>New PurchaseOrder</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{purchaseOrder.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="OrderNum:"/>
                    <h:inputText id="orderNum" value="#{purchaseOrder.purchaseOrder.orderNum}" title="OrderNum" required="true" requiredMessage="The orderNum field is required." />
                    <h:outputText value="Quantity:"/>
                    <h:inputText id="quantity" value="#{purchaseOrder.purchaseOrder.quantity}" title="Quantity" />
                    <h:outputText value="ShippingCost:"/>
                    <h:inputText id="shippingCost" value="#{purchaseOrder.purchaseOrder.shippingCost}" title="ShippingCost" />
                    <h:outputText value="SalesDate (MM/dd/yyyy):"/>
                    <h:inputText id="salesDate" value="#{purchaseOrder.purchaseOrder.salesDate}" title="SalesDate" >
                        <f:convertDateTime type="DATE" pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="ShippingDate (MM/dd/yyyy):"/>
                    <h:inputText id="shippingDate" value="#{purchaseOrder.purchaseOrder.shippingDate}" title="ShippingDate" >
                        <f:convertDateTime type="DATE" pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="FreightCompany:"/>
                    <h:inputText id="freightCompany" value="#{purchaseOrder.purchaseOrder.freightCompany}" title="FreightCompany" />
                    <h:outputText value="CustomerId:"/>
                    <h:selectOneMenu id="customerId" value="#{purchaseOrder.purchaseOrder.customerId}" title="CustomerId" required="true" requiredMessage="The customerId field is required." >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="ProductId:"/>
                    <h:selectOneMenu id="productId" value="#{purchaseOrder.purchaseOrder.productId}" title="ProductId" required="true" requiredMessage="The productId field is required." >
                        <f:selectItems value="#{product.productItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{purchaseOrder.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{purchaseOrder.listSetup}" value="Show All PurchaseOrder Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
