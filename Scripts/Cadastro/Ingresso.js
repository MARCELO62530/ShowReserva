$("#Quantidade").bind("keyup", function () {
    var objeto = $(this);
    var mesaAtual = Math.ceil(objeto.val().toFloat() / 10);
    
    if (mesaAtual < Model.Ingressos.qtdMesa) {
        toastr.warning("Você alterou o número de ingresso,as mesas foram alteradas.", "Aviso!!");
    }
    Base();
    var tr = $(this).closest("tr");
    var valorUnitario = tr.find("#data_preco_unitario").val();
    var valorTotal = parseInt($(this).val()) * parseInt(valorUnitario);

   
    if (valorTotal.isNaN) {
        valorTotal = 0;
    }
    $("#data-preco-total").html(valorTotal);

});

