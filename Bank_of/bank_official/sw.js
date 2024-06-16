
//Se declara la variable cacheSW con referencia al nombre del cache 'cacheApp' para nuestra App
var cacheSW = 'cacheApp';
// Se declara la variable listaArchivos que sera una matriz, la cual contendra los archivos que se 
// almacenaran en el cache, como'index.html'...
var listaArchivos = [//ejemplo, puede ser imagenes, html, css, js...
    'index.html',
    'about.html',
    'agregar_tercero.html',
    'estado_cuenta.html',
    'login.html',
    'realizar_transferencia.html',
    'services.html',
    'usuario.html',
    'css/all.css',
    'css/jquery.fancybox.min.css',
    'css/owl.carousel.min.css',
    'css/style.css',
    'images/about-img.jpg',
    'images/all-title-bg.jpg',
    'images/footer-bg.jpg',
    'images/logo1.png',
    'images/services-img-02.jpg',
    'images/services-img-03.jpg',
    'images/slider-01.jpg',
    'images/slider-02.jpg',
    'images/slider-03.jpg',
    'images/vision-img.jpg',
    'images/CAPTION.png',
    'images/ca.png',
    'images/CAPTURA.png',
    'images/vision-img.jpg',
    'js/agregarTercero.js',
    'js/banca_user.js',
    'js/contact_me.js',
    'js/filter.js',
    'js/imagesloaded.pkgd.min.js',
    'js/isotope.pkgd.min.js',
    'js/jqBootstrapValidation.js',
    'js/jquery.appear.js',
    'js/jquery.fancybox.min.js',
    'js/login.js',
    'js/logout.js',
    'js/owl.carousel.min.js',
    'js/script.js',
    'js/validarTrasferencia.js',
    'mail/contact_me.php',
    'webfonts/fa-brands-400.eot',
    'webfonts/fa-brands-400.svg',
    'webfonts/fa-brands-400.ttf',
    'webfonts/fa-brands-400.woff',
    'webfonts/fa-brands-400.woff2',
    'webfonts/fa-regular-400.eot',
    'webfonts/fa-regular-400.svg',
    'webfonts/fa-regular-400.ttf',
    'webfonts/fa-regular-400.woff',
    'webfonts/fa-regular-400.woff2',
    'webfonts/fa-solid-900.eot',
    'webfonts/fa-solid-900.svg',
    'webfonts/fa-solid-900.ttf',
    'webfonts/fa-solid-900.woff',
    'webfonts/fa-solid-900.woff2'

];
//Instalacion Service Worker

//Llama al evento para registrar la instalacion el service worker, mediante el uso de una funcion que contiene un evento
self.addEventListener("install", function(event) {
    // Indica un mensaje en la consola del navegador para indicar que el service worker esta instalado
    console.log("[Servicework] Install");
    //Este metodo le indica al navegador que espere hasta que se resuelva (o se rechace) la promesa 
    //devuelta por el siguiente bloque de codigo antes de que se considere completa la instalacion del Service Worker
    event.waitUntil(
        //Abrir cacheName y si no existe o crear el cache 
        caches.open(cacheSW).then(function(cache) {
            //Muestra un mensaje indicando que el service worker esta anadiendo la lista de archivos
            console.log("[ServiceWorker] Caching app shell");
            //Este metodo toma la matriz listaArchivos recupera todas ellas y las anade al cache.
            return cache.addAll(listaArchivos);
        })
    );
});

self.addEventListener('fetch', event => {
    event.respondWith(
      caches.match(event.request)
        .then(response => {
          if (response) {
            return response;
          }
          return fetch(event.request);
        }).catch(() => caches.match('/offline.html'))
    );
  });


//Cunado el service worker se haya instalado pasa a la etapa de activacion del service worker
self.addEventListener("Activate", function(event) {
    //Muestra un mensaje que el service worker esta activado
    console.log("[Servicework] Activate");
    //Esperando la limpieza del cache, espera a que se rechace o se resuelva el bloque de codigo
    event.waitUntil(
        //Recupera los nombres de los caches disponibles, la funcion hace la devolucion de llamada que recibe la 
        //lista de nombres de cache (listaDeClaves) como argumento.
        caches.keys().then(function(keylist) {
            //Mapea cada nombre de cache a una nueva promesa que elimina la cache
            // si su clave no coincide con cacheName. Promise.all()
            return Promise.all(keylist.map(function(key) {
                //Verifica si el nombre del cache coincide con cacheName
                if (key != cacheSW){
                    //Muestra un mensaje que que el service worker esta removiendo una cache antigua
                    console.log("[ServiceWorker] Removing old cache shell", key);
                    //elimina la cache cuya clave es key
                    return caches.delete(key);
                }
            }));
        })
    );

    //Intenta tomar el control de todas las paginas abiertas,para gestionar las paginas de manera
    //efectiva
    return self.clients.claim();
})
