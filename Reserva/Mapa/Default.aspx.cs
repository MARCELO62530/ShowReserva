using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections;
public partial class Reserva_Mapa_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Array BuscaMesaReservada()
    {
        ReservaMesa pes = new ReservaMesa();

        ArrayList r = new ArrayList();

        return pes.BuscaMesasReservas().ToArray();
    }
}