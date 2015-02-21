<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ShowinFlashBack | Um Show in flash Back | SantanaInfor</title>
    <link href="Content/Home/css/bootstrap.min.css" rel="stylesheet">
    <link href="Content/Home/css/font-awesome.min.css" rel="stylesheet">
    <link href="Content/Home/css/main.css" rel="stylesheet">
    <link href="Content/Home/css/animate.css" rel="stylesheet">
    <link href="Content/Home/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
        <script src="Content/Home/js/html5shiv.js"></script>
        <script src="Scripts/respond.min.js"></script>
    <![endif]-->
    @*<link rel="shortcut icon" href="Content/Home/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="Content/Home/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="Content/Home/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="Content/Home/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="Content/Home/images/ico/apple-touch-icon-57-precomposed.png">*@
    <style type="text/css">
        .style1 {
            font-size: x-large;
        }

        .style2 {
            font-size: large;
        }
    </style>
</head>
<!--/head-->
<body>
    <header id="header" role="banner">
        <div class="main-nav">
            <div class="container">
                <div class="header-top">
                    <div class="pull-right social-icons">
                        <!--<a href="#"><i class="fa fa-twitter"></i></a>-->
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <!--	<a href="#"><i class="fa fa-google-plus"></i></a>-->
                        <a href="#"><i class="fa fa-youtube"></i></a>
                    </div>
                </div>
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Navegue...</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">
                            <img class="img-responsive" src="Content/Home/images/logo.png" alt="logo">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="scroll active"><a href="#home">Pricipal</a></li>
                            <li class="scroll"><a href="#explore">Explore</a></li>
                            <li class="scroll"><a href="#event">Eventos</a></li>
                            <li class="scroll"><a href="#about">Sobre</a></li>
                            <!-- <li class="no-scroll"><a href="#twitter">Twitter</a></li>-->
                            <li><a class="no-scroll" href="/RESERVA" target="_blank">Compre seu Ingresso</a></li>
                            <li class="scroll"><a href="#contact">Contato</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--/#header-->
    <section id="home">
        <div id="main-slider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img class="img-responsive" src="Content/Home/images/slider/bg1.jpg" alt="slider">
                    <div class="carousel-caption">
                        <h2><span class="style1">Compre seu ingresso para o proximo evento</span> </h2>
                        <h4>11 de abril as 21:00</h4>
                        <a href="Reserva/Default.aspx" target="_blank">Garanta seu ingresso aqui... <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
                <div class="item">
                    <img class="img-responsive" src="Content/Home/images/slider/bg2.jpg" alt="slider">
                    <div class="carousel-caption">
                        <h2>Um show de Som/Video/Luz </h2>
                        <h4>E muitos Efeitos especiais</h4>
                        <a href="Reserva/Default.aspx" target="_blank">Garanta seu ingresso aqui...<i class="fa fa-angle-right"></i></a>
                        
                    </div>
                </div>
                <div class="item">
                    <img class="img-responsive" src="Content/Home/images/slider/bg3.jpg" alt="slider">
                    <div class="carousel-caption">
                        <h2>Muitas surpresas</h2>
                        <h4>Voc&ecirc; ter&aacute; uma verdadeira viagem ao passado</h4>
                        <a href="Reserva/Default.aspx" target="_blank">Garanta seu ingresso aqui...<i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#home-->
    <section id="explore">
        <div class="container">
            <div class="row">
                <div class="watch">
                    <img class="img-responsive" src="Content/Home/images/watch.png" alt="">
                </div>
                <div class="col-md-4 col-md-offset-2 col-sm-5">
                    <h2>Nosso Proximo Evento</h2>
                </div>
                <div class="col-sm-7 col-md-6">
                    <ul id="countdown">
                        <li>
                            <span class="days time-font">00</span>
                            <p>dias </p>
                        </li>
                        <li>
                            <span class="hours time-font">00</span>
                            <p class="">horas </p>
                        </li>
                        <li>
                            <span class="minutes time-font">00</span>
                            <p class="">minutos</p>
                        </li>
                        <li>
                            <span class="seconds time-font">00</span>
                            <p class="">segundos</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="cart">
                <a href="/RESERVA" target="_blank" class="style2"><i class="fa fa-shopping-cart"></i> <span>Compre seu ingresso</span></a>
            </div>
        </div>
    </section>
    <!--/#explore-->
    <section id="event">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-9">
                    <div id="event-carousel" class="carousel slide" data-interval="false">
                        <h2 class="heading">ATRA&Ccedil;&Otilde;ES</h2>
                        <a class="even-control-left" href="#event-carousel" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                        <a class="even-control-right" href="#event-carousel" data-slide="next"><i class="fa fa-angle-right"></i></a>
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="single-event">
                                            <img class="img-responsive" src="Content/Home/images/event/event1.jpg" alt="event-image">
                                            <h4>MARCELO SANTANA</h4>
                                            <h5>DJ/VJ</h5>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="single-event">
                                            <img class="img-responsive" src="Content/Home/images/event/event2.jpg" alt="event-image">
                                            <h4>MARCELO BATMAN</h4>
                                            <h5>DJ</h5>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="single-event">
                                            <img class="img-responsive" src="Content/Home/images/event/event3.jpg" alt="event-image">
                                            <h4>VARIAS ATRA&Ccedil;&Otilde;ES</h4>
                                            <h5>GRANDES SURPRESAS</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--	<div class="item">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event1.jpg" alt="event-image">
                                                <h4>Chester Bennington</h4>
                                                <h5>Vocal</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event2.jpg" alt="event-image">
                                                <h4>Mike Shinoda</h4>
                                                <h5>vocals, rhythm guitar</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event3.jpg" alt="event-image">
                                                <h4>Rob Bourdon</h4>
                                                <h5>drums</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                        </div>
                    </div>
                </div>
                <div class="guitar">
                    <img class="img-responsive" src="Content/Home/images/guitar.png" alt="guitar">
                </div>
            </div>
        </div>
    </section>
    <!--/#event-->
    <section id="about">
        <!--	<div class="guitar2">
                <img class="img-responsive" src="images/guitar2.jpg" alt="guitar">
            </div>-->
        <div class="row">

            <div class="col-md-6">

                <img class="img-responsive img-Flyer" style="vertical-align:middle" src="Content/Home/images/about-img.jpg" />
            </div>
            <div class="about-content col-md-6">
                <h2>Sobre o Evento</h2>
                <p>
                    <div style="text-align: center;">
                        <div>
                            Ser&aacute; uma Grande festa Cheia de surpresas e com uma Grande infraestrutura que s&oacute; a Show in Flash Back pode proporcionar!!!
                        </div>
                        <div>
                            Eu Marcelo Santana e DjMarcelobatman Ferreira estaremos no comando com muito flash back de qualidade
                        </div>
                        <div>
                            Estacionamento e Mesa j&aacute; Inclusos:
                        </div>
                        <div>
                            Venha se divertir e dan&ccedil;ar pra valer!!!
                        </div>
                        <div>
                            Distribui&ccedil;&atilde;o de 1000 DVDs (N&atilde;o &eacute; sorteio)
                        </div>
                    </div>
                </p>
                <a href="/RESERVA" target="_blank" class="btn btn-primary">Compre seu Ingresso <i class="fa fa-angle-right"></i></a>

            </div>
        </div>
    </section>
    <!--/#about-->
    <!--	<section id="twitter">
        <div id="twitter-feed" class="carousel slide" data-interval="false">
            <div class="twit">
                <img class="img-responsive" src="images/twit.png" alt="twit">
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="text-center carousel-inner center-block">
                        <div class="item active">
                            <img src="images/twitter/twitter1.png" alt="">
                            <p>In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit </p>
                            <a href="#">http://t.co/yY7s1IfrAb 2 days ago</a>
                        </div>
                        <div class="item">
                            <img src="images/twitter/twitter2.png" alt="">
                            <p>In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit </p>
                            <a href="#">http://t.co/yY7s1IfrAb 2 days ago</a>
                        </div>
                        <div class="item">
                            <img src="images/twitter/twitter3.png" alt="">
                            <p>In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit </p>
                            <a href="#">http://t.co/yY7s1IfrAb 2 days ago</a>
                        </div>
                    </div>
                    <a class="twitter-control-left" href="#twitter-feed" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                    <a class="twitter-control-right" href="#twitter-feed" data-slide="next"><i class="fa fa-angle-right"></i></a>
                </div>
            </div>
        </div>
    </section><!--/#twi-->
    <!--tter-feed-->
    -->
    <section id="sponsor">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-9">
                    <div id="Div1" class="carousel slide" data-interval="false">
                        <h2 class="heading">Ultimos Videos</h2>
                        <a class="even-control-left" href="#event-carousel" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                        <a class="even-control-right" href="#event-carousel" data-slide="next"><i class="fa fa-angle-right"></i></a>
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="single-event">


                                            <!--<img class="img-responsive" src="images/event/event1.jpg" alt="event-image">-->
                                            <iframe class="img-responsive" allowfullscreen="" src="https://www.youtube.com/embed/jmclhKy8eB0" frameborder="0"></iframe>

                                            <h4>Show com Atra&ccedil;&atilde;o Internacional &quot;CORONA&quot;</h4>
                                            <h5></h5>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="single-event">
                                            <iframe class="img-responsive" allowfullscreen="" src="https://www.youtube.com/embed/RRmCb2sg92M" frameborder="0"></iframe>

                                            <h4>EVENTO NA ASS. DOS FUNCIONARIOS PUBLICOS DE S.B.C.</h4>
                                            <h5></h5>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="single-event">
                                            <iframe class="img-responsive" allowfullscreen="" src="https://www.youtube.com/embed/ffu0Q42DK9o" frameborder="0"></iframe>

                                            <h4>RESTAURANTE FLORESTAL</h4>
                                            <h5></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--	<div class="item">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event1.jpg" alt="event-image">
                                                <h4>Chester Bennington</h4>
                                                <h5>Vocal</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event2.jpg" alt="event-image">
                                                <h4>Mike Shinoda</h4>
                                                <h5>vocals, rhythm guitar</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="single-event">
                                                <img class="img-responsive" src="images/event/event3.jpg" alt="event-image">
                                                <h4>Rob Bourdon</h4>
                                                <h5>drums</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                        </div>
                    </div>
                </div>
                <div class="guitar">
                    <img class="img-responsive" src="Content/Home/images/MOVIE.png" alt="guitar">
                </div>
            </div>
        </div>
    </section>
    <!--/#sponsor-->
    <section id="contact">
        <div id="map">
            <div id="gmap-wrap">
                <div id="gmap">
                </div>
            </div>
        </div><!--/#map-->
        <div class="contact-section">
            <div class="ear-piece">
                <img class="img-responsive" src="Content/Home/images/ear-piece.png" alt="">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-4">
                        <div class="contact-text">
                            <h3>Contato</h3>
                            <address>
                                E-mail: djmarcelo@marcelosantana.net<br>
                                Fone: 11 2885-4240<br>
                                WhatsApp: 11 94832-7016
                            </address>
                        </div>
                        <!--<div class="contact-address">
                            <h3>Contact</h3>
                            <address>
                                Unit C2, St.Vincent's Trading Est.,<br>
                                Feeder Road,<br>
                                Bristol, BS2 0UY<br>
                                United Kingdom
                            </address>
                        </div>-->
                    </div>
                    <div class="col-sm-5">
                        <div id="contact-section">
                            <h3>Envie uma Mensagem</h3>
                            <div class="status alert alert-success" style="display: none"></div>
                            <form id="contactform" class="contact-form" name="contact-form" method="post" action="">
                                <div class="form-group">
                                    <input type="text" name="Remetente" id="Remetente" class="form-control" required="required" placeholder="Nome">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="Email" id="Email" class="form-control" required="required" placeholder="Email">
                                    <input type="hidden" name="Assunto" id="subject" placeholder="Assunto" value="Nova mensagem- Show In Flashback">

                                </div>

                                <div class="form-group">
                                    <textarea name="Texto" id="Texto" required="required" class="form-control" rows="4" placeholder="Entre com sua mensagem"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary pull-right">Envio</button>
                                </div>
                            </form>
                            <h4 id="cf-success">
                                <i class="fa fa-check"></i> Sua mensagem foi enviada com sucesso!
                            </h4>

                            <h4 id="cf-error">
                                <i class="fa fa-times"></i> Algo deu errado, tente recarregar e enviar o formulário novamente.
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#contact-->
    <footer id="footer">
        <div class="container">
            <div class="text-center">
                <p> Copyright  &copy;@DateTime.Now.Year<a target="_blank" href="http://santanainfor.com.br/"> Evento </a>. All Rights Reserved. <br> Designed by <a target="_blank" href="http://SantanaInfor.com.br/">Santanainfor</a></p>
            </div>
        </div>
    </footer>
    <!--/#footer-->
  
    <script src="Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <script src="Scripts/jquery.form.min.js"></script>
    <script type="text/javascript" src="Content/Home/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="Content/Home/js/gmaps.js"></script>
    <script type="text/javascript" src="Content/Home/js/smoothscroll.js"></script>
    <script type="text/javascript" src="Content/Home/js/jquery.parallax.js"></script>
    <script type="text/javascript" src="Content/Home/js/coundown-timer.js"></script>
    <script type="text/javascript" src="Content/Home/js/jquery.scrollTo.js"></script>
    <script type="text/javascript" src="Content/Home/js/jquery.nav.js"></script>
<script type="text/javascript" src="Content/Home/js/main.js"></script>
<style>
    #cf-success, #cf-error {
    display: none;
    opacity: 0;
    margin-left: 10%;
    -webkit-transition: all .3s ease;
    -o-transition: all .3s ease;
    transition: all .3s ease;
}
</style>
</body>
</html>