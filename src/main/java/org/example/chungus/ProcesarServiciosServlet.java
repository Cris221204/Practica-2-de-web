package org.example.chungus;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.chungus.model.Servicio;
import org.example.chungus.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.io.IOException;

@WebServlet(name = "ProcesarServicioServlet", value = "/procesar-servicio")
class ProcesarServicioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros del formulario
        String accion = request.getParameter("accion");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");


        EntityManager em = HibernateUtil.getEntityManager();
        EntityTransaction tx = null;

        try {
            tx = em.getTransaction();
            tx.begin();

            if ("alta".equals(accion)) {
                // ALTA de servicio
                Servicio servicio = new Servicio();
                servicio.setNombreServicio(nombre);
                servicio.setDescripcionServicio(descripcion);

                em.persist(servicio);
                System.out.println("✅ Servicio guardado: " + nombre);

            } else if ("modificar".equals(accion)) {
                // MODIFICAR servicio (necesitarías el ID)
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.isEmpty()) {
                    Long id = Long.parseLong(idStr);
                    Servicio servicio = em.find(Servicio.class, id);

                    if (servicio != null) {
                        servicio.setNombreServicio(nombre);
                        servicio.setDescripcionServicio(descripcion);

                        System.out.println("✅ Servicio modificado: " + nombre);
                    }
                }
            }

            tx.commit();

            // Redirigir a página de éxito
            response.sendRedirect("exito-servicio.jsp");

        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
            response.sendRedirect("error-servicio.jsp");
        } finally {
            em.close();
        }
    }
}