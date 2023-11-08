(function() {
    'use strict';
    window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        let forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        let validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
                } else {
                    let startDate = new Date(document.getElementById('startDate').value);
                    let endDate = new Date(document.getElementById('endDate').value);
                    let today = new Date();
                    today.setHours(0,0,0,0);
                    
                    if (startDate < today) {
                        alert('La fecha de inicio debe ser posterior a hoy.');
                        event.preventDefault();
                        event.stopPropagation();
                        return false;
                    }
                    
                    if (endDate < startDate) {
                        alert('La fecha de fin debe ser posterior a la fecha de inicio.');
                        event.preventDefault();
                        event.stopPropagation();
                        return false;
                    }

                    // Mostramos el modal con el éxito de la reserva
                    let successModal = new bootstrap.Modal(document.getElementById('successModal'));
                    successModal.show();
                    form.classList.add('was-validated');
                }
            }, false);
        });
    }, false);
})();