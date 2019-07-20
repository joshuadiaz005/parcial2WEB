package Servicios;

import Modelos.Valoracion;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class ServicioValoracion extends ServicioBaseDatos<Valoracion> {
    private static ServicioValoracion instancia;

    private ServicioValoracion() {
        super(Valoracion.class);
    }

    public static ServicioValoracion getInstancia() {
        if (instancia == null) {
            instancia = new ServicioValoracion();
        }
        return instancia;
    }

    public Object encontrarValoracionUsuarioEnComentario(long comentarioID, long usuarioID) {
        EntityManager em = getEntityManager();

        try {
            Query query = em.createQuery(
                    "from Valoracion valoracion where valoracion.comentario.id = :valoracion_comentarioID and valoracion.usuario.id = :valoracion_usuarioID"
            );
            query.setParameter("valoracion_comentarioID", comentarioID);
            query.setParameter("valoracion_usuarioID", usuarioID);
            return query.getSingleResult();
        } catch (Exception ex) {
            return null;
        } finally {
            em.close();
        }
    }

    public List<Valoracion> encontrarValoracionesPorComentario(long comentarioID, String tipoValoracion) {
        EntityManager em = getEntityManager();

        try {
            Query query = em.createQuery(
                    "from Valoracion valoracion where valoracion.comentario.id = :valoracion_comentarioID and valoracion.valoracion = :valoracion_tipoValoracion"
            );

            query.setParameter("valoracion_comentarioID", comentarioID);
            query.setParameter("valoracion_tipoValoracion", tipoValoracion);

            return query.getResultList();
        } catch (Exception ex) {
            return null;
        } finally {
            em.close();
        }
    }

}

