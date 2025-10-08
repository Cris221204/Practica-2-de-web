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

@WebServlet(name = "ProcesarAltaServlet", value = "/procesar-alta")
public class ProcesarAltaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");
        EntityManager em = HibernateUtil.getEntityManager();
        EntityTransaction tx = null;

        try {
            tx = em.getTransaction();
            tx.begin();

            if ("producto".equals(tipo)) {
                // Guardar PRODUCTO
                Producto producto = new Producto();
                producto.setNombreProducto(request.getParameter("nombreProducto"));
                producto.setDescripcionProducto(request.getParameter("descripcionProducto"));
                producto.setCategoria(request.getParameter("categoria"));
                producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
                producto.setStock(Integer.parseInt(request.getParameter("stock")));

                em.persist(producto);

            } else if ("servicio".equals(tipo)) {
                // Guardar SERVICIO
                Servicio servicio = new Servicio();
                servicio.setNombreServicio(request.getParameter("nombreServicio"));
                servicio.setDescripcionServicio(request.getParameter("descripcionServicio"));
                servicio.setRequisitos(request.getParameter("requisitos"));

                em.persist(servicio);
            }

            tx.commit();
            response.sendRedirect("exito-alta.jsp");

        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
            response.sendRedirect("error-alta.jsp");
        } finally {
            em.close();
        }
    }
}