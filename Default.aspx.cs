using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        if(!this.IsPostBack)
        ispolniMaster();
    }
    protected void ispolniMaster()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandText = "SELECT * FROM UserData";
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            adapter.Fill(ds, "Useri");
            GridView1.DataSource = ds;
            GridView1.DataBind();

            ViewState["userDataSet"] = ds;
        }
            catch(Exception e)
        {
            TextBox1.Text = e.Message;
        }
        finally
        {
            conn.Close();

        }




    }
}