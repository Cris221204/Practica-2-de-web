<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

  <title>Seleccionar Tipo - MotopasionMX</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="CSS/estilos-base.css">

  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .opciones { margin: 20px 0; }
    label { display: block; margin: 10px 0; font-size: 18px; }
    button { padding: 10px 20px; font-size: 16px; margin-top: 20px; }
  </style>
  <script>
    function obtenerAccion() {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get('accion');
    }

    function continuar() {
      const accion = obtenerAccion();
      const tipo = document.querySelector('input[name="tipo"]:checked');

      if (!tipo) {
        alert('Por favor selecciona Producto o Servicio');
        return;
      }

      if (accion === 'alta') {
        window.location.href = 'formulario-alta.jsp?tipo=' + tipo.value;
      } else if (accion === 'modificar') {
        window.location.href = 'formulario-modificar.jsp?tipo=' + tipo.value;
      } else if (accion === 'eliminar') {
        window.location.href = 'formulario-eliminar.jsp?tipo=' + tipo.value;
      }
    }
  </script>
</head>
<body>
<h1>Selecciona el Tipo</h1>
<div class="opciones">
  <label>
    <input type="radio" name="tipo" value="producto"> 📦 Producto
  </label>
  <label>
    <input type="radio" name="tipo" value="servicio"> 🔧 Servicio
  </label>
</div>
<button onclick="continuar()">Continuar</button>
<br><br>
<a href="menu-principal.jsp">← Volver</a>
</body>
</html>