$('.form-ajax').submit(function (e) {
   e.preventDefault();
   var form = $(this);
   
   var tipo = form.attr('data-form');
   var accion = form.attr('action');

   var metodo = form.attr('method');
   var progress = form.children('.RespuestaAjax');

   var msjError = '<script>Swal.fire({toast:true,position: "top-end",icon: "error",title: "Ups. Ocurrió un error inesperado.",showConfirmButton: false,timer: 2000 });</script>';


   var formdata = new FormData(this);

   var textoAlerta;
    if (tipo === 'save') {
        textoAlerta = 'Datos guardados.';
    }else if (tipo === 'delete') {
        textoAlerta = 'Datos eliminados.';
    }else if (tipo === 'update'){
      textoAlerta = 'Datos actualizados.';
    }else {
        textoAlerta = 'Operación realizada';
    }

    // console.time( &#8220;Peticion AJAX&#8221; );

    $.ajax({
            type: metodo,
            url: accion,
            data: formdata ? formdata : form.serialize(),
            cache: false,
            contentType: false,
            processData: false,
            xhr: function(){
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener('progress', function(evt) {
                  if (evt.lengthComputable) {
                    var percentComplete = evt.loaded / evt.total;
                    percentComplete = parseInt(percentComplete * 100);
                    if (percentComplete < 100) {
                      progress.html('<p class="text-center">Procesado... (' + percentComplete + '%)</p><div class="progress progress-striped active"><div class="progress-bar progress-bar-info" style="width: '+percentComplete+'%;"></div></div>');
                    }else {
                      progress.html('<p class="text-center"></p>');
                    }
                  }
                }, false
              );
                return xhr;
            },
            success: function (data) {

              if (data === null) {
                data='NULO';
              }
              console.log("data", data);
              var jdata = $.parseJSON(data);
              // console.log("jdata", jdata);

              if(jdata.location){
                document.location = jdata.location;
              }

              if (jdata.sweetAlert==true) {
                  Swal.fire({
                    toast:true,
                    position: "top-end",
                    icon: jdata.alertType,
                    title: jdata.alertMessage,
                    showConfirmButton: false
                    ,timer: 3000 
                  });              
              }                           
            },
            error: function() {
                  Swal.fire({
                  	toast:true,
                  	position: "top-end",
                  	icon: "error",
                  	title: "Ups. Ocurrió un error inesperado.",
                  	showConfirmButton: false
                  	,timer: 3000 
                  });
            }
        });
    return false;
});
