<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>MicroMarket Detail</title>
            <link rel="stylesheet" type="text/css" href="/JsfJpaCrud/faces/jsfcrud.css" />
        </head>
        <body>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>MicroMarket Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ZipCode:"/>
                    <h:outputText value="#{microMarket.microMarket.zipCode}" title="ZipCode" />
                    <h:outputText value="Radius:"/>
                    <h:outputText value="#{microMarket.microMarket.radius}" title="Radius" />
                    <h:outputText value="AreaLength:"/>
                    <h:outputText value="#{microMarket.microMarket.areaLength}" title="AreaLength" />
                    <h:outputText value="AreaWidth:"/>
                    <h:outputText value="#{microMarket.microMarket.areaWidth}" title="AreaWidth" />
                </h:panelGrid>
                <br />
                <h:commandLink action="#{microMarket.destroy}" value="Destroy">
                    <f:param name="jsfcrud.currentMicroMarket" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][microMarket.microMarket][microMarket.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{microMarket.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentMicroMarket" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][microMarket.microMarket][microMarket.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{microMarket.createSetup}" value="New MicroMarket" />
                <br />
                <h:commandLink action="#{microMarket.listSetup}" value="Show All MicroMarket Items"/>
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />
            </h:form>
        </body>
    </html>
</f:view>
