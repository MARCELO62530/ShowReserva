<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reserva_Mapa_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-BR">
<head>
    <title></title>
    <meta name="language" content="pt-br" />
    <meta charset="utf-8" />

    <meta http-equiv="imagetoolbar" content="false" />
    <meta name="mssmarttagspreventparsing" content="true" />
    <link rel="stylesheet" type="text/css" media="all" href="../../Content/Mapa/css/jquery_air.css" />

    <link href="../../Content/Mapa/css/confirm.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Mapa/css/demo.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../Content/Mapa/css/preset.css" type="text/css" media="screen, projection" />
    <!--[if IE]>
        <link rel="stylesheet" type="text/css" media="all" href='css/ie_fixes.css'/>
    <![endif]-->
    
    <script type="text/javascript" src="../../Scripts/Mapa/preset.js"></script>
    <script type="text/javascript" src="../../Scripts/Mapa/jquery.js"></script>
    <link href="../../Content/toastr.min.css" rel="stylesheet" />
    <script src="../../Scripts/toastr.min.js"></script>
   <%-- <script type="text/javascript" src="../../Scripts/Mapa/global.js"></script>--%>
    <script type='text/javascript' src='../../Scripts/Mapa/jquery.js'></script>
    <script type='text/javascript' src='../../Scripts/Mapa/jquery.simplemodal.js'></script>
    <script type='text/javascript' src='../../Scripts/Mapa/confirm.js'></script>
    <script src="../../Scripts/Cadastro/Ingresso.js" type="text/javascript"></script>
   
  

