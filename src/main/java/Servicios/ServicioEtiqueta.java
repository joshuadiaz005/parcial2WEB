package Servicios;

import Modelos.Etiqueta;

import java.util.List;
import java.util.Set;

public class ServicioEtiqueta extends ServicioBaseDatos<Etiqueta> {
    private static ServicioEtiqueta instancia;

    private ServicioEtiqueta() {
        super(Etiqueta.class);
    }

    public static ServicioEtiqueta getInstancia() {
        if (instancia == null) {
            instancia = new ServicioEtiqueta();
        }
        return instancia;
    }

    public static void anadirEtiquetas(String[] etiquetas, Set<Etiqueta> etiquetasSet) {
        List<Etiqueta> tags = ServicioEtiqueta.getInstancia().listar();
        for (int i = 0; i < etiquetas.length; i++) {
            Etiqueta et = new Etiqueta(etiquetas[i]);
            boolean esta = false;
            for (Etiqueta e : tags) {
                if (e.getEtiqueta().contains(etiquetas[i])) {
                    esta = true;
                }
            }

            if (!esta) {
                ServicioEtiqueta.getInstancia().crear(et);
                tags = ServicioEtiqueta.getInstancia().listar();
            }
        }

        for (int i = 0; i < etiquetas.length; i++) {
            for (Etiqueta e : ServicioEtiqueta.getInstancia().listar()) {
                if (e.getEtiqueta().equals(etiquetas[i])) {
                    etiquetasSet.add(e);
                }
            }
        }
    }

    public static boolean haSidoModificadaLasEtiquetas(Set<Etiqueta> etiquetas, Set<Etiqueta> setEtiquetas) {

        if ((etiquetas.size() == 0 && setEtiquetas.size() > 0) || (etiquetas.size() > 0 && setEtiquetas.size() == 0)) {
            return true;
        }
        for (Etiqueta etiquetaSet : setEtiquetas) {
            for (Etiqueta etiqueta : etiquetas) {
                if (!etiquetaSet.getEtiqueta().contains(etiqueta.getEtiqueta())) {
                    return true;
                }
            }
        }
        return false;
    }
}
