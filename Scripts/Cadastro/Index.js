


var Model = {
    //#region Evento
    Evento: {
        Nome: "Show in Flash Back com atração Internacional CORONA"
    },
    //#endregion
    //#region Setor
    Setor: {
        setorId: 0,
        preco: 0
    },
    //#endregion

    //#region Ingressos

    Ingressos: {
        mesas: [],
        quantidade: 0,
        total: 0,
        qtdMesa: 0
    },
    //#endregion
    //#region Detalhe Do Pedido
    DetalheDoPedido: {
        Popula: function () {
            var tbody = $("#DetalheDoProduto>div>table>tbody");

            tbody.html("");
            var format = "<tr>" +
                "<td style='text-align:center'>" + Model.Setor.Nome + "</td>" +
                "<td style='text-align:center'>" + Model.Ingressos.quantidade + "</td>" +
                 "<td style='text-align:center'>" + Model.Ingressos.total + "</td>" +
                "<td style='text-align:center'>" + Model.Ingressos.mesas.toString() + "</td>" +
                "</tr>";
            tbody.append(format);
        }
    },
    //#endregion 
    Mesas: new Array(),

    Functions: {
        getMesas: function () {
            return Model.Ingressos.mesas.map(function (x) {
                return {
                    mesa: x,
                    evento: Model.Evento,
                    setor: Model.Setor
                }
            });
        }
    }

}
function Popula() {

    $("#Nome").val("Marcelo Sant'Ana Junior");
    $("#Cpf").val("41184973873");
    $("#Email").val("marcelo@perfeccio.com.br");
    $("#Telefone").val("1128657300").focus();

    $("#CartaoNumero").val("4000 0000 0000 0002");

    $("#CartaoMes").val("01");
    $("#CartaoAno").val("94");
    $("#CartaoCvc").val("211");
    $("#Quantidade").val("12");





}


//Popula();






var iframeMapa = {
    SetTotalMesa: function () {
        var iframe = $("#iframeMapa").contents();

        var remover = Model.Ingressos.mesas.slice(Model.Ingressos.qtdMesa);

        for (var i = 0; i < remover.length; i++) {
            var valor = remover[i];
            iframe.find("[title='" + valor + "']").removeClass("selected").blur();

            $.RemoveInArray(Model.Ingressos.mesas, valor);

        }



    }
}
function Base() {
    String.prototype.toFloat = function () {
        return this.isNaN ? 0 : parseFloat(this);
    }

    //div responsável pela ESCOLHA DOS ENGRESSOS
    var dvIngressos = $("#dvIngressos");
    //TR do setor selecionado.
    var trDvIngressos = dvIngressos.find("input[type='radio']:checked").closest("tr");
    //#region Setor
    //Atualiza os dados do setor
    Model.Setor = {
        Nome: "Pista",
        setorId: $('#SetorId').val(),
        preco: trDvIngressos.find("#data_preco_unitario").val()
    }
    //#endregion
    //#region Ingressos
    Model.Ingressos.quantidade = trDvIngressos.find("[type='text'].ingresso-quantidade").val();
    //Multiplica a quantidade de ingressos com o preco e adiciona ao total;
    Model.Ingressos.total = Model.Ingressos.quantidade * Model.Setor.preco;
    Model.Ingressos.qtdMesa = Math.ceil(Model.Ingressos.quantidade / 10);
    //  $("#iframeMapa")[0].contentWindow.TotalMesa = Model.Ingressos.qtdMesa;
    iframeMapa.SetTotalMesa();
    // Model.Ingressos.mesas = $("#iframeMapa").contents().find("#lstMesas>option").prop("selected", true).map(function() { return this.value }).toArray();
    $("#CartaoParcela").html("<option value='01'>01</option>");
    if (Model.Ingressos.quantidade > 4) {
        $("#CartaoParcela").append("<option value='02'>02</option>");
    }
    //#endregion 

    Model.DetalheDoPedido.Popula();

    return Model;
}
function resetActive(event, percent, step) {
    $(".progress-bar").css("width", percent + "%").attr("aria-valuenow", percent);
    $(".progress-completed").text(percent + "%");

    $("div,form").each(function () {
        if ($(this).hasClass("activestep")) {
            $(this).removeClass("activestep");
        }
    });

    if (event.target.className === "col-md-6") {
        $(event.target).addClass("activestep");
    }
    else {
        $(event.target.parentNode).addClass("activestep");
    }

    hideSteps();
    showCurrentStepInfo(step);
}
$(document).ready(function () {
    showCurrentStepInfo("step-3");
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-full-width",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }


    $("[data-step]").click(function () {
        var step = $(this).attr("data-step");
        $('html, body').animate({
            scrollTop: $("#step-" + step).offset().top
        }, 100);
        Base();
    });
    Base();


});
function hideSteps() {
    $("div,form").each(function () {
        if ($(this).hasClass("activeStepInfo")) {
            $(this).removeClass("activeStepInfo");
            $(this).addClass("hiddenStepInfo");
        }
    });
}
function showCurrentStepInfo(step) {
    var id = "#" + step;
    $(id).addClass("activeStepInfo");
}


