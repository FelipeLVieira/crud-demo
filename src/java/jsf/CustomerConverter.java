package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.CustomerJpaController;
import jpa.entities.Customer;


public class CustomerConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        CustomerJpaController controller = (CustomerJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "customerJpa");
        return controller.findCustomer(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Customer) {
            Customer o = (Customer) object;
            return o.getCustomerId() == null ? "" : o.getCustomerId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.Customer");
        }
    }

}
