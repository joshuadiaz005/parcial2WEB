package Servicios;

import Modelos.Comentario;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class ServicioComentario extends ServicioBaseDatos<Comentario> {
    private static ServicioComentario instancia;

    private ServicioComentario() {
        super(Comentario.class);
    }

    public static ServicioComentario getInstancia() {
        if (instancia == null) {
            instancia = new ServicioComentario();
        }
        return instancia;
    }

    public List<Comentario> encontrarComentarioEnArticuloOrdenado(long articuloID) {
        EntityManager em = getEntityManager();

        try {
            Query query = em.createQuery(
                    "from Comentario comentario where comentario.articulo.id = :comentario_articuloID order by id asc"
            );
            query.setParameter("comentario_articuloID", articuloID);
            return query.getResultList();
        } catch (Exception ex) {
            return null;
        } finally {
            em.close();
        }
    }
}