var Validacao = {

    IsValid: function () {

        if ($("#happy").val() === "0") {
            $("#dvFormaDePagamento").css("border", "5px solid red");
            toastr.error("Verifique todos os campos.", "Aviso!!");

            return false;
        } else {
            if ($("#happy").val() !== "DetalheCartao") {
                $('#creditCardForm').removeData('validator');
                $('#creditCardForm').data('validator');
                var validator = $("#creditCardForm").validate();
                validator.resetForm();
            }
            else {

                $("#fheader").removeData("validator");
                $("#fheader").removeData("unobtrusiveValidation");
                var validator = $("#fheader").validate();
                validator.resetForm();
                $('#fheader').validate({
                    rules: {
                        Quantidade: {
                            required: true


                        }
                    }
                });
                $("#Quantidade").rules("add", {
                    range: [1, 99]
                });
                $("#creditCardForm").removeData("validator");
                $("#creditCardForm").removeData("unobtrusiveValidation");
                $("#creditCardForm").validate({
                    rules: {

                        CartaoNumero: {
                            required: true,
                            cartao: true
                        },
                        CartaoMes: {
                            required: true,
                            maxlength: 2

                        }, CartaoAno: {
                            required: true,
                            maxlength: 2
                        }, CartaoCvc: {
                            required: true,
                            maxlength: 3
                        }
                    }
                });


            }
            $("#dvFormaDePagamento").css("border", "0 solid blue");
        }
        var form = undefined;
        $("form").each(function () {
            if (!$(this).valid()) {
                form = $(this);
                //var validator = $("form").validate()
                //validator.errorList
            }
        });


        if (form != undefined) {


            hideSteps();
            var step = form.hasClass("step") ? form : $(form.closest(".step")[0]);


            var nvStep = step.attr("id");
            $($("div[data-step='" + nvStep.split('-')[1] + "']")[0]).click();
            showCurrentStepInfo(nvStep);
            toastr.error("Verifique todos os campos.", "Aviso!!");
            return false;
        }
        if (Model.Ingressos.mesas.length === 0) {
            toastr.error("Selecione a mesa desejada.", "Aviso!!");
            $($("div[data-step=3]")[0]).click();
            return false;
        }

        return true;
    },
    Reset: function () {
        $('#fheader').removeData('validator');
        $('#fheader').data('validator');
        var validator = $("#fheader").validate();
        validator.resetForm();
        $("#fheader").validate({
            rules: {
                Quantidade: {
                    required: true,
                    range: [1, 99]
                }
            }
        });

        $("#creditCardForm").validate({
            rules: {

                CartaoNumero: {
                    required: true,
                    cartao: true
                },
                CartaoMes: {
                    required: true,
                    maxlength: 2

                }, CartaoAno: {
                    required: true,
                    maxlength: 2
                }, CartaoCvc: {
                    required: true,
                    maxlength: 3
                }
            }
        });

        $("#RegistroGeral").validate({
            rules: {
                Nome: {
                    required: true,
                    minlength: 2
                },
                Cpf: {
                    cpf: true,
                    required: true
                },
                Email: {
                    required: true,
                    email: true
                }, Telefone: {
                    telefoneBR: true,
                    required: true
                }
            }
        });
    }
}
function EnviarServer() {

    if (Validacao.IsValid()) {
        waitingDialog.show('Finalizando...', { dialogSize: 'sm', progressType: 'sccess' });
        MVVM.Cliente.Nome = $("#Nome").val();
        MVVM.Cliente.Telefone = $("#Telefone").val();
        MVVM.Cliente.Cpf = $("#Cpf").val();
        MVVM.Cliente.Email = $("#Email").val();
        MVVM.Cliente.Reserva.LugaresQuantidade = $("#Quantidade").val();
        MVVM.Cliente.Reserva.Origem = window.Origem;
        MVVM.Cliente.Reserva.ValorUnitario = $("input[type='radio']:checked").parent().parent().find("input:hidden").val();
        MVVM.Cliente.Reserva.SetorId = 0;
        MVVM.Cliente.Reserva.ValorTotal = Model.Ingressos.quantidade * Model.Setor.preco;
        MVVM.Cliente.Reserva.status = 1;
        MVVM.Cliente.Reserva.SetorId = 0;
        MVVM.Cliente.Reserva.Pagamento.IsBoleto = $("#happy").val() === "DetalheCartao" ? false : true;
        MVVM.Cliente.Reserva.Pagamento.CartaoNumero = $("#CartaoNumero").val().replace(/ /g, "");
        MVVM.Cliente.Reserva.Pagamento.Parcela = parseInt($("#CartaoParcela").val());
        MVVM.Cliente.Reserva.Pagamento.Validade = $("#CartaoMes").val() + "/" + $("#CartaoAno").val();
        MVVM.Cliente.Reserva.Pagamento.Codigo = $("#CartaoCvc").val();
        MVVM.Cliente.Reserva.Pagamento.ValorParcela = (MVVM.Cliente.Reserva.ValorTotal / MVVM.Cliente.Reserva.Pagamento.Parcela);


        MVVM.Cliente.Reserva.Mesas = $.map(Model.Ingressos.mesas, function (n, i) {
            return { MesaId: n, Numero: n, Quantidade: 0 };
        });;



        //$.ajax({
        //    type: "POST",
        //    url: "/Reserva/PagamentoFinal",
        //    data: MVVM.Cliente,
        //    dataType: "json",
        //    success: function (response) {

        //        waitingDialog.show('Compra efetuada com sucesso!!você será redirecionado em instantes...', { dialogSize: 'sm', progressType: 'success' });

        //        setTimeout(function () { window.location = window.location.origin; }, 4000);


        //    }
        //});
        return MVVM.Cliente;
    }
    return MVVM;
}

var MVVM = {
    Cliente: {
        Nome: "",
        Telefone: "",
        Email: "",
        Cpf: "",
        Reserva: {
            Mesas: [{ Numero: 2, Quantidade: 0 }, { Numero: 2, Quantidade: 0 }],
            LugaresQuantidade: 2,
            Origem: 0,
            SetorId: 2,
            ValorTotal: 2.2,
            Status: 2,
            Pagamento: {
                PagamentoCartao: {
                    CartaoNumero: 4000000000000002,
                    Validade: "04/08",
                    Codigo: 123,
                    Parcela: 2,
                    ValorParcela: 02



                }

            }
        }
    }

}



