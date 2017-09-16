<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New DiscountCode</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>New DiscountCode</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{discountCode.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="DiscountCode:"/>
                    <h:inputText id="discountCode" value="#{discountCode.discountCode.discountCode}" title="DiscountCode" required="true" requiredMessage="The discountCode field is required." />
                    <h:outputText value="Rate:"/>
                    <h:inputText id="rate" value="#{discountCode.discountCode.rate}" title="Rate" />
                    <h:outputText value="CustomerCollection:"/>
                    <h:selectManyListbox id="customerCollection" value="#{discountCode.discountCode.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToCollection].customerCollection}" title="CustomerCollection" size="6" converter="#{customer.converter}" >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{discountCode.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{discountCode.listSetup}" value="Show All DiscountCode Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
