

$(document).ready(function () {
    if (!String.prototype.format) {
        String.prototype.format = function () {
            var args = arguments;
            return this.replace(/{(\d+)}/g, function (match, number) {
                return typeof args[number] != 'undefined'
                  ? args[number]
                  : match
                ;
            });
        };
    }

    jQuery('input[name=Telefone]').focusout(function () {
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if (phone.length > 10) {

            element.mask("(99) 99999-999Z9", {
                translation: {
                    'Z': {
                        pattern: /[0-9]/, optional: true
                    }
                }
            });
        } else {
            element.mask("(99) 9999-9999Z9", {
                translation: {
                    'Z': {
                        pattern: /[0-9]/, optional: true
                    }
                }
            });

        }
    }).trigger('focusout');
});

$.RemoveInArray = function (array, value) {

    array = array.splice($.inArray(value, array), 1);
    return array;
};
$.validator.addMethod('cartao', function (value, element) {
    var retorno = false;

 
    $(element).validateCreditCard(function (result) {
        MVVM.Cliente.Reserva.Pagamento.TipoCartao = result.card_type.name;
    

        if (result.card_type !== null && result.luhn_valid && result.length_valid) {
            $(element).parent().addClass("has-success");
            $(element).parent().removeClass("has-error");
           
            retorno= true;
        } else {
            $(element).parent().removeClass("has-success");
            $(element).parent().addClass("has-error");

            retorno= false;
        }

  

        //console.log("CC type: " + result.card_type.name
        // + "\nLength validation: " + result.length_valid
        // + "\nLuhn validation: " + result.luhn_valid);
    }, {
        accept: ["visa", "mastercard", "amex"]
    });
    return retorno;

}, 'Cartão inválido.');
$.validator.setDefaults({
    ignore: []
    // any other default options and/or rules
});


jQuery.validator.addMethod("cpf", function (value, element) {
    value = jQuery.trim(value);
 
    value = value.replace('.', '');
    value = value.replace('.', '');
    var cpf = value.replace('-', '');
    while (cpf.length < 11) cpf = "0" + cpf;
    var expReg = /^0+$|^1+$|^2+$|^3+$|^4+$|^5+$|^6+$|^7+$|^8+$|^9+$/;
    var a = [];
    var b = new Number;
    var c = 11;
    for (var i = 0; i < 11; i++) {
        a[i] = cpf.charAt(i);
        if (i < 9) b += (a[i] * --c);
    }
    if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11 - x }
    b = 0;
    c = 11;
    for (y = 0; y < 10; y++) b += (a[y] * c--);
    if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11 - x; }
    if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10]) || cpf.match(expReg)) return this.optional(element) || false;
    return this.optional(element) || true;
}, "Informe um CPF válido.");
jQuery.validator.addMethod("telefoneBR", function (value, element) {
    
    return this.optional(element) || /^\(\d{2}\) (\d{4}|\d{5})\-\d{4}?$/.test(value);
}, "Digite um telefone válido");

$(document).ready(function () {
    jQuery('input[name=Telefone],input[name=Celular]').focusout(function () {
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if (phone.length > 10) {

            element.mask("(99) 99999-999Z9", {
                translation: {
                    'Z': {
                        pattern: /[0-9]/, optional: true
                    }
                }
            });
        } else {
            element.mask("(99) 9999-9999Z9", {
                translation: {
                    'Z': {
                        pattern: /[0-9]/, optional: true
                    }
                }
            });

        }
    }).trigger('focusout');


});
