<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Éxito - MotopasionMX</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/estilos-base.css">
    <link rel="stylesheet" href="css/formularios.css">
</head>
<body>
<div class="main-content">
    <div class="form-container text-center">
        <div class="alert-success">
            <h2>✅ Registro Guardado Exitosamente</h2>
            <p>El registro ha sido guardado correctamente en la base de datos.</p>
        </div>

        <div class="form-buttons">
            <a href="menu-principal.jsp" class="btn btn-primary">Volver al Menú Principal</a>
            <a href="seleccion-tipo.jsp?accion=alta" class="btn btn-success">Agregar Otro Registro</a>
            <a href="mostrar-datos-servlet" class="btn btn-secondary">Ver Todos los Registros</a>
        </div>
    </div>
</div>
</body>
</html>