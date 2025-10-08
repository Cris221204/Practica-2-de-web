<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Eliminar - MotopasionMX</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="CSS/formularios.css">
</head>
<body>
<div class="main-content">
  <div class="form-container">
    <h1 class="form-title" id="titulo">Eliminar</h1>

    <div class="alert-warning">
      <h3 class="advertencia">⚠️ Advertencia</h3>
      <p>Esta acción eliminará permanentemente el registro de la base de datos.</p>
    </div>

    <form id="form-eliminar" action="procesar-eliminar" method="post">
      <input type="hidden" id="tipo-hidden" name="tipo">

      <div class="form-group">
        <label class="form-label">ID del registro a eliminar:</label>
        <input type="number" id="id-eliminar" name="id" class="form-input" placeholder="Ingresa el ID del registro" required>
      </div>

      <div class="form-buttons">
        <button type="button" class="btn btn-danger" onclick="confirmarEliminacion()">
          Eliminar Permanentemente
        </button>
        <button type="button" class="btn btn-secondary" onclick="history.back()">Cancelar</button>
      </div>
    </form>

    <div class="text-center mt-20">
      <a href="seleccion-tipo.jsp" class="back-link">← Volver</a>
    </div>
  </div>
</div>

<script>
  function obtenerTipo() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('tipo');
  }

  function cargarFormulario() {
    const tipo = obtenerTipo();
    const titulo = document.getElementById('titulo');
    titulo.textContent = 'Eliminar ' + (tipo === 'producto' ? 'Producto' : 'Servicio');

    document.getElementById('tipo-hidden').value = tipo;
  }

  function confirmarEliminacion() {
    const id = document.getElementById('id-eliminar').value;
    const tipo = obtenerTipo();

    if (!id) {
      alert('Por favor ingresa un ID');
      return;
    }

    const confirmacion = confirm(`¿Estás seguro de que quieres eliminar el ${tipo} con ID: ${id}? Esta acción no se puede deshacer.`);

    if (confirmacion) {
      document.getElementById('form-eliminar').submit();
    }
  }

  document.addEventListener('DOMContentLoaded', cargarFormulario);
</script>
</body>
</html>