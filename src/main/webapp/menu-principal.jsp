<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Gestión - MotopasionMX</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="CSS/estilos-base.css">

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
<div class="main-content">
  <!-- Título ROJO -->
  <h1>🏍️ Gestión de MotopasionMX</h1>

  <div class="management-buttons">
    <button class="management-btn" onclick="location.href='seleccion-tipo.jsp?accion=alta'">
      <div style="font-size: 2rem; margin-bottom: 10px;">📥</div>
      <div>Dar de Alta</div>
    </button>

    <button class="management-btn" onclick="location.href='seleccion-tipo.jsp?accion=modificar'">
      <div style="font-size: 2rem; margin-bottom: 10px;">✏️</div>
      <div>Modificar</div>
    </button>

    <button class="management-btn" onclick="location.href='seleccion-tipo.jsp?accion=eliminar'">
      <div style="font-size: 2rem; margin-bottom: 10px;">🗑️</div>
      <div>Eliminar</div>
    </button>

    <button class="management-btn" onclick="location.href='mostrar-datos-servlet'">
      <div style="font-size: 2rem; margin-bottom: 10px;">📋</div>
      <div>Mostrar Todos</div>
    </button>
  </div>

  <div class="text-center mt-20">
    <a href="index.jsp" class="back-link">← Volver al Inicio</a>
  </div>
</div>
</body>
</html>