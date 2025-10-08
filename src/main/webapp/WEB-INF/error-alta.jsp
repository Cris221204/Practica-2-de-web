<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error - MotopasionMX</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/estilos-base.css">
    <link rel="stylesheet" href="css/formularios.css">
</head>
<body>
<div class="main-content">
    <div class="form-container text-center">
        <div class="alert-error">
            <h2>❌ Error al Guardar Registro</h2>
            <p>Ha ocurrido un error al intentar guardar el registro en la base de datos.</p>
            <p><small>Posibles causas: Datos inválidos o problema de conexión.</small></p>
        </div>

        <div class="form-buttons">
            <a href="menu-principal.jsp" class="btn btn-primary">Volver al Menú Principal</a>
            <a href="javascript:history.back()" class="btn btn-secondary">Intentar de Nuevo</a>
        </div>
    </div>
</div>
</body>
</html>