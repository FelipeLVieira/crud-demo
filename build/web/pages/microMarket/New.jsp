<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New MicroMarket</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>New MicroMarket</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{microMarket.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="ZipCode:"/>
                    <h:inputText id="zipCode" value="#{microMarket.microMarket.zipCode}" title="ZipCode" required="true" requiredMessage="The zipCode field is required." />
                    <h:outputText value="Radius:"/>
                    <h:inputText id="radius" value="#{microMarket.microMarket.radius}" title="Radius" />
                    <h:outputText value="AreaLength:"/>
                    <h:inputText id="areaLength" value="#{microMarket.microMarket.areaLength}" title="AreaLength" />
                    <h:outputText value="AreaWidth:"/>
                    <h:inputText id="areaWidth" value="#{microMarket.microMarket.areaWidth}" title="AreaWidth" />
                </h:panelGrid>
                <br />
                <h:commandLink action="#{microMarket.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{microMarket.listSetup}" value="Show All MicroMarket Items" immediate="true"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
