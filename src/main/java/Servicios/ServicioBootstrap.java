package Servicios;

import org.h2.tools.Server;

import java.sql.SQLException;

public class ServicioBootstrap {
    private static ServicioBootstrap instancia;

    public static ServicioBootstrap getInstancia() {
        if (instancia == null) {
            instancia = new ServicioBootstrap();
        }
        return instancia;
    }

    public static void iniciarBaseDatos() throws SQLException {
        Server.createTcpServer("-tcpPort", "9092", "-tcpAllowOthers").start();
    }

    public static void detenerBaseDatos() throws SQLException {
        Server.shutdownTcpServer("tcp://localhost:9092", "", true, true);
    }
}
