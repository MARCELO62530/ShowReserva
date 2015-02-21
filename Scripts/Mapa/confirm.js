/*
 * SimpleModal Confirm Modal Dialog
 * http://simplemodal.com
 *
 * Copyright (c) 2013 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 */

jQuery(function ($) {
	$("#confirm-dialog input.confirm, #confirm-dialog a.confirm").click(function (e) {
		e.preventDefault();

		confirm("Tem Certeza que deseja esta mesa?", function () {
		    $("#lblmesa").text("1111");
		});
	});
});

function confirm(message, callback) {
	$("#confirm").modal({
		closeHTML: "<a href='#' title='Fechar' class='modal-close'>x</a>",
		position: ["20%",],
		overlayId: "confirm-overlay",
		containerId: "confirm-container", 
		onShow: function (dialog) {
			var modal = this;

			$(".message", dialog.data[0]).append(message);

			// if the user clicks "yes"
			$(".yes", dialog.data[0]).click(function () {
				// call the callback
				if ($.isFunction(callback)) {
					callback.apply();
				}
				// close the dialog
				modal.close(); // or $.modal.close();
			});
		}
	});
}