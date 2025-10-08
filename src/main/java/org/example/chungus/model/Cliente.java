package org.example.chungus.model;

import jakarta.persistence.*;

@Entity
@Table(name = "cliente") // Nombre EXACTO de tu tabla en MySQL
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_Cliente") // Nombre exacto de la columna
    private Long idCliente;

    @Column(name = "Nombre_Cliente", nullable = false, length = 100)
    private String nombreCliente;

    @Column(name = "Apellido_Cliente", length = 100)
    private String apellidoCliente;

    @Column(name = "Calle", length = 200)
    private String calle;

    @Column(name = "Colonia", length = 100)
    private String colonia;

    @Column(name = "Codigo_Postal", length = 10)
    private String codigoPostal;

    @Column(name = "Correo", length = 150)
    private String correo;

    @Column(name = "Numero", length = 20)
    private String numero;

    // Constructores
    public Cliente() {
        // Constructor vacío necesario para JPA
    }

    // Constructor con parámetros principales
    public Cliente(String nombreCliente, String apellidoCliente, String correo) {
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.correo = correo;
    }

    // Getters y Setters
    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    // Método toString para debugging
    @Override
    public String toString() {
        return "Cliente{" +
                "idCliente=" + idCliente +
                ", nombreCliente='" + nombreCliente + '\'' +
                ", apellidoCliente='" + apellidoCliente + '\'' +
                ", correo='" + correo + '\'' +
                '}';
    }
}