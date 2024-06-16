document.getElementById("form-validarTrasnferencia").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent default form submission

    // Obtener los valores de los campos de entrada
    const titular_cuenta = document.getElementById("uname_titula_cuenta").value;
    const numero_banca_cuenta = document.getElementById("uname_numero_cuenta").value;
    const numero_cuenta = document.getElementById("uname_numero_cuenta_tercero").value;
    const deposito_pago = document.getElementById("uname_deposito_pago").value;
    const descripcion = document.getElementById("uname_descripcion").value;

    // Enviar los datos al endpoint utilizando fetch
    const my_url = `https://webuspg.online/web_bank/ValidarTransferencia.php?titular_cuenta=${titular_cuenta}&numero_banca_cuenta=${numero_banca_cuenta}&numero_cuenta=${numero_cuenta}&deposito_pago=${deposito_pago}&descripcion=${descripcion}`;
    console.log(my_url);

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

        // Extraer el mensaje de error o validaci¨®n
        const mensaje = respuestaJSON.mensaje;

        // Mostrar el mensaje en la interfaz de usuario
        const messageDiv = document.getElementById("message");
        messageDiv.style.display = "block"; // Mostrar el mensaje
        messageDiv.textContent = mensaje;

        if (mensaje.includes("Transferencia exitosa")) {
            messageDiv.className = "success";
            setTimeout(() => {
                window.location.replace("./realizar_transferencia.html"); // Redireccionar a otra p¨¢gina despu¨¦s de 2 segundos
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