using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
public static partial class FabricaSessao<T> where T : class
{

    public static T Session
    {
        get
        {
            T session = (T)HttpContext.Current.Session["__MySession__"];
            if (session == null)
            {
                session = (T)Activator.CreateInstance(typeof(T));
                HttpContext.Current.Session["__MySession__"] = session;
            }
            return session;
        }
    }



    public static int Tipo
    {
        get { return HttpContext.Current.Session["Tipo"] == null ? 0 : (int)HttpContext.Current.Session["Tipo"]; }
        set { HttpContext.Current.Session["Tipo"] = value; }
    }
    //[WebMethod]
    //public int RetornaSessao()
    //{
    //    return Tipo;
    //}

}