document.getElementById("enviarBtn").addEventListener("click", async function () {

  // Obtener los valores de los campos de entrada

  var usuario = document.getElementById("uname").value;

  var contrasenia = document.getElementById("pws").value;



  console.log(usuario, contrasenia)

  // Objeto con los datos a enviar



  // Enviar los datos al endpoint utilizando fetch

  const my_url = `https://webuspg.online/web_bank/Login.php?nombre_usuario=${usuario}&usuario_contrasenia=${contrasenia}`

  try {

    

    const responseLogin = await fetch(my_url, {

      method: 'GET',

      mode: "cors",

      headers: {

        'Content-Type': 'application/json',

      }

    })

    const data = await responseLogin.text();

   // console.log(data);



    

    let datos = JSON.parse(data)

    // console.log(typeof(data))

    // Hacer algo con la respuesta del servidor si es necesario



    if (datos.mensaje === "Acceso existoso") {

      const datosUsuario = await fetch("https://webuspg.online/web_bank/usuario_banca/obtener_usuario.php",{ 

      

      method: 'GET',

      mode: "cors",

      headers: {

        'Content-Type': 'application/json',

      }

      })

      const data2 = JSON.parse(await datosUsuario.text());

      

      const usuarioEncontrado = data2.find(item => item.usuario_contrasenia === contrasenia && item.nombre_usuario === usuario)

      if (usuarioEncontrado) {

        const datosUsuario2 = await fetch("https://webuspg.online/web_bank/cuenta_bancaria/obtener_cuenta.php",{ 

      

      method: 'GET',

      mode: "cors",

      headers: {

        'Content-Type': 'application/json',

      }

      })

      const data3 = JSON.parse(await datosUsuario2.text());

      const usuarioEncontrado2 = data3.find(item => item.id_cuenta === usuarioEncontrado.id_cuenta)

      if (usuarioEncontrado2){

        localStorage.setItem("token",JSON.stringify({

          username:usuarioEncontrado,

          datosUsuario:usuarioEncontrado2

        }))

        window.location.replace("./usuario.html")

      }

      }

    } else {

      alert("User or password incorrect. Try Again")

    }

  } catch (error) {

    alert("Ups... Exist a error")

    console.error('Error:', error);

  }



});



document.addEventListener('DOMContentLoaded', function () {



  console.log("imprima al principio")

  let mitoken = localStorage.getItem("token")

  if (mitoken === null) {

    console.log("no estoy logueado");



  } else {

  window.location.replace("./usuario.html")

  }

});



