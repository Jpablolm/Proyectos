document.getElementById("form-tercero").addEventListener("submit", function(event) {
    event.preventDefault();
    
    // Capturando los valores del formulario
    const titular_cuenta = document.getElementById("uname_titular_cuenta_t").value;
    const numero_tercero = document.getElementById("uname_numero_tercero_t").value;
    const titular_tercero = document.getElementById("uname_tercero").value;
    
    // Guardar los valores en localStorage
    localStorage.setItem('titular_cuenta', titular_cuenta);
    localStorage.setItem('numero_tercero', numero_tercero);
    localStorage.setItem('titular_tercero', titular_tercero);

    // Construyendo la URL para la solicitud
    const my_url = `https://webuspg.online/web_bank/llamar_agregarTercero.php?titular_cuenta=${titular_cuenta}&numero_tercero=${numero_tercero}&titular_tercero=${titular_tercero}`;
    console.log("URL: ", my_url);

    // Realizando la solicitud fetch
    fetch(my_url, {
        method: 'GET',
        mode: "cors",
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        }
        throw new Error('Error al enviar los datos');
    })
    .then(data => {
        // Decodificar la respuesta JSON
        const respuestaJSON = JSON.parse(data);
        console.log(respuestaJSON);

        // Extraer el mensaje de error o validación
        const mensaje = respuestaJSON.mensaje;

        // Mostrar el mensaje en la interfaz de usuario
        const messageDiv = document.getElementById("message");
        messageDiv.style.display = "block"; // Mostrar el mensaje
        messageDiv.textContent = mensaje;

        if (mensaje === "Exitoso") {
            // Limpiar los datos de localStorage
            localStorage.removeItem('titular_cuenta');
            localStorage.removeItem('numero_tercero');
            localStorage.removeItem('titular_tercero');

            messageDiv.className = "success";
            setTimeout(() => {
                window.location.replace("./agregar_tercero.html"); // Redireccionar a otra página después de 2 segundos
            }, 2000);
        } else {
            messageDiv.className = "error";
        }
    })
    .catch(error => {
        const messageDiv = document.getElementById("message");
        messageDiv.style.display = "block";
        messageDiv.textContent = "Existe un error";
        messageDiv.className = "error";
        console.error('Error:', error);
    });
});