<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Alta - MotopasionMX</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="CSS/formularios.css">
  <script>
    function obtenerTipo() {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get('tipo')
    }

    function cargarFormulario() {
      const tipo = obtenerTipo();
      const titulo = document.getElementById('titulo');
      const formularioProducto = document.getElementById('formulario-producto');
      const formularioServicio = document.getElementById('formulario-servicio');

      titulo.textContent = 'Alta de ' + (tipo === 'producto' ? 'Producto' : 'Servicio');

      if (tipo === 'producto') {
        formularioProducto.classList.remove('hidden');
        formularioServicio.classList.add('hidden');
      } else {
        formularioProducto.classList.add('hidden');
        formularioServicio.classList.remove('hidden');
      }
    }

    function enviarFormulario() {
      const tipo = obtenerTipo();
      if (tipo === 'producto') {
        document.getElementById('formulario-producto').submit();
      } else {
        document.getElementById('formulario-servicio').submit();
      }
    }
  </script>
</head>
<body onload="cargarFormulario()">
<div class="form-container">
  <h1 id="titulo">Alta</h1>

  <!-- Formulario para Productos -->
  <form id="formulario-producto" action="procesar-alta" method="post">
    <input type="hidden" name="tipo" value="producto">

    <div class="form-group">
      <label>📦 Nombre del Producto:</label>
      <input type="text" name="nombreProducto" required>
    </div>
    <div class="form-group">
      <label>📝 Descripción:</label>
      <textarea name="descripcionProducto" rows="3"></textarea>
    </div>
    <div class="form-group">
      <label>🏷️ Categoría:</label>
      <input type="text" name="categoria">
    </div>
    <div class="form-group">
      <label>💰 Precio:</label>
      <input type="number" step="0.01" name="precio" required>
    </div>
    <div class="form-group">
      <label>📊 Stock:</label>
      <input type="number" name="stock" value="0">
    </div>
  </form>

  <!-- Formulario para Servicios -->
  <form id="formulario-servicio" action="procesar-alta" method="post">
    <input type="hidden" name="tipo" value="servicio">

    <div class="form-group">
      <label>🔧 Nombre del Servicio:</label>
      <input type="text" name="nombreServicio" required>
    </div>
    <div class="form-group">
      <label>📝 Descripción:</label>
      <textarea name="descripcionServicio" rows="3"></textarea>
    </div>
    <div class="form-group">
      <label>📋 Requisitos:</label>
      <input type="text" name="requisitos">
    </div>
    <div class="form-group">
      <label>💰 Precio:</label>
      <input type="number" step="0.01" name="precio" required>
    </div>
  </form>

  <div style="text-align: center; margin-top: 30px;">
    <button onclick="enviarFormulario()">💾 Guardar</button>
    <button type="button" onclick="history.back()">❌ Cancelar</button>
  </div>

  <div style="text-align: center; margin-top: 20px;">
    <a href="seleccion-tipo.jsp">← Volver a Selección</a>
  </div>
</div>
</body>
</html>