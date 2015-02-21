/// <reference path="jquery.url.js" />


var arDesc = [];
var artitulo = [];

Array.prototype.remove = function (x) {
	var i;
	for (i in this) {
		if (this[i].toString() == x.toString()) {
			this.splice(i, 1)
		}
	}
}
function popDropDown(options) {
	var select = document.getElementById('lstMesas');

	var i;

	for (i = 0; i < options.length; i++) {
		var opt = options[i];
		var el = document.createElement("option");
		el.textContent = opt;
		el.value = opt;
		select.appendChild(el);
	}

}
function montalst() {
	var i;
	for (i = 0; i < arDesc.length; i++) {
		var opt = arDesc[i];
		Enviadados('Default.aspx/envia', opt);
		Enviadados('Default.aspx/titulos', artitulo[i]);

	}

	window.location.href = '../frmEscolha.aspx';
}


function Enviadados(PaginaMetodo, parametro, msgUsuario, async) {

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





$(document).ready(function () {

	// Disable various aspects of passenger details table

	$('#passenger_details input, #passenger_details select').attr('disabled', 'disabled');

	// Add class="selected" to tab + tbody
	$('#tabs a:first, #passenger_details tbody:first').addClass('selected');





	// Get the value of the tab link, and display tbody
	$('#tabs a').click(function () {
		// Switch class="selected" for tabs
		$('#tabs a').removeClass('selected');
		$(this).addClass('selected');
		// Asign value of the link target
		var thisTarget = $(this).attr('href');
		// Show target tbody and hide others
		$('#passenger_details tbody').removeClass('selected');
		$(thisTarget).addClass('selected');
		this.blur();
		return false;
	}
		);


	//seleciona os reservados
	var lst = Enviadados('Default.aspx/BuscaMesaReservada');
	var i;
	var airplan = document.getElementById('airplane');
	$(airplan).find('li>a').each(function () {
	    if (lst) {

	    }
	});
	$(airplan).each(function () {
		$("li", this).each(function (i) {
			for (i = 0; i < lst.length; i++) {
				var opt = lst[i].Descricao.toLocaleString();
				if (opt.toLowerCase().trim() == (this).innerText.toLowerCase().trim()) {
					//                    alert(opt.toLowerCase() + ' - ' + (this).innerText.toLowerCase());
					$("a", this).toggleClass('block')
					this.blur();
				}
			}

		});
	});

	var url = window.location.search;
	url = url.replace("?", ''); // remove the ?


	//    if (url != '') {

	var setorb = ""// document.getElementById('lblsetor').innerText.toLowerCase();
	setorb = url.toLowerCase().indexOf("socio") == -1 ? "Socio" : "pista";
	$(airplan).each(function () {
		$("li", this).each(function (i) {
			if ((this).innerText.toLowerCase().trim().indexOf(setorb.toLowerCase().trim()) > -1) {
				if ($("a", this).hasClass('block') == false) {
					$("a", this).toggleClass('block')
					this.blur();
				}
			}
		});
	});
	//    }

	// Add click listener to seats
	$('#airplane a').click(function () {
		// Asign value of the link target
		var thisTarget = $(this).attr('title');
		if ($(this).hasClass('block')) {
			alert('Mesa Reservada');
			return;
		}

		if (parseInt($("#hescolhidas").val()) >= parseInt($("#hqtdmesa").val())) {
			alert('Para a sua quantidade de ingresso esta disponibilizada ' + $("#hqtdmesa").val() + ' Mesa(s) ');
			if (this.checked === true) {
				$(this).removeClass('selected');
				$(this).removeClass('block');
				$(this).attr('disabled', 'disabled').val('');


				this.blur();
			}
			return;
		}


		$("#hescolhidas").val(parseInt($("#hescolhidas").val()) + 1)


		$(thisTarget).addClass('selected');
		$(this).toggleClass('selected')
		if ($(this).hasClass('selected')) {
			arDesc.push('1 Mesa  N. - ' + thisTarget + "");
			artitulo.push(thisTarget);
		}
		else {
			arDesc.remove('1 Mesa N. - ' + thisTarget + "");
			artitulo.remove(thisTarget);
		}
		$("#lstMesas").empty();
		popDropDown(arDesc);
		$('#lblqtd').text(arDesc.length);
		$('#lblTotalMesa').text(arDesc.length * 0);
		$('#TotalGeral').text(parseInt(arDesc.length * 0) + parseInt($('#lblTotal').text()));
		this.blur();
		return false;
	}
		);

	// Assign function to master checkbox
	$('#check_all').click(function () {
		if (this.checked === true) {
			// Add class="selected" to seat
			$('#airplane a, #passenger_details tbody tr').addClass('selected');
			$('#passenger_details input, #passenger_details select').removeAttr('disabled');
			this.blur();
		}
		else {
			// Remove class="selected" from seat
			$('#airplane a, #passenger_details tbody tr').removeClass('selected');
			$('#passenger_details input').attr('disabled', 'disabled').val('');
			$('#passenger_details select').each(function () {
				this.disabled = true;
				this.selectedIndex = 0;
			}
					);
			this.blur();
		}
	}
		);

	// Disable the form submission
	$('form').submit(function () {
		//        alert('This is only a test. Were it a real emergency, panic would ensue.');
		//        return false;
	}
		);
}
);