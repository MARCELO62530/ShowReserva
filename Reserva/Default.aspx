<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reserva_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ShowinFlashBack | Um Show in flash Back | SantanaInfor</title>
    <link href="../Content/Home/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="../Content/Home/css/animate.css" rel="stylesheet">
    <link href="../Content/Home/css/responsive.css" rel="stylesheet">
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="css/Index.css" rel="stylesheet" type="text/css" />
    <%--
    <link href="../Content/toastr.min.css" rel="stylesheet" />
     <link href="../Content/bootstrap-table.css" rel="stylesheet" />--%>
    <!--[if lt IE 9]>
        <script src="../Content/Home/js/html5shiv.js"></script>
        <script src="../Scripts/respond.min.js"></script>
    <![endif]-->
    <%-- @*<link rel="shortcut icon" href="Content/Home/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="Content/Home/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="Content/Home/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="Content/Home/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="Content/Home/images/ico/apple-touch-icon-57-precomposed.png">
    *@--%>
</head>
<!--/head-->
<body>
    <form id="fheader" runat="server" method="post">
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
                                <img class="img-responsive" src="../Content/Home/images/logo.png" alt="logo">
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
        <section id="explore">
            <div class="row setup-content step hiddenStepInfo" id="step-3">
                <div class="col-xs-12">
                    <div class="col-md-12 well text-center">
                        <h2>Digite a quantidade desejada de ingressos e escolha sua mesa abaixo</h2>
                        <small>Caso possua uma mesa reservada e queira adicionar mais ingressos a esta mesa <a href="#" data-toggle="modal" data-target="#exampleModal">Clique Aqui</a></small>

                        <br />
                        <br />

                        <div action="#" class=".dvingresso" id="dvIngressos">
                            <table class="table table-striped table-bordered " id="">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">Setor</th>
                                        <th style="text-align: center">Quantidade</th>

                                        <th style="text-align: center">VL.Total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td class="text-center">
                                            <asp:HiddenField ID="data_preco_unitario" Value="40" runat="server"></asp:HiddenField>
                                              <asp:HiddenField ID="SetorId" Value="1" runat="server"></asp:HiddenField>
                                            <div style="text-align: center">
                                                <asp:RadioButton ID="RadioButton1" Class="form-control"
                                                    runat="server" Checked="True" Text="40,00"></asp:RadioButton>
                                            </div>
                                        </td>

                                        <td style="text-align: center">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-4">
                                                <asp:TextBox class="form-control ingresso-quantidade "
                                                    Style="text-align: center; vertical-align: middle; font-weight: 700;"
                                                    required name="Quantidade" ID="Quantidade" Text="0" runat="server"></asp:TextBox>
                                            </div>
                                        </td>

                                        <td style="text-align: center">
                                            <p id="data-preco-total" style="text-align: center"></p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>



                        <iframe src="mapa/default.aspx" class="col-md-12" id="iframeMapa" style="height: 680px; overflow: hidden; width: 100%"></iframe>
                        <span style="-ms-border-radius: 20px; border-radius: 20px; float: right; width: 100%;" class="btn btn-success btn-lg col-sm-12" onclick=" $($('div[data-step=4]')[0]).click(); "><i class="glyphicon glyphicon-ok"></i>Finalizar >></span>
                    </div>
                </div>
            </div>
        </section>
        <!--/#explore-->
        <section id="about">
            <div class="col-md-12 well " id="DetalheDoProduto">


                <h2>Detalhe do pedido</h2>

                <div class="row">


                    <table id="Table1" class="table  table-bordered table-striped table-condensed table-responsive">
                        <thead>
                            <tr>
                                <td style="text-align: center;">Setor</td>
                                <td style="text-align: center;">Quantidade</td>
                                <td style="text-align: center;">Valor total</td>
                                <td style="text-align: center;">Mesa(s)</td>
                            </tr>
                        </thead>
                        <tbody id="Tbody1">
                            <tr>
                                <td style="text-align: center">
                                    <asp:RadioButton ID="RadioButton2" runat="server" Checked="True" Text="Pista" />
                                </td>
                                <td style="text-align: center">0</td>
                                <td style="text-align: center">0</td>
                                <td style="text-align: center"></td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="row" style="background-color: #e6e4e4">
                    <br>
                    <br>
                    <!-- Cadastro-->
                    <div class="form-horizontal col-sm-6" id="RegistroGeral" novalidate="novalidate">
                        <div class="form-group">
                            <label for="Nome" class="col-sm-2 control-label">Nome</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Nome" id="Nome" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Cpf" class="col-sm-2 control-label">Cpf</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Cpf" id="Cpf" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Email" id="Email" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Telefone" class="col-sm-2 control-label">Telefone</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Telefone" id="Telefone" value="" autocomplete="off" maxlength="16">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Celular" class="col-sm-2 control-label">Celular</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Celular" id="Celular" value="" maxlength="16" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <!-- Forma de Pagamento-->
                    <div class=" col-sm-6" id="creditCardForm" novalidate="novalidate">
                        <div class="container">
                            <!--Forma de Pagamento-->
                            <div class="row">

                                <div class="row">
                                    <h3>Forma de pagamento
                                    </h3>
                                    <div class="form-group">

                                        <div class="col-sm-7 col-md-7">
                                            <div class="input-group" id="dvFormaDePagamento">
                                                <div id="radioBtn" class="btn-group">
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="DetalheCartao">Cartão de crédito</a>
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="DetalheDeposito">Depósito bancário</a>
                                                </div>
                                                <input type="hidden" name="happy" value="0" id="happy">
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="row pagamento" id="DetalheCartao" style="display: none;">
                                    <div class="container">


                                        <div class="col-xs-12 col-md-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Detalhe do cartão
                                                    </h3>

                                                </div>
                                                <div class="panel-body">

                                                    <div class="form-group col-xs-8 col-md-8">
                                                        <label for="cardNumber">
                                                            Número do cartão
                                                        </label>
                                                        <div class="input-group">
                                                            <div class="form-group  has-feedback">

                                                                <input type="text" class="form-control" id="CartaoNumero" name="CartaoNumero">
                                                                <span class="glyphicon form-control-feedback"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-xs-4 col-md-4">
                                                        <label for="cardNumber">
                                                            Parcelas
                                                        </label>
                                                        <div class="input-group">
                                                            <select class="form-control" id="CartaoParcela" name="CartaoParcela">
                                                                <option value="01">01</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-6 col-md-6">
                                                            <div class="form-group">
                                                                <label for="expityMonth">
                                                                    Data da válidade
                                                                </label>
                                                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                                                    <input type="text" class="form-control" name="CartaoMes" id="CartaoMes" placeholder="MM">
                                                                </div>
                                                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                                                    <input type="text" class="form-control" id="CartaoAno" name="CartaoAno" placeholder="AA">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-5 col-md-5 pull-right">
                                                            <div class="form-group">
                                                                <label for="cvCode">
                                                                    Código CVC
                                                                </label>
                                                                <input type="password" class="form-control" id="CartaoCvc" name="CartaoCvc" placeholder="CVC">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <br>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div id="DetalheDeposito" class="row pagamento" style="display: none;">
                                <img src="../Content/Images/deposito.jpg" style="width: 508px; height: 270px; padding-bottom: 10px">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <a href="#" onclick="EnviarServer()" class="btn btn-success btn-lg btn-block" role="button">FINALIZAR PEDIDO</a>
                </div>
                <style>
                    #radioBtn .notActive {
                        color: #3276b1;
                        background-color: #fff;
                    }

                    .panel-title {
                        display: inline;
                        font-weight: bold;
                    }

                    .checkbox.pull-right {
                        margin: 0;
                    }

                    .pl-ziro {
                        padding-left: 0;
                    }
                </style>
            </div>
        </section>
        <footer id="footer">
        </footer>
        <!--/#footer-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
                    </div>
                    <div class="modal-body">
                        <div id="buscareserva">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">
                                    Recipient:</label>
                                <input type="text" class="form-control" id="recipient-name"/>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">
                                    Message:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close</button>
                        <button type="button" class="btn btn-primary">
                            Send message</button>
                    </div>
                </div>
            </div>
        </div>
                <script>
                    String.prototype.toFloat = function () {
                        return this.isNaN ? 0 : parseFloat(this);
                    }


        </script>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>  
   
       
    <script src="../Scripts/jquery.validate.unobtrusive.min.js"></script> 
                <script type="text/javascript" src="../Scripts/jquery.validate.pt-BR.js"></script>
        <script type="text/javascript" src="../Content/Home/js/bootstrap.min.js"> </script>
        <link href="../Content/toastr.css" rel="stylesheet" />
        <script type="text/javascript" src="../Scripts/toastr.min.js"></script>
        <script src="../Scripts/Func.js"></script>
     

        <%--<script type="text/javascript" src="../Scripts/Cadastro/Index.js"></script>
        <script type="text/javascript" src="../Scripts/Mapa/Index.js"></script>
        <script src="../Scripts/Cadastro/Ingresso.js"></script>--%>
        <script>
         



            $(".pagamento").hide();
            $("#radioBtn a").on("click", function () {

                var sel = $(this).data("title");
                var tog = $(this).data("toggle");
                $("#" + tog).prop("value", sel);
                $(".pagamento").slideUp(200, function () {
                    $("#" + sel).slideDown(200);
                });

                $("a[data-toggle=\"" + tog + "\"]").not("[data-title=\"" + sel + "\"]").removeClass("active").addClass("notActive");
                $("a[data-toggle=\"" + tog + "\"][data-title=\"" + sel + "\"]").removeClass("notActive").addClass("active");
            });
        </script>
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
    </form>
</body>
</html>
