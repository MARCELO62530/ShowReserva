using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ReservaMesa
/// </summary>
public class ReservaMesa
{
	public int id { get; set; }
	public string Descricao { get; set; }
	public ReservaMesa()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public List<ReservaMesa> BuscaMesasReservas()
	{
		using (CmdBanco cmd = new CmdBanco())
		{
			//BuscaImoveisPerfil   @Perfil_Imovel int,@PageIndex  int,@PageSize int
			SqlDataReader dr;
			dr = cmd.ExecuteReader("ReservaMesaBuscar", System.Data.CommandType.StoredProcedure);
			List<ReservaMesa> lst = new List<ReservaMesa>();

			while (dr.Read())
			{
				ReservaMesa mesas = new ReservaMesa();
				mesas.Descricao = dr["descricao"].ToString();

				lst.Add(mesas);
			}
			return lst;
		}

	}

}