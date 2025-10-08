package org.example.chungus;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.chungus.model.Producto;
import org.example.chungus.model.Servicio;
import org.example.chungus.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.io.IOException;

@WebServlet(name = "ProcesarEliminarServlet", value = "/procesar-eliminar")
public class ProcesarEliminarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");
        String idStr = request.getParameter("id");

        EntityManager em = HibernateUtil.getEntityManager();
        EntityTransaction tx = null;

        try {
            Long id = Long.parseLong(idStr);
            tx = em.getTransaction();
            tx.begin();

            if ("producto".equals(tipo)) {
                Producto producto = em.find(Producto.class, id);
                if (producto != null) {
                    em.remove(producto);
                    System.out.println("✅ Producto eliminado ID: " + id);
                } else {
                    System.out.println("❌ Producto no encontrado ID: " + id);
                }
            } else if ("servicio".equals(tipo)) {
                Servicio servicio = em.find(Servicio.class, id);
                if (servicio != null) {
                    em.remove(servicio);
                    System.out.println("✅ Servicio eliminado ID: " + id);
                } else {
                    System.out.println("❌ Servicio no encontrado ID: " + id);
                }
            }

            tx.commit();
            response.sendRedirect("exito-eliminar.jsp");

        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
            response.sendRedirect("error-eliminar.jsp");
        } finally {
            em.close();
        }
    }
}