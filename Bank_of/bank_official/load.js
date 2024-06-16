//Verifica si el navegador soporta Service Workers. Si es asi, continua con el registro del Service Worker
if ('serviceWorker' in navigator) {
    //Espera a que la pagina se cargue completamente antes de ejecutar el codigo dentro de la funcion
    window.addEventListener('load', function () {
        //Registra el archivo sw.js como un Service Worker. La funcion then() se ejecuta cuando el registro es exitoso
        this.navigator.serviceWorker.register('sw.js').then(function () {
            //Muestra un mensaje en la consola del navegador indicando que el archivo se ha registrado 
            //correctamente como Service Worker.
            console.log('Se registro el archivo')
        })
    })
}
