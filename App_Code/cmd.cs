using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;


public class CmdBanco : IDisposable
{
	void IDisposable.Dispose() { }
	void Dispose() { this.Dispose(); }
	//string strconexao = @"Data Source=USUARIO-PC\SQLEXPRESS;Initial Catalog=Lojapadrao;User ID=SA;TrustServerCertificate=True;";

	//string strconexao = "Data Source=67.222.131.36;Initial Catalog=Lojapadrao;User ID=lojapadrao;TrustServerCertificate=True;pwd=marcelosantana";
	string strconexao = "Data Source=189.84.25.63;Initial Catalog=inforreserva;User ID=sa;TrustServerCertificate=True;pwd=172031";


	SqlConnection Conexao;
	public enum eCloseConnection
	{
		Yes = 0,
		No = 1
	}
	public CmdBanco()
	{
		Conexao = new SqlConnection(strconexao);
	}
	bool OpenConnection()
	{
		if (Conexao.State == ConnectionState.Closed)
		{
			Conexao.Open();
			return true;
		}
		return false;
	}
	bool CloseConnection(eCloseConnection Close = eCloseConnection.Yes)
	{
		if (Conexao.State == ConnectionState.Open && Close == eCloseConnection.Yes)
		{
			Conexao.Close();
			return true;
		}
		return false;
	}
	public void Execute(string sql, SqlParameter[] Parametros = null, eCloseConnection Close = eCloseConnection.Yes)
	{
		try
		{

			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			OpenConnection();
			AddParameter(ref cmd, ref Parametros);
			cmd.ExecuteNonQuery();
			cmd.Dispose();
			Parametros = null;
			CloseConnection(Close);

		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public void Execute(string sql, CommandType tipo)
	{
		try
		{

			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = System.Data.CommandType.Text;
			OpenConnection();

			cmd.ExecuteNonQuery();
			cmd.Dispose();
			CloseConnection();
			;

		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public void ExecuteScalar(ref object Return, string sql, SqlParameter[] Parametros = null, eCloseConnection Close = eCloseConnection.Yes)
	{
		try
		{

			//  object Return = "";
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			OpenConnection();
			AddParameter(ref cmd, ref Parametros);
			Return = cmd.ExecuteScalar();
			cmd.Dispose();
			Parametros = null;
			CloseConnection(Close);
			// return Return;
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public object ExecuteScalar(string sql, CommandType Tipo)
	{
		try
		{

			object Return = "";
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = Tipo;
			OpenConnection();
			Return = cmd.ExecuteScalar();
			cmd.Dispose();

			CloseConnection();
			return Return;
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public int ExecuteScalar(string sql, SqlParameter[] Parametros = null, eCloseConnection Close = eCloseConnection.Yes)
	{
		try
		{
			int ret;
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			OpenConnection();
			AddParameter(ref cmd, ref Parametros);
			ret = Convert.ToInt32(cmd.ExecuteScalar());
			cmd.Dispose();
			Parametros = null;
			CloseConnection(Close);
			return ret;
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public byte[] ExecuteByte(string sql, SqlParameter[] Parametros = null, eCloseConnection Close = eCloseConnection.Yes)
	{
		try
		{
			byte[] ret;
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			OpenConnection();
			AddParameter(ref cmd, ref Parametros);
			ret = (byte[])cmd.ExecuteScalar();
			cmd.Dispose();
			Parametros = null;
			CloseConnection(Close);
			return ret;
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public DataTable ExecuteDatatable(string sql, SqlParameter[] Parametros = null)
	{
		DataTable dt = new DataTable();
		SqlDataAdapter da = new SqlDataAdapter(sql, Conexao);
		da.SelectCommand.CommandType = CommandType.StoredProcedure;
		MontaParametros(ref da, Parametros);
		da.Fill(dt);
		da.Dispose();
		CloseConnection(eCloseConnection.Yes);

		return dt;
	}
	public DataTable ExecuteDatatable(string sql, CommandType Tipo)
	{
		DataTable dt = new DataTable();
		SqlDataAdapter da = new SqlDataAdapter(sql, Conexao);
		da.SelectCommand.CommandType = Tipo;
		da.SelectCommand.CommandTimeout = 300;

		da.Fill(dt);
		da.Dispose();
		CloseConnection(eCloseConnection.Yes);

		return dt;
	}
	private void MontaParametros(ref SqlDataAdapter da, SqlParameter[] Parametros)
	{
		if ((Parametros != null))
		{
			// SqlParameter param = default(SqlParameter);
			foreach (SqlParameter param in Parametros)
			{
				da.SelectCommand.Parameters.Add(param);
			}
		}
	}
	/// <summary>
	/// Não Esqueca de fechar o SqlDataReader
	/// Depois de Usar esta Função
	/// </summary>
	/// <param name="sql"></param>
	/// <param name="Parametros"></param>
	/// <param name="Close"></param>
	/// <returns></returns>
	public SqlDataReader ExecuteReader(string sql, SqlParameter[] Parametros = null)
	{
		try
		{
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = CommandType.StoredProcedure;
			OpenConnection();
			AddParameter(ref cmd, ref Parametros);
			return cmd.ExecuteReader(CommandBehavior.CloseConnection);
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}

	}
	public SqlDataReader ExecuteReader(string sql, CommandType Tipo)
	{
		try
		{
			SqlCommand cmd = new SqlCommand(sql, Conexao);
			cmd.CommandType = Tipo;
			OpenConnection();
			return cmd.ExecuteReader(CommandBehavior.CloseConnection);
		}
		catch (SqlException ex)
		{
			CloseConnection(eCloseConnection.Yes);
			throw ex;
		}
	}
	public DataSet ExecutaRetornaDataSet(string sql)
	{
		DataSet ds = new DataSet();
		try
		{
			SqlDataAdapter da = new SqlDataAdapter(sql, Conexao);
			da.SelectCommand.CommandType = CommandType.Text;
			da.Fill(ds, "Temp");
			da.Dispose();
		}
		catch (Exception)
		{
			throw;
		}
		return ds;
	}
	public DataSet ExecutaRetornaDataSet(string sql, CommandType Tipo, ref SqlParameter[] Parametros)
	{
		try
		{
			DataSet ds = new DataSet();
			OpenConnection();
			ds.Tables.Clear();
			SqlDataAdapter da = new SqlDataAdapter(sql, Conexao);
			da.SelectCommand.CommandType = Tipo;
			//abastece o adapter com os parametros

			MontaParametros(ref da, Parametros);
			da.Fill(ds, "Temp");
			da.Dispose();
			CloseConnection();
			return ds;
		}
		catch (SqlException ex)
		{
			//   Comandos.MsgboxDeErro("ComandosBanco", "ExecuteReader", ex.ErrorCode, ex.Message)
			throw (ex);
		}
	}
	#region Parameter
	public SqlParameter CreateParameter(string Name, SqlDbType Type, object value, ParameterDirection Direction = ParameterDirection.Input, int Length = 0)
	{
		SqlParameter param = new SqlParameter();
		param.ParameterName = Name;
		param.SqlDbType = Type;
		param.Direction = Direction;
		if ((Direction == ParameterDirection.Output))
		{
			param.Size = Length;
		}
		if ((value == null))
		{
			param.Value = DBNull.Value;
		}
		else
		{
			if ((Type == SqlDbType.NVarChar) && (value.ToString().Length == 0))
			{
				param.Value = DBNull.Value;
			}
			else if ((Type == SqlDbType.DateTime))
			{
				if ((value.ToString() == ""))
				{
					param.Value = DBNull.Value;
				}
				else
				{
					param.Value = value;
				}
			}
			param.Value = value;
		}
		return param;
	}
	public SqlParameter CreateParameterOutPut(string Name, SqlDbType Type, int Length, object value)
	{
		SqlParameter param = new SqlParameter();
		param.ParameterName = Name;
		param.SqlDbType = Type;
		param.Direction = ParameterDirection.InputOutput;
		param.Size = Length;
		{
			if ((Type == SqlDbType.NVarChar) && (value.ToString().Length == 0))
			{
				param.Value = DBNull.Value;
			}
			else if ((Type == SqlDbType.DateTime))
			{
				if ((value.ToString() == ""))
				{
					param.Value = DBNull.Value;
				}
				else
				{
					param.Value = value;
				}
			}
			param.Value = value;
		}
		return param;
	}

	public SqlParameter CreateParameter(string Name, SqlDbType Type, int Length, object value)
	{
		SqlParameter param = new SqlParameter();
		param.ParameterName = Name;
		param.SqlDbType = Type;
		param.Direction = ParameterDirection.Input;
		param.Size = Length;
		if ((value == null))
		{
			param.Value = DBNull.Value;
		}
		else
		{
			if ((Type == SqlDbType.NVarChar) && (value.ToString().Length == 0))
			{
				param.Value = DBNull.Value;
			}
			else if ((Type == SqlDbType.DateTime))
			{
				if ((value.ToString() == ""))
				{
					param.Value = DBNull.Value;
				}
				else
				{
					param.Value = value;
				}
			}
			param.Value = value;
		}
		return param;
	}

	private void AddParameter(ref SqlCommand cmd, ref  SqlParameter[] Parametros)
	{
		try
		{
			if (!(Parametros == null))
			{
				foreach (SqlParameter param in Parametros)
				{
					cmd.Parameters.Add(param);
				}
			}
		}
		catch (SqlException ex)
		{
			throw ex;
		}
	}
	#endregion
}
