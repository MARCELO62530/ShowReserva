function Ajax(paginaMetodo, parametro, msgUsuario, async) {

    async = async == undefined ? false : async;
    var saida;

    $.ajax({
        type: "POST",
        url: paginaMetodo,
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


//#region IframeModel

var iframe = {
    mesasLiberadas: Ajax("Mapa/Default.aspx/BuscaMesaReservada"),

    frame:$("#iframeMapa").contents(),
    Bloquear: function() {
        iframe.frame.find("li>a").addClass("block");
    },
    OnLoad: function() {
        iframe.Bloquear();
    },
    Liberar: function() {


        $(iframe.mesasLiberadas).map(function() {
            return iframe.frame.find("#airplane>li>a[title='"+this.Descricao+"']").removeClass("block");

        });
    }
}


////#endregion
//window.onload = function () {
//    iframe.OnLoad();
//}
