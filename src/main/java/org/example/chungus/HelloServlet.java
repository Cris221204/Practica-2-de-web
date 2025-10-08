package org.example.chungus;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.chungus.model.Cliente; // Cambiado de Usuario a Cliente
import org.example.chungus.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");

        // Probar conexión a la base de datos
        out.println("<h2>Prueba de conexión a MySQL - Tabla Cliente</h2>");

        try {
            EntityManager em = HibernateUtil.getEntityManager();

            // Crear un cliente de prueba
            EntityTransaction tx = em.getTransaction();
            tx.begin();

            Cliente cliente = new Cliente("Juan", "Pérez", "juan.perez@example.com");
            cliente.setNumero("555-1234");
            em.persist(cliente);

            tx.commit();

            // Listar todos los clientes
            List<Cliente> clientes = em.createQuery("SELECT c FROM Cliente c", Cliente.class).getResultList();

            out.println("<h3>Clientes en la base de datos:</h3>");
            out.println("<ul>");
            for (Cliente c : clientes) {
                out.println("<li>" + c.getNombreCliente() + " " + c.getApellidoCliente() +
                        " - " + c.getCorreo() + " - Tel: " + c.getNumero() + "</li>");
            }
            out.println("</ul>");

            out.println("<p style='color: green;'>✅ Conexión a MySQL exitosa! Tabla: cliente</p>");

            em.close();

        } catch (Exception e) {
            out.println("<p style='color: red;'>❌ Error conectando a MySQL: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }

        out.println("</body></html>");
    }

    public void destroy() {
        HibernateUtil.close();
    }
}