</head>
<body>
<form id="form1">
    <div id="container">
        <div style="position: absolute; z-index: 2; top: 98px; left: 423px; border: 1px solid #c3c3c3; width: 246px; height: 237px;">
            <h2 style="text-align: center">Reserva</h2>
            <div id="lblMesa" style="text-align: center"></div>
        </div>

        <ul id="airplane">
            <li class="T1 L1"><a href="#row_01" title="01">01</a></li>
            <li class="T1 L2"><a href="#row_01" title="02">02</a></li>
            <li class="T1 L3"><a href="#row_01" title="03">03</a></li>
            <li class="T1 L4"><a href="#row_01" title="04">04</a></li>
            <li class="T1 L5"><a href="#row_01" title="05">Socio 05</a></li>
            <li class="T1 L6"><a href="#row_01" title="06">Socio 06</a></li>
            <li class="T2 L1"><a href="#row_01" title="07">07</a></li>
            <li class="T2 L2"><a href="#row_01" title="08">08</a></li>
            <li class="T2 L3"><a href="#row_01" title="09">09</a></li>
            <li class="T2 L4"><a href="#row_01" title="10">10</a></li>
            <li class="T2 L5"><a href="#row_01" title="11">Socio 11</a></li>
            <li class="T2 L6"><a href="#row_01" title="12">Socio 12</a></li>
            <li class="T3 L1"><a href="#row_01" title="13">13</a></li>
            <li class="T3 L2"><a href="#row_01" title="14">14</a></li>
            <li class="T3 L3"><a href="#row_01" title="15">15</a></li>
            <li class="T3 L4"><a href="#row_01" title="16">16</a></li>
            <li class="T3 L5"><a href="#row_01" title="17">Socio 17</a></li>
            <li class="T3 L6"><a href="#row_01" title="18">Socio 18</a></li>
            <li class="T4 L1"><a href="#row_01" title="19">19</a></li>
            <li class="T4 L2"><a href="#row_01" title="20">20</a></li>
            <li class="T4 L3"><a href="#row_01" title="21">21</a></li>
            <li class="T4 L4"><a href="#row_01" title="22">22</a></li>
            <li class="T4 L5"><a href="#row_01" title="23">Socio 23</a></li>
            <li class="T4 L6"><a href="#row_01" title="24">Socio 24</a></li>
            <li class="T5 L1"><a href="#row_01" title="25">25</a></li>
            <li class="T5 L2"><a href="#row_01" title="26">26</a></li>
            <li class="T5 L3"><a href="#row_01" title="27">27</a></li>
            <li class="T5 L4"><a href="#row_01" title="28">28</a></li>
            <li class="T5 L5"><a href="#row_01" title="29">Socio 29</a></li>
            <li class="T5 L6"><a href="#row_01" title="30">Socio 30</a></li>
            <li class="T6 L1"><a href="#row_01" title="31">31</a></li>
            <li class="T6 L2"><a href="#row_01" title="32">32</a></li>
            <li class="T6 L3"><a href="#row_01" title="33">33</a></li>
            <li class="T6 L4"><a href="#row_01" title="34">34</a></li>
            <li class="T6 L5"><a href="#row_01" title="35">Socio 35</a></li>
            <li class="T6 L6"><a href="#row_01" title="36">Socio 36</a></li>
            <li class="T7 L1"><a href="#row_01" title="37">37</a></li>
            <li class="T7 L2"><a href="#row_01" title="38">38</a></li>
            <li class="T7 L3"><a href="#row_01" title="39">39</a></li>
            <li class="T7 L4"><a href="#row_01" title="40">40</a></li>
            <li class="T7 L5"><a href="#row_01" title="41">41</a></li>
            <li class="T7 L6"><a href="#row_01" title="42">42</a></li>
            <li class="T8 L1"><a href="#row_01" title="43">43</a></li>
            <li class="T8 L2"><a href="#row_01" title="44">44</a></li>
            <li class="T8 L3"><a href="#row_01" title="45">45</a></li>
            <li class="T8 L4"><a href="#row_01" title="46">46</a></li>
            <li class="T8 L5"><a href="#row_01" title="47">47</a></li>
            <li class="T8 L6"><a href="#row_01" title="48">48</a></li>
            <li class="T5 L7"><a href="#row_01" title="49">Socio</a></li>
            <li class="T5 L8"><a href="#row_01" title="50">Socio 50</a></li>
            <li class="T5 L9"><a href="#row_01" title="51">Socio 51</a></li>
            <li class="T5 L10"><a href="#row_01" title="52">Socio 52</a></li>
            <li class="T5 L11"><a href="#row_01" title="53">Socio 53</a></li>
            <li class="T5 L12"><a href="#row_01" title="54">Socio 54</a></li>
            <li class="T6 L7"><a href="#row_01" title="55">Socio 55</a></li>
            <li class="T6 L8"><a href="#row_01" title="56">Socio 56</a></li>
            <li class="T6 L9"><a href="#row_01" title="57">Socio 57</a></li>
            <li class="T6 L10"><a href="#row_01" title="58">Socio 58</a></li>
            <li class="T6 L11"><a href="#row_01" title="59">Socio 59</a></li>
            <li class="T6 L12"><a href="#row_01" title="60">Socio 60</a></li>
            <li class="T7 L7"><a href="#row_01" title="61">61</a></li>
            <li class="T7 L8"><a href="#row_01" title="62">62</a></li>
            <li class="T7 L9"><a href="#row_01" title="63">63</a></li>
            <li class="T7 L10"><a href="#row_01" title="64">64</a></li>
            <li class="T7 L11"><a href="#row_01" title="65">65</a></li>
            <li class="T7 L12"><a href="#row_01" title="66">66</a></li>
            <li class="T8 L7"><a href="#row_01" title="67">67</a></li>
            <li class="T8 L8"><a href="#row_01" title="68">68</a></li>
            <li class="T8 L9"><a href="#row_01" title="69">69</a></li>
            <li class="T8 L10"><a href="#row_01" title="70">70</a></li>
            <li class="T8 L11"><a href="#row_01" title="71">71</a></li>
            <li class="T8 L12"><a href="#row_01" title="72">72</a></li>
            <li class="T1 L13"><a href="#row_01" title="73">Socio 73</a></li>
            <li class="T1 L14"><a href="#row_01" title="74">Socio 74</a></li>
            <li class="T1 L15"><a href="#row_01" title="75">75</a></li>
            <li class="T1 L16"><a href="#row_01" title="76">76</a></li>
            <li class="T1 L17"><a href="#row_01" title="77">77</a></li>
            <li class="T1 L18"><a href="#row_01" title="78">78</a></li>
            <li class="T2 L13"><a href="#row_01" title="79">Socio 79</a></li>
            <li class="T2 L14"><a href="#row_01" title="80">Socio 80</a></li>
            <li class="T2 L15"><a href="#row_01" title="81">81</a></li>
            <li class="T2 L16"><a href="#row_01" title="82">82</a></li>
            <li class="T2 L17"><a href="#row_01" title="83">83</a></li>
            <li class="T2 L18"><a href="#row_01" title="84">84</a></li>
            <li class="T3 L13"><a href="#row_01" title="85">Socio 85</a></li>
            <li class="T3 L14"><a href="#row_01" title="86">Socio 86</a></li>
            <li class="T3 L15"><a href="#row_01" title="87">87</a></li>
            <li class="T3 L16"><a href="#row_01" title="88">88</a></li>
            <li class="T3 L17"><a href="#row_01" title="89">89</a></li>
            <li class="T3 L18"><a href="#row_01" title="90">90</a></li>
            <li class="T4 L13"><a href="#row_01" title="91">Socio 91</a></li>
            <li class="T4 L14"><a href="#row_01" title="92">Socio 92</a></li>
            <li class="T4 L15"><a href="#row_01" title="93">93</a></li>
            <li class="T4 L16"><a href="#row_01" title="94">94</a></li>
            <li class="T4 L17"><a href="#row_01" title="95">95</a></li>
            <li class="T4 L18"><a href="#row_01" title="96">96</a></li>
            <li class="T5 L13"><a href="#row_01" title="97">Socio 97</a></li>
            <li class="T5 L14"><a href="#row_01" title="98">Socio 98</a></li>
            <li class="T5 L15"><a href="#row_01" title="99">99</a></li>
            <li class="T5 L16"><a href="#row_01" title="100">100</a></li>
            <li class="T5 L17"><a href="#row_01" title="101">101</a></li>
            <li class="T5 L18"><a href="#row_01" title="102">102</a></li>
            <li class="T6 L13"><a href="#row_01" title="103">Socio 103</a></li>
            <li class="T6 L14"><a href="#row_01" title="104">Socio 104</a></li>
            <li class="T6 L15"><a href="#row_01" title="105">105</a></li>
            <li class="T6 L16"><a href="#row_01" title="106">106</a></li>
            <li class="T6 L17"><a href="#row_01" title="107">107</a></li>
            <li class="T6 L18"><a href="#row_01" title="108">108</a></li>
            <li class="T7 L13"><a href="#row_01" title="109">109</a></li>
            <li class="T7 L14"><a href="#row_01" title="110">110</a></li>
            <li class="T7 L15"><a href="#row_01" title="111">111</a></li>
            <li class="T7 L16"><a href="#row_01" title="112">112</a></li>
            <li class="T7 L17"><a href="#row_01" title="113">113</a></li>
            <li class="T7 L18"><a href="#row_01" title="114">114</a></li>
            <li class="T8 L13"><a href="#row_01" title="115">115</a></li>
            <li class="T8 L14"><a href="#row_01" title="116">116</a></li>
            <li class="T8 L15"><a href="#row_01" title="117">117</a></li>
            <li class="T8 L16"><a href="#row_01" title="118">118</a></li>
            <li class="T8 L17"><a href="#row_01" title="119">119</a></li>
            <li class="T8 L18"><a href="#row_01" title="120">120</a></li>



        </ul>
        <!-- end #airplane -->

    </div>

    <!-- end #passenger_details -->
</form>
<script>

//    $.ajax({
//        type: "GET",
//        url: "/mapa/MesaReservas",
//        data: null,
//        dataType: "json",
//        success: function (response) {
//            var block = "";
//            $.each(response, function (i, e) {
//                if (e.toString().length === 1) {
//                    block += "[title='0" + e + "'],";
//                } else {
//                    block += "[title='" + e + "'],";
//                }
//            });
//            block = block.substring(0, block.length - 1);
//            if (block !== "") {
//                $("#airplane>li>a" + block).addClass("block");
//            }

//        }
//    });
</script>

</body>
</html>