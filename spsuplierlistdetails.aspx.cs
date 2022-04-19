using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class spsuplierlistdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand command = new SqlCommand();
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet ds = new DataSet();
        int i = 0;
        string sql = null;
        string connetionString = "Data Source=EXTRAINCH-001;Initial Catalog=NORTHWND;User ID=bantu;Password=bantu123";
        SqlConnection connection = new SqlConnection(connetionString);
        connection.Open();
        command.Connection = connection;
        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "SP_SELECT_SUPPLIERS";
        adapter = new SqlDataAdapter(command);
        adapter.Fill(ds);
        connection.Close();
        GridView.DataSource = ds.Tables[0];
        GridView.DataBind();
    }
}