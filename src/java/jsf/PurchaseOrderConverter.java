package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.PurchaseOrderJpaController;
import jpa.entities.PurchaseOrder;


public class PurchaseOrderConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        PurchaseOrderJpaController controller = (PurchaseOrderJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "purchaseOrderJpa");
        return controller.findPurchaseOrder(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof PurchaseOrder) {
            PurchaseOrder o = (PurchaseOrder) object;
            return o.getOrderNum() == null ? "" : o.getOrderNum().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.PurchaseOrder");
        }
    }

}
