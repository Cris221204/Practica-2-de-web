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

@WebServlet(name = "ProcesarModificarServlet", value = "/procesar-modificar")
public class ProcesarModificarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("🔍 INICIANDO ProcesarModificarServlet");

        String tipo = request.getParameter("tipo");
        String idStr = request.getParameter("id");

        System.out.println("📝 Parámetros - tipo: " + tipo + ", id: " + idStr);

        EntityManager em = HibernateUtil.getEntityManager();
        EntityTransaction tx = null;

        try {
            Long id = Long.parseLong(idStr);
            tx = em.getTransaction();
            tx.begin();

            if ("producto".equals(tipo)) {
                Producto producto = em.find(Producto.class, id);
                if (producto != null) {
                    producto.setNombreProducto(request.getParameter("nombreProducto"));
                    producto.setDescripcionProducto(request.getParameter("descripcionProducto"));
                    producto.setCategoria(request.getParameter("categoria"));

                    if (request.getParameter("precio") != null) {
                        producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    }

                    if (request.getParameter("stock") != null) {
                        producto.setStock(Integer.parseInt(request.getParameter("stock")));
                    }

                    System.out.println("✅ Producto modificado ID: " + id);
                } else {
                    System.out.println("❌ Producto no encontrado ID: " + id);
                }
            } else if ("servicio".equals(tipo)) {
                Servicio servicio = em.find(Servicio.class, id);
                if (servicio != null) {
                    servicio.setNombreServicio(request.getParameter("nombreServicio"));
                    servicio.setDescripcionServicio(request.getParameter("descripcionServicio"));
                    servicio.setRequisitos(request.getParameter("requisitos"));

                    System.out.println("✅ Servicio modificado ID: " + id);
                } else {
                    System.out.println("❌ Servicio no encontrado ID: " + id);
                }
            }

            tx.commit();
            System.out.println("✅ Transacción completada");
            response.sendRedirect("exito-modificar.jsp");

        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            System.out.println("❌ Error en ProcesarModificarServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error-modificar.jsp");
        } finally {
            em.close();
            System.out.println("🔍 FINALIZANDO ProcesarModificarServlet");
        }
    }
}