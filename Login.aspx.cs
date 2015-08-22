using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class Login : System.Web.UI.Page
{
    bool used = false;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.IsPostBack)
        {
            if ((string)Session["New"] == "admin")
            {
                lnkAdminPage.Visible = true;

            }
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
            connection.Open();
            string checkuser = "SELECT count(*) FROM UserData WHERE username='" + inputUsername.Text + "'";
            SqlCommand command = new SqlCommand(checkuser, connection);
            int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
            if (temp > 0)
            {
                tbHasUser.Visible = true;
                tbHasUser.Text = "That Username already exists, please select a new one.";
                used = true;
            }
            connection.Close();
        }
        else if (!this.IsPostBack)
        {
            tbLoggedIn.Visible = false;
            tbHasUser.Visible = false;
            tbHasUser.Text = "";
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
            if (Request.QueryString["err"] != null)
            {
                if (Request.QueryString["err"] == "1")
                {
                    tbLoggedIn.Text = "You need to be Logged in to view the catalog!";
                    tbLoggedIn.Visible = true;
                }
                else if (Request.QueryString["err"] == "2")
                {
                    tbLoggedIn.Text = "You need to be Logged in to add new books to the catalog!";
                    tbLoggedIn.Visible = true;
                }
                else  if (Request.QueryString["err"] == "3")
                {
                    tbLoggedIn.Text = "You need to be Logged in to purchase or exchange that item!";
                    tbLoggedIn.Visible = true;
                }
            }
            lblYear.Text = DateTime.Now.Year.ToString();
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
    protected void lnkButtonHome_Click(object sender, EventArgs e)
    {
        if ((string)Session["New"] == "admin")
        {
            Response.Redirect("Home.aspx?admin=true", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        else
        {
            Response.Redirect("Home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
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

    protected void lnkBrand_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void buttonRegister_Click(object sender, EventArgs e)
    {
        if (!used)
        {
            registering();
        }
        used = false;
    }
    protected void buttonSmallRegister_Click(object sender, EventArgs e)
    {
        if (!used)
        {
            registering();
        }
        used = false;
    }

    protected void registering()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString);
        string insertQuery = "INSERT INTO UserData (Id,username,password,email,faculty) values (@id ,@Uname ,@pass ,@em ,@facult)";
        SqlCommand command = new SqlCommand(insertQuery, conn);
        try
        {
            conn.Open();
            Guid newGUID = Guid.NewGuid();
            command.Parameters.AddWithValue("@id", newGUID.ToString());
            command.Parameters.AddWithValue("@Uname", inputUsername.Text.Trim());
            command.Parameters.AddWithValue("@pass", inputPassword.Text);
            command.Parameters.AddWithValue("@em", inputEmail.Text.Trim());
            command.Parameters.AddWithValue("@facult", inputFaculty.Text.Trim());
            command.ExecuteNonQuery();
            tbHasUser.Visible = true;
            tbHasUser.Text = "Registration was successful, you can now login with your new account and welcome to BookExchange";
        
        }
        catch (Exception e)
        {
            tbHasUser.Text = e.Message;
        }
        finally
        {
            conn.Close();

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString);
        conn.Open();
        string checkuser = "SELECT count(*) FROM UserData where username='" + inputLoginUsername.Text + "'";
        SqlCommand command = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
        tbLoggedIn.Visible = true;
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPasswordQuery = "SELECT password FROM UserData where username='" + inputLoginUsername.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
            string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
            if (password == inputLoginPassword.Text)
            {
                Session["New"] = inputLoginUsername.Text;
                tbLoggedIn.Text = "Login was successful";
                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-out\"></span> Logout";
                Response.Redirect("Home.aspx");
            }
            else
            {
                tbLoggedIn.Text = "Username or Password is incorrect";
            }
        }
        else
        {
            tbLoggedIn.Text = "Username or Password is incorrect";
        }

        conn.Close();
    }
    protected void lnkAdminPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}