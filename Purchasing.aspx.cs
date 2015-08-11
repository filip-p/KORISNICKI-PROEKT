using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Purchasing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            if (Session["New"] != null)
            {
              
                    lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-out\"></span> Logout";
                    lbUser.Text = (string)Session["New"];
                    lbUser.Visible = true;
                    lblTime.Visible = true;
                    lblTime.Text = DateTime.Now.ToString();
             
            }
            else
            {
                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-in\"></span> Login/Register";
                lbUser.Visible = false;
                lblTime.Visible = false;
                footerLbl.Visible = false;
                Response.Redirect("Login.aspx?err=3", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            lblYear.Text = DateTime.Now.Year.ToString();
            addItemInfo();
        }
    }
    protected void addItemInfo()
    {
        string ID = Request.QueryString["id"];
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        command.CommandText = "SELECT * FROM BookData WHERE Id='" + ID + "'";
        try
        {
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                byte[] picData = (byte[])reader["BookImage"];
                string imageBase64 = Convert.ToBase64String(picData);
                string imageSrc = string.Format("data:image/jpg;base64,{0}", imageBase64);
                imgPurchasing.ImageUrl = imageSrc;
                namePurchasing.Text = reader["BookName"].ToString();
                authorPurchasing.Text = reader["BookAuthor"].ToString();
                pricePurchasing.Text = reader["BookPrice"].ToString();
                descriptionPurchasing.Text = reader["BookDescription"].ToString();
                reader.Close();
            }
        }
        catch (Exception err)
        {

        }
        finally
        {
            connection.Close();
        }
    }
    protected void lnkButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void lnkLoginRegister_Click(object sender, EventArgs e)
    {
        if (lnkLoginRegister.Text == "<span class=\"glyphicon glyphicon-log-in\"></span> Login/Register")
        {
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();

        }
        else if (lnkLoginRegister.Text == "<span class=\"glyphicon glyphicon-log-out\"></span> Logout")
        {

            Session["New"] = null;
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();

        }
    }
    protected void lnkSearch_Click(object sender, EventArgs e)
    {
        if (inputSearch.Text.Trim().Length != 0)
        {
            Response.Redirect("Catalog.aspx?name=" + inputSearch.Text, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
    protected void lnkContactAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactAbout.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void lnkCatalog_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catalog.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void lnkBrand_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catalog.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}