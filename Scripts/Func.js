function Ajax(PaginaMetodo, parametro, msgUsuario, async) {

    async = async == undefined ? false : async;
    var saida;

    $.ajax({
        type: "POST",
        url: PaginaMetodo,
        data: '{"list":"' + parametro + '"}',
        global: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        complete: function (msg) {
            if (msg.statusText == 'success' || msg.statusText == 'OK') {
                msgUsuario == undefined ? "" : mensagem(msgUsuario);
            }
            //                document.body.style.cursor = 'default';
            //                setTimeout($.unblockUI, 100);
        },
        async: async,
        cache: false,
        success: function (msg) {
            saida = msg.d;
        },
        error: function (
											   XMLHttpRequest,
											   textStatus,
											   errorThrown) {
            alert(XMLHttpRequest.responseText + '\n' + textStatus);
        }

    }); //ajax
    return saida;
}
var iframe = {
    bloquear: function () {
        $("#iframeMapa").contents().find('li>a').addClass('block');
    }
};


var frame = document.getElementById("iframeMapa");
frame.onre

frame.onload = function () {
    alert()
    console.log($(frame).contents().find('#airplane'))
};

//$(document).ready(function () {

//    iframe.bloquear();
//    //seleciona os reservados
//    var lst = Ajax('Mapa/Default.aspx/BuscaMesaReservada');
//    var airplan = $('#iframeMapa').contents().find('#airplane');
//    $(lst).map(function () {
//        return $(airplan).find('li>a[title="' + this.Descricao + '"]').removeClass('block');

//    });
//});
