
package org.example.chungus.model;

import jakarta.persistence.*;

@Entity
@Table(name = "productos")
public class Producto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_Producto")
    private Long idProducto;

    @Column(name = "Nombre_Producto", nullable = false, length = 100)
    private String nombreProducto;

    @Column(name = "Descripcion_Producto", length = 500)
    private String descripcionProducto;

    @Column(name = "Categoria", length = 50)
    private String categoria;

    @Column(name = "Proveedor", length = 100)
    private String proveedor;

    @Column(name = "Precio")
    private Double precio;

    @Column(name = "Stock")
    private Integer stock;

    // Constructores
    public Producto() {}

    public Producto(String nombreProducto, String descripcionProducto, String categoria, Double precio) {
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.categoria = categoria;
        this.precio = precio;
    }

    // Getters y Setters
    public Long getIdProducto() { return idProducto; }
    public void setIdProducto(Long idProducto) { this.idProducto = idProducto; }

    public String getNombreProducto() { return nombreProducto; }
    public void setNombreProducto(String nombreProducto) { this.nombreProducto = nombreProducto; }

    public String getDescripcionProducto() { return descripcionProducto; }
    public void setDescripcionProducto(String descripcionProducto) { this.descripcionProducto = descripcionProducto; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public String getProveedor() { return proveedor; }
    public void setProveedor(String proveedor) { this.proveedor = proveedor; }

    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }

    public Integer getStock() { return stock; }
    public void setStock(Integer stock) { this.stock = stock; }

    @Override
    public String toString() {
        return "Producto{" +
                "idProducto=" + idProducto +
                ", nombreProducto='" + nombreProducto + '\'' +
                ", precio=" + precio +
                '}';
    }
}