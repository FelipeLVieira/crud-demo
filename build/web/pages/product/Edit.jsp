<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Product</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Editing Product</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ProductId:"/>
                    <h:outputText value="#{product.product.productId}" title="ProductId" />
                    <h:outputText value="PurchaseCost:"/>
                    <h:inputText id="purchaseCost" value="#{product.product.purchaseCost}" title="PurchaseCost" />
                    <h:outputText value="QuantityOnHand:"/>
                    <h:inputText id="quantityOnHand" value="#{product.product.quantityOnHand}" title="QuantityOnHand" />
                    <h:outputText value="Markup:"/>
                    <h:inputText id="markup" value="#{product.product.markup}" title="Markup" />
                    <h:outputText value="Available:"/>
                    <h:inputText id="available" value="#{product.product.available}" title="Available" />
                    <h:outputText value="Description:"/>
                    <h:inputText id="description" value="#{product.product.description}" title="Description" />
                    <h:outputText value="ManufacturerId:"/>
                    <h:selectOneMenu id="manufacturerId" value="#{product.product.manufacturerId}" title="ManufacturerId" required="true" requiredMessage="The manufacturerId field is required." >
                        <f:selectItems value="#{manufacturer.manufacturerItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="ProductCode:"/>
                    <h:selectOneMenu id="productCode" value="#{product.product.productCode}" title="ProductCode" required="true" requiredMessage="The productCode field is required." >
                        <f:selectItems value="#{productCode.productCodeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="PurchaseOrderCollection:"/>
                    <h:selectManyListbox id="purchaseOrderCollection" value="#{product.product.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToCollection].purchaseOrderCollection}" title="PurchaseOrderCollection" size="6" converter="#{purchaseOrder.converter}" >
                        <f:selectItems value="#{purchaseOrder.purchaseOrderItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{product.edit}" value="Save">
                    <f:param name="jsfcrud.currentProduct" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][product.product][product.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{product.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentProduct" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][product.product][product.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{product.listSetup}" value="Show All Product Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
