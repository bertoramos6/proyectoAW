$(document).ready(() => {
    const botonVerComentarios = $('#botonVerComentarios');
    const botonAddComentario = $('#botonAddComentario');

    botonVerComentarios.on('click', () => {
        $.ajax({
            url: '/comentarios',
            method: 'GET',
            success: (data) => {
                // Hacer un if que si no hay comentarios, añada el texto de que aun no hay comentarios
                $('#comentarios').html(data);
                botonVerComentarios.hide();
            },
            error: (error) => {
                $("#errorLogin").text("Usuario o contraseña incorrectos");
            }
        });
    });

    botonAddComentario.on('click', () => {
        $.ajax({
            url: '/comentarios',
            method: 'POST',
            data: {
                comentario: $('#comentario').val()
            },
            success: (data) => {
                $('#comentarios').html(data);
            },
            error: (error) => {
                $("#errorLogin").text("Usuario o contraseña incorrectos");
            }
        });
    });
});