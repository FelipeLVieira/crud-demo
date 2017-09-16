<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New ProductCode</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>New ProductCode</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{productCode.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="ProdCode:"/>
                    <h:inputText id="prodCode" value="#{productCode.productCode.prodCode}" title="ProdCode" required="true" requiredMessage="The prodCode field is required." />
                    <h:outputText value="DiscountCode:"/>
                    <h:inputText id="discountCode" value="#{productCode.productCode.discountCode}" title="DiscountCode" required="true" requiredMessage="The discountCode field is required." />
                    <h:outputText value="Description:"/>
                    <h:inputText id="description" value="#{productCode.productCode.description}" title="Description" />
                    <h:outputText value="ProductCollection:"/>
                    <h:selectManyListbox id="productCollection" value="#{productCode.productCode.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToCollection].productCollection}" title="ProductCollection" size="6" converter="#{product.converter}" >
                        <f:selectItems value="#{product.productItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{productCode.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{productCode.listSetup}" value="Show All ProductCode Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
