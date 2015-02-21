jQuery(function($) {'use strict',
	
	//Countdown js
	 $("#countdown").countdown({
			date: "11 April 2015 21:00:00",
			format: "on"
		},
		
		function() {
			// callback function
		});
	

	
	//Scroll Menu

	function menuToggle()
	{
		var windowWidth = $(window).width();

		if(windowWidth > 767 ){
			$(window).on('scroll', function(){
				if( $(window).scrollTop()>405 ){
					$('.main-nav').addClass('fixed-menu animated slideInDown');
				} else {
					$('.main-nav').removeClass('fixed-menu animated slideInDown');
				}
			});
		}else{
			
			$('.main-nav').addClass('fixed-menu animated slideInDown');
				
		}
	}

	menuToggle();
	
	
	// Carousel Auto Slide Off
	$('#event-carousel, #twitter-feed, #sponsor-carousel ').carousel({
		interval: false
	});


	// Contact form validation
	var form = $('.contact-form');
	form.submit(function () {'use strict',
		$this = $(this);
		$.post($(this).attr('action'), function(data) {
			$this.prev().text(data.message).fadeIn().delay(3000).fadeOut();
		},'json');
		return false;
	});

	$( window ).resize(function() {
		menuToggle();
	});

	$('.main-nav ul').onePageNav({
		currentClass: 'active',
	    changeHash: false,
	    scrollSpeed: 900,
	    scrollOffset: 0,
	    scrollThreshold: 0.3,
	    filter: ':not(.no-scroll)'
	});

});


// Google Map Customization
(function(){

	var map;

	map = new GMaps({
		el: '#gmap',
		lat:-23.673270006962127,
		lng:  -46.5817859,
		scrollwheel:false,
		zoom: 18,
		zoomControl : false,
		panControl : false,
		streetViewControl : true,
		mapTypeControl: false,
		overviewMapControl: false,
		clickable: false
	});

	var image = 'images/map-icon.png';
	map.addMarker({
		lat: -23.673270006962127,
		lng:  -46.5817859,
		icon: image,
		animation: google.maps.Animation.DROP,
		verticalAlign: 'bottom',
		horizontalAlign: 'center',
		backgroundColor: '#3e8bff',
	});


	var styles = [ 

	{
		"featureType": "road",
		"stylers": [
		{ "color": "#b4b4b4" }
		]
	},{
		"featureType": "water",
		"stylers": [
		{ "color": "#d8d8d8" }
		]
	},{
		"featureType": "landscape",
		"stylers": [
		{ "color": "#f1f1f1" }
		]
	},{
		"elementType": "labels.text.fill",
		"stylers": [
		{ "color": "#000000" }
		]
	},{
		"featureType": "poi",
		"stylers": [
		{ "color": "#d9d9d9" }
		]
	},{
		"elementType": "labels.text",
		"stylers": [
		{ "saturation": 1 },
		{ "weight": 0.1 },
		{ "color": "#000000" }
		]
	}

	];

	map.addStyle({
		styledMapName:"Styled Map",
		styles: styles,
		mapTypeId: "map_style"  
	});

	map.setStyle("map_style");
}());


$(function () {

    "use strict";

    $('#contactform').validate({
        rules: {
            Remetente: {
                required: true,
                minlength: 2
            },
            Email: {
                required: true,
                email: true
            },
            Assunto: {
                required: true,
            },
            Texto: {
                required: true
            }
        },
        messages: {
            Remetente: {
                required: "Digite seu nome",
                minlength: "seu nome deve ser composto de pelo menos 2 caracteres"
            },
            Email: {
                required: "Digite seu  e-mail",
                email: "E-mail incorreto."
            },
            Assunto: {
                required: "Por favor, digite seu assunto"
            },
            Texto: {
                required: "Por favor, digite a sua mensagem"

            }
        },
        submitHandler: function (form) {
            alert()
            console.log(window.location + "/home/EnviarMensagem");
            $(form).ajaxSubmit({
                type: "POST",
                data: $(form).serialize(),
                url: "/home/EnviarMensagem",
                success: function () {
                    $('#contactform').clearForm();
                    $('#cf-success').css("display", "block").css("opacity", "1");
                },
                error: function () {
                    $('#cf-error').css("display", "block").css("opacity", "1");
                }
            });
        }
    });
});