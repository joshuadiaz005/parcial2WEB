import Modelos.Usuario;
import Servicios.ServicioBootstrap;
import Servicios.ServicioUsuario;

public class Main {
    public static void main(String[] args) {
        try {
            ServicioBootstrap.iniciarBaseDatos();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (ServicioUsuario.getInstancia().encontrar(new Long(1)) == null) {
            ServicioUsuario.getInstancia().crear(new Usuario(new Long(1), "Administrador", "admin", "1234", true, true, null));
        }
        Enrutamiento.crearRutas();
    }
}
