package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.ProductCodeJpaController;
import jpa.entities.ProductCode;


public class ProductCodeConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        String id = string;
        ProductCodeJpaController controller = (ProductCodeJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "productCodeJpa");
        return controller.findProductCode(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof ProductCode) {
            ProductCode o = (ProductCode) object;
            return o.getProdCode() == null ? "" : o.getProdCode().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.ProductCode");
        }
    }

}
