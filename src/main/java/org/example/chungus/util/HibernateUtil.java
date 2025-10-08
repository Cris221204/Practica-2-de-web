package org.example.chungus.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class HibernateUtil {
    private static final EntityManagerFactory entityManagerFactory;

    static {
        try {
            // Crea la EntityManagerFactory usando la unidad de persistencia "chungusPU"
            entityManagerFactory = Persistence.createEntityManagerFactory("chungusPU");
            System.out.println("✅ EntityManagerFactory creada exitosamente");
        } catch (Exception e) {
            System.err.println("❌ Error inicializando EntityManagerFactory: " + e.getMessage());
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    /**
     * Obtiene una instancia de EntityManager para interactuar con la base de datos
     * @return EntityManager configurado
     */
    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }

    /**
     * Cierra la EntityManagerFactory y libera los recursos
     * Debe llamarse al finalizar la aplicación
     */
    public static void close() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
            System.out.println("✅ EntityManagerFactory cerrada correctamente");
        }
    }

    /**
     * Verifica si la conexión a la base de datos está activa
     * @return true si la conexión está activa, false en caso contrario
     */
    public static boolean isConnected() {
        try {
            EntityManager em = getEntityManager();
            boolean connected = em.isOpen();
            em.close();
            return connected;
        } catch (Exception e) {
            return false;
        }
    }
}