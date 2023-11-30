$(document).ready(() => {
    const botonVerComentarios = $('.botonVerComentarios');
    const botonAddComentario = $('#botonAddComentario');
    const botonRecargarComentarios = $('#botonRecargarComentarios');

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
                botonRecargarComentarios.show();
            },
            error: (error) => {
                $("#errorLogin").text("Usuario o contraseña incorrectos");
            }
        });
    });

    const campoComentario = $('#comentario');
    const campoComentarioAdded = $('#mensajeComentarioAdded');
    const campoComentarioErrorAdd = $('#mensajeComentarioErrorAdd');

    botonAddComentario.on('click', () => {
        const url = window.location.href;
        const ultimoSlash = url.lastIndexOf('/');
        const nombreDestino = url.substring(ultimoSlash + 1);
        const val = campoComentario.val();

        if (val === "") {
            campoComentarioErrorAdd.fadeIn(1).fadeOut(4000);
        } else {
            $.ajax({
                url: '/comentarios/' + nombreDestino,
                method: 'POST',
                data: {
                    comentario: campoComentario.val()
                },
                success: (data) => {
                    campoComentario.val("");
                    campoComentarioAdded.fadeIn(1).fadeOut(4000);
                    //$('#comentarios').html(data);
                },
                error: (error) => {
                    $("#errorLogin").text("Usuario o contraseña incorrectos");
                }
            });
        }
    });
});