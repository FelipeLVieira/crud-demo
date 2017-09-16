package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.controllers.ManufacturerJpaController;
import jpa.entities.Manufacturer;

/**
 *
 * @author mbohm
 */
public class ManufacturerConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        ManufacturerJpaController controller = (ManufacturerJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "manufacturerJpa");
        return controller.findManufacturer(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Manufacturer) {
            Manufacturer o = (Manufacturer) object;
            return o.getManufacturerId() == null ? "" : o.getManufacturerId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.Manufacturer");
        }
    }

}
