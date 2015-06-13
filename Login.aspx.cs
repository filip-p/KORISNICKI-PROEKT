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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            lnkLoginRegister.Text = "Logout";
        }
        else
        {
            lnkLoginRegister.Text = "Login/Register";
        }
        tbLoggedIn.Visible = false;
        tbHasUser.Visible = false;
        if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString);
            conn.Open();
            string checkuser = "SELECT count(*) FROM UserData where username='" + inputUsername.Text + "'";
            SqlCommand command = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
            if (temp == 1)
            {
                tbHasUser.Visible = true;
                tbHasUser.Text = "That Username already exists, please select a new one.";
            }
            conn.Close();
        }
        else
        {
            tbHasUser.Text = "";
        }
    }
    protected void lnkButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void lnkWishlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("Wishlist.aspx");
    }
    protected void lnkLoginRegister_Click(object sender, EventArgs e)
    {
        if (lnkLoginRegister.Text == "Login/Register")
        {
            Response.Redirect("Login.aspx");
        }
        else if (lnkLoginRegister.Text == "Logout")
        {
        
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }
    }
    protected void lnkContactAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactAbout.aspx");
    }
    protected void lnkCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void lnkCatalog_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catalog.aspx");
    }

    protected void lnkBrand_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void buttonRegister_Click(object sender, EventArgs e)
    {
        registering();
    }
    protected void buttonSmallRegister_Click(object sender, EventArgs e)
    {
        registering();
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
            command.Parameters.AddWithValue("@Uname", inputUsername.Text);
            command.Parameters.AddWithValue("@pass", inputPassword.Text);
            command.Parameters.AddWithValue("@em", inputEmail.Text);
            command.Parameters.AddWithValue("@facult", inputFaculty.Text);
            command.ExecuteNonQuery();
            tbHasUser.Visible = true;
            tbHasUser.Text = "Registration was succesfull, welcome to BookExchange";


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
            string password = passComm.ExecuteScalar().ToString().Replace(" ","");
            if (password == inputLoginPassword.Text)
            {
               Session["New"] = inputLoginUsername.Text;
               tbLoggedIn.Text="Login was successful";
               lnkLoginRegister.Text = "Logout";
               
            }
            else
            {
                tbLoggedIn.Text = "Password is incorrect";
            }
        }
        else
        {
            tbLoggedIn.Text = "Username is incorrect";
        }

        conn.Close();
    }
}