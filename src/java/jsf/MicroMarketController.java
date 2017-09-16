package jsf;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import jpa.controllers.MicroMarketJpaController;
import jpa.entities.MicroMarket;
import jsf.util.JsfUtil;
import jpa.controllers.exceptions.NonexistentEntityException;
import jsf.util.PagingInfo;


public class MicroMarketController {

    public MicroMarketController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (MicroMarketJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "microMarketJpa");
        pagingInfo = new PagingInfo();
        converter = new MicroMarketConverter();
    }
    private MicroMarket microMarket = null;
    private List<MicroMarket> microMarketItems = null;
    private MicroMarketJpaController jpaController = null;
    private MicroMarketConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getMicroMarketCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getMicroMarketItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findMicroMarketEntities(), false);
    }

    public SelectItem[] getMicroMarketItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findMicroMarketEntities(), true);
    }

    public MicroMarket getMicroMarket() {
        if (microMarket == null) {
            microMarket = (MicroMarket) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMicroMarket", converter, null);
        }
        if (microMarket == null) {
            microMarket = new MicroMarket();
        }
        return microMarket;
    }

    public String listSetup() {
        reset(true);
        return "microMarket_list";
    }

    public String createSetup() {
        reset(false);
        microMarket = new MicroMarket();
        return "microMarket_create";
    }

    public String create() {
        try {
            jpaController.create(microMarket);
            JsfUtil.addSuccessMessage("MicroMarket was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("microMarket_detail");
    }

    public String editSetup() {
        return scalarSetup("microMarket_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        microMarket = (MicroMarket) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMicroMarket", converter, null);
        if (microMarket == null) {
            String requestMicroMarketString = JsfUtil.getRequestParameter("jsfcrud.currentMicroMarket");
            JsfUtil.addErrorMessage("The microMarket with id " + requestMicroMarketString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String microMarketString = converter.getAsString(FacesContext.getCurrentInstance(), null, microMarket);
        String currentMicroMarketString = JsfUtil.getRequestParameter("jsfcrud.currentMicroMarket");
        if (microMarketString == null || microMarketString.length() == 0 || !microMarketString.equals(currentMicroMarketString)) {
            String outcome = editSetup();
            if ("microMarket_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit microMarket. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(microMarket);
            JsfUtil.addSuccessMessage("MicroMarket was successfully updated.");
        } catch (NonexistentEntityException ne) {
            JsfUtil.addErrorMessage(ne.getLocalizedMessage());
            return listSetup();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String destroy() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentMicroMarket");
        String id = idAsString;
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("MicroMarket was successfully deleted.");
        } catch (NonexistentEntityException ne) {
            JsfUtil.addErrorMessage(ne.getLocalizedMessage());
            return relatedOrListOutcome();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<MicroMarket> getMicroMarketItems() {
        if (microMarketItems == null) {
            getPagingInfo();
            microMarketItems = jpaController.findMicroMarketEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return microMarketItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "microMarket_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "microMarket_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        microMarket = null;
        microMarketItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        MicroMarket newMicroMarket = new MicroMarket();
        String newMicroMarketString = converter.getAsString(FacesContext.getCurrentInstance(), null, newMicroMarket);
        String microMarketString = converter.getAsString(FacesContext.getCurrentInstance(), null, microMarket);
        if (!newMicroMarketString.equals(microMarketString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
