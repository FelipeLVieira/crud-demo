package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.DiscountCodeJpaController;
import jpa.entities.DiscountCode;


public class DiscountCodeConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Character id = new Character(string.charAt(0));
        DiscountCodeJpaController controller = (DiscountCodeJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "discountCodeJpa");
        return controller.findDiscountCode(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof DiscountCode) {
            DiscountCode o = (DiscountCode) object;
            return o.getDiscountCode() == null ? "" : o.getDiscountCode().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.DiscountCode");
        }
    }

}
