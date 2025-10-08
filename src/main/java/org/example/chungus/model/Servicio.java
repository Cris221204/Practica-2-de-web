package org.example.chungus.model;

import jakarta.persistence.*;

@Entity
@Table(name = "servicios") // ← Nombre EXACTO de tu tabla
public class Servicio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_Servicio") // ← Columna exacta
    private Long idServicio;

    @Column(name = "Nombre_Servicio") // ← Columna exacta
    private String nombreServicio;

    @Column(name = "Descripcion_Servicio") // ← Columna exacta
    private String descripcionServicio;

    @Column(name = "Requisitos") // ← Columna exacta
    private String requisitos;

    // Constructores
    public Servicio() {}

    public Servicio(String nombreServicio, String descripcionServicio) {
        this.nombreServicio = nombreServicio;
        this.descripcionServicio = descripcionServicio;
    }

    // Getters y Setters
    public Long getIdServicio() { return idServicio; }
    public void setIdServicio(Long idServicio) { this.idServicio = idServicio; }

    public String getNombreServicio() { return nombreServicio; }
    public void setNombreServicio(String nombreServicio) { this.nombreServicio = nombreServicio; }

    public String getDescripcionServicio() { return descripcionServicio; }
    public void setDescripcionServicio(String descripcionServicio) { this.descripcionServicio = descripcionServicio; }

    public String getRequisitos() { return requisitos; }
    public void setRequisitos(String requisitos) { this.requisitos = requisitos; }

    @Override
    public String toString() {
        return "Servicio{" +
                "idServicio=" + idServicio +
                ", nombreServicio='" + nombreServicio + '\'' +
                '}';
    }
}