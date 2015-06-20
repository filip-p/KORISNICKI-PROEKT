using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBook : System.Web.UI.Page
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
            }
            booksNumber.Value = getNumberOfItems("BookData").ToString();
            usersNumber.Value = getNumberOfItems("UserData").ToString();
            lblYear.Text = DateTime.Now.Year.ToString();
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
    public int getNumberOfItems(string table_name)
    {
        int number = 0;
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "SELECT COUNT(*) FROM " + table_name;
        try
        {
            connection.Open();
            number = (int)cmd.ExecuteScalar();
        }
        catch (Exception err)
        {

        }
        finally
        {
            connection.Close();
        }
        return number;
    }
    protected void submitBook_Click(object sender, EventArgs e)
    {
        byte[] imgbyte;
        //Condition to check if the file uploaded or not
        if (inputImageUpload.HasFile)
        {
            //getting length of uploaded file
            int length = inputImageUpload.PostedFile.ContentLength;
            //create a byte array to store the binary image data
            imgbyte = new byte[length];
            //store the currently selected file in memeory
            HttpPostedFile img = inputImageUpload.PostedFile;
            //set the binary data
            img.InputStream.Read(imgbyte, 0, length);

            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
            try
            {
                connection.Open();
                string insertQuery = "INSERT INTO BookData (Id,BookName,BookAuthor,BookSellerUser,BookPrice, BookDescription, BookImage,BookNeededForExchange) values (@id ,@bname ,@bau ,@bseu ,@bpri,@bdes,@bimg,@bnfe)";

                SqlCommand cmd = new SqlCommand(insertQuery, connection);
                Guid newGUID = Guid.NewGuid();
                cmd.Parameters.AddWithValue("@id", newGUID.ToString());
                cmd.Parameters.AddWithValue("@bname", inputBookTitle.Text);
                cmd.Parameters.AddWithValue("@bau", inputBookAuthor.Text);
                cmd.Parameters.AddWithValue("@bseu", Session["New"].ToString());
                cmd.Parameters.AddWithValue("@bpri", inputBookPrice.Text);
                cmd.Parameters.AddWithValue("@bdes", inputBookDescription.Text);
                cmd.Parameters.Add("@bimg", SqlDbType.Image).Value = imgbyte;
                cmd.Parameters.AddWithValue("@bnfe", inputBookNeeded.Text);

                cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                TextBox1.Text = err.Message;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}