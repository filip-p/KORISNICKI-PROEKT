using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        if (!this.IsPostBack)
        {
            if ((string)Session["New"] != "admin")
            {
                Response.Redirect("Login.aspx", true);
                Context.ApplicationInstance.CompleteRequest();
            }
            if (Session["New"] != null)
            {
                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-out\"></span> Logout";
                lnkLoginRegister.OnClientClick = "return confirm('Are you sure you want to log out?');";
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
            }
            lblYear.Text = DateTime.Now.Year.ToString();
            bindUsersGridData();
            bindBooksGridData();
        }
      
    }
    protected void bindUsersGridData()
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
            gvUsersInDB.DataSource = ds;
            gvUsersInDB.DataBind();

            ViewState["userDataSet"] = ds;
        }
        catch (Exception e)
        {
            TextBox1.Text = e.Message;
        }
        finally
        {
            conn.Close();

        }
    }

    protected void bindBooksGridData()
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand("SELECT * FROM BookData", connection);
        SqlDataAdapter daimages = new SqlDataAdapter(command);
        
        DataTable dt = new DataTable();
            daimages.Fill(dt);
        gvBooksInDB.DataSource = dt;
        gvBooksInDB.DataBind();
        ViewState["bookDataTable"] = dt;
    }

    protected void lnkButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?admin=true", false);
        Context.ApplicationInstance.CompleteRequest();

    }
    protected void lnkWishlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("Wishlist.aspx", false);
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
    protected void lnkContactAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactAbout.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }
    protected void lnkCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }
    protected void lnkCatalog_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catalog.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }
    protected void lnkSearch_Click(object sender, EventArgs e)
    {
        if (inputSearch.Text.Trim().Length != 0)
        {
            Response.Redirect("Catalog.aspx?name=" + inputSearch.Text, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
    protected void lnkBrand_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void gvBooksInDB_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataTable dt = (DataTable)ViewState["bookDataTable"];
        gvBooksInDB.EditIndex = e.NewEditIndex;
        gvBooksInDB.DataSource = dt;
        gvBooksInDB.DataBind();

        Label labelDescription = (Label)gvBooksInDB.Rows[e.NewEditIndex].FindControl("lblBookDescription");
        labelDescription.Visible = false;
        TextBox textBoxDescriptionForEdit = (TextBox)gvBooksInDB.Rows[e.NewEditIndex].FindControl("tbBookDescription");
        textBoxDescriptionForEdit.Text = labelDescription.Text;
        textBoxDescriptionForEdit.ReadOnly = false;
        textBoxDescriptionForEdit.Visible = true;
        LinkButton lbDeleteButton = (LinkButton)gvBooksInDB.Rows[e.NewEditIndex].FindControl("linkButtonDelete");
        lbDeleteButton.Visible = false;
        LinkButton lbCancelButton = (LinkButton)gvBooksInDB.Rows[e.NewEditIndex].FindControl("linkButtonCancel");
        lbCancelButton.Visible = true;
        
    }
    protected void gvBooksInDB_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataTable dt = (DataTable)ViewState["bookDataTable"];
        gvBooksInDB.EditIndex = -1;
        gvBooksInDB.DataSource = dt;
        gvBooksInDB.DataBind();
        Label labelDescription = (Label)gvBooksInDB.Rows[e.RowIndex].FindControl("lblBookDescription");
        labelDescription.Visible = true;
        TextBox textBoxDescriptionForEdit = (TextBox)gvBooksInDB.Rows[e.RowIndex].FindControl("tbBookDescription");
        textBoxDescriptionForEdit.ReadOnly = true;
        textBoxDescriptionForEdit.Visible = false;
    }
    protected void gvBooksInDB_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand("UPDATE BookData SET BookDescription=@BookDescription WHERE Id=@Id", connection);
        Label labelId = (Label)gvBooksInDB.Rows[e.RowIndex].FindControl("lblId");
        command.Parameters.AddWithValue("@Id", labelId.Text);
        TextBox textBoxDescriptionForEdit = (TextBox)gvBooksInDB.Rows[e.RowIndex].FindControl("tbBookDescription");
        command.Parameters.AddWithValue("@BookDescription", textBoxDescriptionForEdit.Text);
        int effect = 0;
        try
        {
            connection.Open();
            effect = command.ExecuteNonQuery();
        }
        catch (Exception err)
        {

        }
        finally
        {
            connection.Close();
            gvBooksInDB.EditIndex = -1;
        }
        if (effect != 0)
        {
            bindBooksGridData();
        }
        
    }
    protected void gvBooksInDB_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBooksInDB.PageIndex = e.NewPageIndex;
        gvBooksInDB.SelectedIndex = -1;
        DataTable dt = (DataTable)ViewState["bookDataTable"];
        gvBooksInDB.DataSource = dt;
        gvBooksInDB.DataBind();
    }
    protected void gvUsersInDB_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsersInDB.PageIndex = e.NewPageIndex;
        gvUsersInDB.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["userDataSet"];
        gvUsersInDB.DataSource = ds;
        gvUsersInDB.DataBind();
    }

    protected void lnkAdminPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
    protected void gvBooksInDB_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand("DELETE FROM BookData WHERE Id=@Id", connection);
        Label lbl = (Label)gvBooksInDB.Rows[e.RowIndex].FindControl("lblId");
        command.Parameters.AddWithValue("@Id", lbl.Text);
        int effect = 0;
        try
        {
            connection.Open();
            effect = command.ExecuteNonQuery();
        }
        catch (Exception err)
        {

        }
        finally
        {
            connection.Close();
            gvBooksInDB.EditIndex = -1;
        }
        if (effect != 0)
        {
            bindBooksGridData();
        }
    }


    protected void gvUsersInDB_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand("DELETE FROM UserData WHERE Id=@Id", connection);
        
        command.Parameters.AddWithValue("@Id", gvUsersInDB.SelectedRow.Cells[0].Text);
        int effect = 0;
        try
        {
            connection.Open();
            effect = command.ExecuteNonQuery();
        }
        catch (Exception err)
        {

        }
        finally
        {
            connection.Close();
            gvUsersInDB.EditIndex = -1;
        }
        if (effect != 0)
        {
            bindUsersGridData();
        }
    }

}