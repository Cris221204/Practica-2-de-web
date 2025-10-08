<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="CSS/formularios.css">
  <title>Modificar - MotopasionMX</title>
  <meta charset="UTF-8">

  <script>
    function obtenerTipo() {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get('tipo');
    }

    function cargarFormulario() {
      const tipo = obtenerTipo();
      const titulo = document.getElementById('titulo');
      const formularioProducto = document.getElementById('formulario-producto');
      const formularioServicio = document.getElementById('formulario-servicio');
      const estado = document.getElementById('estado-formulario');

      titulo.textContent = 'Modificar ' + (tipo === 'producto' ? 'Producto' : 'Servicio');

      // Poner el tipo en los forms hidden
      document.getElementById('tipo-producto').value = tipo;
      document.getElementById('tipo-servicio').value = tipo;

      if (tipo === 'producto') {
        formularioProducto.classList.remove('hidden');
        formularioServicio.classList.add('hidden');
      } else {
        formularioProducto.classList.add('hidden');
        formularioServicio.classList.remove('hidden');
      }

      // Mostrar estado inicial
      estado.textContent = '🔍 Busca un registro para habilitar el formulario';
      estado.className = 'estado-formulario estado-inactivo';
    }

    function buscarRegistro() {
      const tipo = obtenerTipo();
      const id = document.getElementById('id-buscar').value;
      const estado = document.getElementById('estado-formulario');

      if (!id) {
        alert('Por favor ingresa un ID');
        return;
      }

      // Aquí normalmente buscarías el registro y llenarías el formulario
      // Por ahora simulamos que se encontró
      estado.textContent = '✅ Registro con ID: ' + id + ' encontrado. Ahora puedes modificar los datos.';
      estado.className = 'estado-formulario estado-activo';

      // Habilitar el formulario
      document.getElementById('formulario-' + tipo).style.opacity = '1';
    }

    function enviarModificacion() {
      const tipo = obtenerTipo();
      const id = document.getElementById('id-buscar').value;

      if (!id) {
        alert('Por favor busca un registro primero');
        return;
      }

      // Poner el ID en el form correspondiente
      document.getElementById('id-' + tipo).value = id;

      // Enviar el formulario
      document.getElementById('formulario-' + tipo).submit();
    }
  </script>
</head>
<body onload="cargarFormulario()">
<div class="form-container">
  <h1 id="titulo">Modificar</h1>

  <!-- Estado del formulario -->
  <div id="estado-formulario" class="estado-formulario estado-inactivo">
    🔍 Busca un registro para habilitar el formulario
  </div>

  <div class="busqueda">
    <h3>🔍 Buscar Registro a Modificar</h3>
    <div class="form-group">
      <label>ID del registro:</label>
      <input type="number" id="id-buscar" placeholder="Ingresa el ID">
      <button type="button" onclick="buscarRegistro()">Buscar</button>
    </div>
  </div>

  <!-- Formulario para Modificar Productos -->
  <form id="formulario-producto" action="procesar-modificar" method="post" style="opacity: 0.5;">
    <input type="hidden" id="tipo-producto" name="tipo" value="producto">
    <input type="hidden" id="id-producto" name="id">

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
      <input type="number" name="stock">
    </div>
  </form>

  <!-- Formulario para Modificar Servicios -->
  <form id="formulario-servicio" action="procesar-modificar" method="post" style="opacity: 0.5;">
    <input type="hidden" id="tipo-servicio" name="tipo" value="servicio">
    <input type="hidden" id="id-servicio" name="id">

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

  <div class="botones-principales">
    <button onclick="enviarModificacion()">🔄 Actualizar</button>
    <button onclick="history.back()">❌ Cancelar</button>
  </div>

  <div style="text-align: center; margin-top: 20px;">
    <a href="seleccion-tipo.jsp">← Volver a Selección</a>
  </div>
</div>
</body>
</html>