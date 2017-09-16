<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Manufacturer</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>New Manufacturer</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{manufacturer.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="ManufacturerId:"/>
                    <h:inputText id="manufacturerId" value="#{manufacturer.manufacturer.manufacturerId}" title="ManufacturerId" required="true" requiredMessage="The manufacturerId field is required." />
                    <h:outputText value="Name:"/>
                    <h:inputText id="name" value="#{manufacturer.manufacturer.name}" title="Name" />
                    <h:outputText value="Addressline1:"/>
                    <h:inputText id="addressline1" value="#{manufacturer.manufacturer.addressline1}" title="Addressline1" />
                    <h:outputText value="Addressline2:"/>
                    <h:inputText id="addressline2" value="#{manufacturer.manufacturer.addressline2}" title="Addressline2" />
                    <h:outputText value="City:"/>
                    <h:inputText id="city" value="#{manufacturer.manufacturer.city}" title="City" />
                    <h:outputText value="State:"/>
                    <h:inputText id="state" value="#{manufacturer.manufacturer.state}" title="State" />
                    <h:outputText value="Zip:"/>
                    <h:inputText id="zip" value="#{manufacturer.manufacturer.zip}" title="Zip" />
                    <h:outputText value="Phone:"/>
                    <h:inputText id="phone" value="#{manufacturer.manufacturer.phone}" title="Phone" />
                    <h:outputText value="Fax:"/>
                    <h:inputText id="fax" value="#{manufacturer.manufacturer.fax}" title="Fax" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{manufacturer.manufacturer.email}" title="Email" />
                    <h:outputText value="Rep:"/>
                    <h:inputText id="rep" value="#{manufacturer.manufacturer.rep}" title="Rep" />
                    <h:outputText value="ProductCollection:"/>
                    <h:selectManyListbox id="productCollection" value="#{manufacturer.manufacturer.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToCollection].productCollection}" title="ProductCollection" size="6" converter="#{product.converter}" >
                        <f:selectItems value="#{product.productItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                </h:panelGrid>
                <br />
                <h:commandLink action="#{manufacturer.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{manufacturer.listSetup}" value="Show All Manufacturer Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
