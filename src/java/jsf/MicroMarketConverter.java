package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.MicroMarketJpaController;
import jpa.entities.MicroMarket;


public class MicroMarketConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        String id = string;
        MicroMarketJpaController controller = (MicroMarketJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "microMarketJpa");
        return controller.findMicroMarket(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof MicroMarket) {
            MicroMarket o = (MicroMarket) object;
            return o.getZipCode() == null ? "" : o.getZipCode().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.MicroMarket");
        }
    }

}
