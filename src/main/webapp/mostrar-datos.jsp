<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.chungus.model.Producto" %>
<%@ page import="org.example.chungus.model.Servicio" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="CSS/estilos-base.css">
  <link rel="stylesheet" href="CSS/mostrar-datos.css">
  <title>Mostrar Datos - MotopasionMX</title>
  <meta charset="UTF-8">
</head>
<body>
<!-- BARRA NEGRA SUPERIOR -->
<nav class="navbar-top">
  <div class="navbar-container">
    <a href="index.jsp" class="navbar-logo">🏍️ MotopasionMX</a>
    <ul class="navbar-menu">
      <li class="navbar-item">
        <a href="menu-principal.jsp" class="navbar-link">📋 Gestión</a>
      </li>
      <li class="navbar-item">
        <a href="hello-servlet" class="navbar-link">🔧 Hello Servlet</a>
      </li>
    </ul>
  </div>
</nav>

<!-- CONTENIDO PRINCIPAL -->
<div class="mostrar-datos-container">
  <h1 class="titulo-principal">📋 Todos los Productos y Servicios</h1>

  <div class="tabla-container">
    <h2 class="subtitulo-seccion">📦 Productos</h2>
    <table class="tabla-datos">
      <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Categoría</th>
        <th>Stock</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
        if (productos != null && !productos.isEmpty()) {
          for (Producto producto : productos) {
      %>
      <tr>
        <td><strong><%= producto.getIdProducto() %></strong></td>
        <td><%= producto.getNombreProducto() %></td>
        <td><%= producto.getDescripcionProducto() != null ? producto.getDescripcionProducto() : "Sin descripción" %></td>
        <td><span class="badge-precio">$<%= producto.getPrecio() != null ? String.format("%.2f", producto.getPrecio()) : "0.00" %></span></td>
        <td><span class="badge-categoria"><%= producto.getCategoria() != null ? producto.getCategoria() : "Sin categoría" %></span></td>
        <td><span class="badge-stock"><%= producto.getStock() != null ? producto.getStock() : 0 %> unidades</span></td>
      </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="6" class="sin-datos">
          🚫 No hay productos registrados en la base de datos
        </td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>

  <div class="tabla-container">
    <h2 class="subtitulo-seccion">🔧 Servicios</h2>
    <table class="tabla-datos">
      <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Descripción</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Servicio> servicios = (List<Servicio>) request.getAttribute("servicios");
        if (servicios != null && !servicios.isEmpty()) {
          for (Servicio servicio : servicios) {
      %>
      <tr>
        <td><strong><%= servicio.getIdServicio() %></strong></td>
        <td><%= servicio.getNombreServicio() %></td>
        <td><%= servicio.getDescripcionServicio() != null ? servicio.getDescripcionServicio() : "Sin descripción" %></td>
      </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="3" class="sin-datos">
          🚫 No hay servicios registrados en la base de datos
        </td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>

  <!-- BOTONES DE ACCIÓN -->
  <div class="botones-accion">
    <a href="menu-principal.jsp" class="boton-accion">
      ← Volver al Menú Principal
    </a>
    <a href="mostrar-datos-servlet" class="boton-accion secundario">
      🔄 Actualizar Datos
    </a>
  </div>
</div>
</body>
</html>