package jsf;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import jpa.controllers.PurchaseOrderJpaController;
import jpa.entities.PurchaseOrder;
import jsf.util.JsfUtil;
import jpa.controllers.exceptions.NonexistentEntityException;
import jsf.util.PagingInfo;


public class PurchaseOrderController {

    public PurchaseOrderController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (PurchaseOrderJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "purchaseOrderJpa");
        pagingInfo = new PagingInfo();
        converter = new PurchaseOrderConverter();
    }
    private PurchaseOrder purchaseOrder = null;
    private List<PurchaseOrder> purchaseOrderItems = null;
    private PurchaseOrderJpaController jpaController = null;
    private PurchaseOrderConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getPurchaseOrderCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getPurchaseOrderItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findPurchaseOrderEntities(), false);
    }

    public SelectItem[] getPurchaseOrderItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findPurchaseOrderEntities(), true);
    }

    public PurchaseOrder getPurchaseOrder() {
        if (purchaseOrder == null) {
            purchaseOrder = (PurchaseOrder) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPurchaseOrder", converter, null);
        }
        if (purchaseOrder == null) {
            purchaseOrder = new PurchaseOrder();
        }
        return purchaseOrder;
    }

    public String listSetup() {
        reset(true);
        return "purchaseOrder_list";
    }

    public String createSetup() {
        reset(false);
        purchaseOrder = new PurchaseOrder();
        return "purchaseOrder_create";
    }

    public String create() {
        try {
            jpaController.create(purchaseOrder);
            JsfUtil.addSuccessMessage("PurchaseOrder was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("purchaseOrder_detail");
    }

    public String editSetup() {
        return scalarSetup("purchaseOrder_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        purchaseOrder = (PurchaseOrder) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPurchaseOrder", converter, null);
        if (purchaseOrder == null) {
            String requestPurchaseOrderString = JsfUtil.getRequestParameter("jsfcrud.currentPurchaseOrder");
            JsfUtil.addErrorMessage("The purchaseOrder with id " + requestPurchaseOrderString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String purchaseOrderString = converter.getAsString(FacesContext.getCurrentInstance(), null, purchaseOrder);
        String currentPurchaseOrderString = JsfUtil.getRequestParameter("jsfcrud.currentPurchaseOrder");
        if (purchaseOrderString == null || purchaseOrderString.length() == 0 || !purchaseOrderString.equals(currentPurchaseOrderString)) {
            String outcome = editSetup();
            if ("purchaseOrder_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit purchaseOrder. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(purchaseOrder);
            JsfUtil.addSuccessMessage("PurchaseOrder was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPurchaseOrder");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("PurchaseOrder was successfully deleted.");
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

    public List<PurchaseOrder> getPurchaseOrderItems() {
        if (purchaseOrderItems == null) {
            getPagingInfo();
            purchaseOrderItems = jpaController.findPurchaseOrderEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return purchaseOrderItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "purchaseOrder_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "purchaseOrder_list";
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
        purchaseOrder = null;
        purchaseOrderItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PurchaseOrder newPurchaseOrder = new PurchaseOrder();
        String newPurchaseOrderString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPurchaseOrder);
        String purchaseOrderString = converter.getAsString(FacesContext.getCurrentInstance(), null, purchaseOrder);
        if (!newPurchaseOrderString.equals(purchaseOrderString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
