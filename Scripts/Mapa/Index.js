

$(document).ready(function () {
    document.getElementById('iframeMapa').onload = function () {

        var ifrm = document.getElementById('iframeMapa');

        var doc = ifrm.contentWindow.document;
        var form = doc.getElementById('airplane');

     
        $(form).find("li>a").click(function () {


            if ($(this).hasClass('block')) {
                alert('Mesa Reservada');
                return false;
            }
            var link = $(this);
            var valor = link.attr("title");


            link.blur();
            if (Model.Ingressos.mesas.indexOf(valor) !== -1) {
                $.RemoveInArray(Model.Ingressos.mesas, valor);
            } else {
                if (Model.Ingressos.mesas.length >= Math.ceil(Model.Ingressos.quantidade / 10)) {
                    link.removeClass("selected");
                    link.blur();
                    toastr.error("A mesa é disponível a cada 10 ingressos,Você pode escolher: " + Model.Ingressos.qtdMesa + " Mesa(s)");
                   
                } else {
                    Model.Ingressos.mesas.push(valor);
                    $("#iframeMapa").contents().find("li>a").removeClass("selected").blur();
                    $("#iframeMapa").contents().find(Model.Ingressos.mesas.map(function (x) { return "[title='" + x + "']" }).toString()).addClass("selected");

                
                   
                }
            }
            Base();
            $("#iframeMapa").contents().find("li>a").removeClass("selected").blur();
            $("#iframeMapa").contents().find(Model.Ingressos.mesas.map(function (x) { return "[title='" + x + "']" }).toString()).addClass("selected");
            $("#iframeMapa").contents().find("#lblMesa").html(Model.Ingressos.mesas.toString());

            return false;

        });


    }
});


