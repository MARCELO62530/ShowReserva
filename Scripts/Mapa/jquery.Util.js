(function ($) {
    $.OpenPopUp = function (seletor, pagina, titulo, altura, largura, anime) {
        var ent, sai = 0;
        if (anime == true) {
            ent = 800;
            sai = 800;
        }
        seletor.dialog({
            title: titulo,
            modal: true,
            async: true,
            height: altura,
            width: largura,
            show: { effect: 'blind', duration: ent },
            hide: { effect: 'blind', duration: sai },
            open: function (e) {
                $(this).load(pagina);
            },
            close: function (event, ui) {
                seletor.html("");
                seletor.innerHTML = "";
                seletor.dialog('destroy');
            }
        });
    } //OpenpopUp




    $.Consultar = function (PaginaMetodo, parametro, msgUsuario, async) {
        async = async == undefined ? false : async;
        if (msgUsuario != undefined) {
            bloqueia(msgUsuario);
            //            return setTimeout(function () {
            //                Enviar(PaginaMetodo, parametro, msgUsuario,async)
            //            }, 100);
        }


        var s = Enviar(PaginaMetodo, parametro);
        return s;
    }

    $.EnvioAsync = function (PaginaMetodo, parametro, msgret, caminhoimg) {
    
            $.ajax({
            type: "POST",
            url: PaginaMetodo,
            data: '{' + parametro + '}',
            global: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                jAguarde('Aguarde', caminhoimg);
            },
            complete: function (msg) {
                if (msg.statusText == 'success' || msg.statusText == 'OK') {
                    jAlert(msgret);

                }

            },
            async: false,
            cache: false,
            success: function (msg) {
                saida = msg.d;
            },
            error: function (
                                               XMLHttpRequest,
                                               textStatus,
                                               errorThrown) {
                jAlert(XMLHttpRequest.responseText + '\n' + textStatus);
            }

        }); //ajax


    }

    $.EnvioDados = function (PaginaMetodo, parametro, msg, msgUsuario) {
        if (msg == undefined) {
            msg = "Aguarde";
        }
        bloqueia(msg);
        setTimeout(function () { Enviar(PaginaMetodo, parametro, msgUsuario, true) }, 500);
    }


    $.ValidaForm = function (form, time) {
        if (time == null || time == undefined) {
            time = 5000;
        }
        if (!form.validationEngine('validate', { scroll: false })) {
            setTimeout(function () { form.validationEngine('hide') }, time);
            return false
        }
        return true;
    }
    $.retiraId = function (objeto) {
        var productIDValSplitter = (objeto[0].id).split("_");
        return productIDValSplitter[1] == undefined ? "" : productIDValSplitter[1];
    }

    $.removestring = function (Text) {
        return (/[0-9]+/).exec(Text);

    }

    //MONTA A PAGINA CENTRAL COM A PAGINAÇÃO
    $.PaginacaoCentral = function (lst, titulo) {

        $.checkfile("css/Resultados.css", "css");
        $.checkfile("css/Paginacao.css", "css");
        boxdestalhes.empty();
        boxlista.empty();
        boxofertas.empty();
        boxpaginacao.show();
        boxtitulo.empty();
        boxtitulo.append(titulo);
        var view = $('#ddlTipoVis').val();
        if (view == undefined) {
            view = "Detalhes";
        }
        switch (view) {
            case 'Detalhes':
                tp = 'tpResultado.htm';
                $(boxdestalhes).html($.Obterhtml(tp)).fillTemplate(lst);
                $(boxdestalhes).append(boxpaginacao.clone());
                $('#BoxResultado #Ordenacao').hide();

                break;
            case 'Listas':
                var tabela, linhas;
                $.checkfile("css/ListaBusca.css", "css");
                tp = 'tptabela.htm';
                $('#boxLista').html($.Obterhtml(tp));
                var linha = "";

                for (var i = 0; i < lst.length; i++) {
                    linha += "<tr      id=tr_" + lst[i].IdImovel + " class=\"trln inicioloop\">"
                    linha += "<td><a style=\"width=20px !important;height=20px !important\" ><img id=\"imfoto_" + lst[i].IdImovel + "\" src=\" " + lst[i].CaminhoFotoPrincipal + " \" style=\"width=20px !important;height=20px !important\" class=\"ResultadoFoto  ui-corner-all favfoto\"   onclick = \"javascript:AbreDetalhes(" + lst[i].IdImovel + ");\"            alt=\"Foto Principal\" /></a></td>";
                    linha += "<td style=\"width=100px !important\" ><a >" + lst[i].Descricao + "</a></td>";
                    linha += "<td><a class\"favcidade\" >" + lst[i].Cidade + "</a></td>";
                    linha += "<td><a>" + lst[i].Bairro + "</a></td>"
                    linha += "<td><a class=\"favtipo\" >" + lst[i].StrTipoImovel + "</a></td>"
                    linha += "<td><a >" + lst[i].Referencia + "</a></td>"
                    linha += "<td><a >" + lst[i].Dormitorios + "</a></td>"
                    linha += "<td><a class=\"favvalor\" >" + lst[i].Valor + "</a></td>"
                    linha += "<td><span id=spl_" + lst[i].IdImovel + "   class=\" favoritos aamt3 aaml5 colSpan \" title=\"Adicione a Favoritos\"></span>"
                    linha += "<span     onclick = \"javascript:AbreDetalhes(" + lst[i].IdImovel + ");\"            class=\"colSpan maisdetalhes aamt3 aaml5 \" title=\"Mais Detalhes\"></span></td></tr>"
                }
                $('#boxLista tbody ').append(linha);
                $('#boxLista').append(boxpaginacao.clone())
                $('#boxLista #Ordenacao').hide();
                break;
            case 'Galerias':
                tp = 'tpOfertas.htm';
                $(boxofertas).html($.Obterhtml(tp)).fillTemplate(lst);
                $(boxofertas).append(boxpaginacao.clone())
                $('#BoxOfertas #dvPaginacao').css("clear", "both");
                $('#BoxOfertas #Ordenacao').hide();
                break;
        } // FIM DO CASE

    } //fim da pafinação central

    //===================abre chat===============
    //abre chat
    $.AbreChat = function (e) {
        var lst = $.Consultar('Default.aspx/VerificaChatOn', '');
        var id = 0; //$.retiraId($(this));
        var CC_URL = "";
        if (lst) {
            CC_URL = 'WebChat/ChatCadastra.aspx?imovel=' + id.toString();
        }
        else {


            CC_URL = 'WebChat/ChatFormularioMsn.aspx?imovel=' + id.toString();
        }
        if (e) {
            e.returnValue = false;
            e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
            if (e.preventDefault) e.preventDefault();
        }
        var w = window.open(CC_URL, "_chatcomercial", "left=400,top=300,width=600,height=510,resizable=yes,status=no,scrollbars=no");
        try { win.focus() } catch (e) { }
    }

    //=============PRIVADOS==============================================

    bloqueia = function (msg) {
        $.unblockUI();
        $.blockUI({ message: "  <a style=\"font-size:20px;\">" + msg + "<a>", css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#f89725',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            'border-radius': '10px',
            opacity: .9,
            color: '#fff'
        }
        });
    }
    mensagem = function (msg) {
        $.unblockUI();
        $.blockUI({ message: "  <a style=\"font-size:20px;\">" + msg + "<a>", css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#fff',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            'border-radius': '10px',
            opacity: .9,
            color: '#000'
        }
        });
    }

    Enviar = function (PaginaMetodo, parametro, msgUsuario, async) {
        async = async == undefined ? false : async;
        var saida;
        $.ajax({
            type: "POST",
            url: PaginaMetodo,
            data: '{' + parametro + '}',
            global: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            complete: function (msg) {
                if (msg.statusText == 'success' || msg.statusText == 'OK') {
                    msgUsuario == undefined ? "" : mensagem(msgUsuario);
                }
                document.body.style.cursor = 'default';
                setTimeout($.unblockUI, 100);
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


    $.Obterhtml = function (pagina) {
        var val = null;
        $.ajax({
            'async': false,
            'global': false,
            'url': pageUrl + 'tp/' + pagina,
            'success': function (data) {
                val = data;
            }
        });
        return val;
    } //Obter Html

    $.facebook = function (seletor, pagina, imagem) {
        var saida;
        imagem = imagem == undefined ? "obj/social/face.png" : imagem;
        saida = "<a class=\"aaml3 aamr3\" href=\"javascript: void(0);\" onclick=\"javascript:window.open('http://www.facebook.com/sharer.php?u=" + pagina + "','CompFace', 'toolbar=0, status=0, width=650, height=450');\"><img src=\"" + imagem + "\" border=0 width=30 height=20 title=\"Compartilhe no Facebook\" /></a>";
        seletor.append(saida);
    }
    $.twiter = function (seletor, pagina, hastag) {
        var saida;

        saida = "<a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-url=\"" + pagina + "\" data-text=\"Confira este site \" data-lang=\"pt\" data-count=\"none\" data-hashtags=\"" + hastag + "\">Tweet</a>";
        saida += "<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"//platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>";
        seletor.append(saida);
    }
    $.plusone = function (seletor) {
        checkfile("https://apis.google.com/js/plusone.js", "js");
        seletor.append(' <g:plusone size=\"medium\" annotation=\"none\"></g:plusone>');

    }


    function loadjscssfile(filename, filetype) {
        if (filetype == "js") { //if filename is a external JavaScript file
            var fileref = document.createElement('script')
            fileref.setAttribute("type", "text/javascript")
            fileref.setAttribute("src", filename)
        }
        else if (filetype == "css") { //if filename is an external CSS file
            var fileref = document.createElement("link")
            fileref.setAttribute("rel", "stylesheet")
            fileref.setAttribute("type", "text/css")
            fileref.setAttribute("href", filename)
        }
        if (typeof fileref != "undefined")
            document.getElementsByTagName("head")[0].appendChild(fileref)
    }

    var filesadded = "";
    $.checkfile = function (filename, filetype) {
        if (filesadded.indexOf("[" + filename + "]") == -1) {
            loadjscssfile(filename, filetype)
            filesadded += "[" + filename + "]" //List of files added in the form "[filename1],[filename2],etc"
        }
    }

    $.RemoveAlfanum = function (str) {
        return str.replace(/[^0-9]+/g, '');
    }

    //========================VERIFICA QUERY STRING==============================================================
    $.QueryString = function (variavel) {
        var variaveis = location.search.replace(/\x3F/, "").replace(/\x2B/g, " ").split("&")
        var nvar
        if (variaveis != "") {
            var qs = []
            for (var i = 0; i < variaveis.length; i++) {
                nvar = variaveis[i].split("=")
                qs[nvar[0]] = unescape(nvar[1])
            }
            return qs[variavel]
        }
        return null
    }



})(jQuery);


