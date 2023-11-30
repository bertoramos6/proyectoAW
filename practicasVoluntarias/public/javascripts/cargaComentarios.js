$(document).ready(() => {
    const botonVerComentarios = $('#botonVerComentarios');
    const botonAddComentario = $('#botonAddComentario');

    botonVerComentarios.on('click', () => {
        const url = window.location.href;
        const ultimoSlash = url.lastIndexOf('/');
        const nombreDestino = url.substring(ultimoSlash + 1);

        $.ajax({
            url: '/comentarios/' + nombreDestino,
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
        const url = window.location.href;
        const ultimoSlash = url.lastIndexOf('/');
        const nombreDestino = url.substring(ultimoSlash + 1);

        $.ajax({
            url: '/comentarios/' + nombreDestino,
            method: 'POST',
            data: {
                comentario: $('#comentario').val()
            },
            success: (data) => {
                $('#mensajeComentarioAdded').show();
                //$('#comentarios').html(data);
            },
            error: (error) => {
                $("#errorLogin").text("Usuario o contraseña incorrectos");
            }
        });
    });
});