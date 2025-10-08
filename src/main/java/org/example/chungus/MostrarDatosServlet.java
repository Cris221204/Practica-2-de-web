package org.example.chungus;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.chungus.model.Producto;
import org.example.chungus.model.Servicio;
import org.example.chungus.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MostrarDatosServlet", value = "/mostrar-datos-servlet")
public class MostrarDatosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = HibernateUtil.getEntityManager();
        try {
            // CONSULTAR productos (MISMA lógica que Cliente)
            List<Producto> productos = em.createQuery("SELECT p FROM Producto p", Producto.class).getResultList();

            // CONSULTAR servicios (MISMA lógica que Cliente)
            List<Servicio> servicios = em.createQuery("SELECT s FROM Servicio s", Servicio.class).getResultList();

            // Pasar datos al JSP (igual que en HelloServlet)
            request.setAttribute("productos", productos);
            request.setAttribute("servicios", servicios);

            // Redirigir al JSP
            request.getRequestDispatcher("mostrar-datos.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Error: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}