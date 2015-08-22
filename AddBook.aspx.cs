using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
                if ((string)Session["New"] == "admin")
                {
                    lnkAdminPage.Visible = true;
                }
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
                Response.Redirect("Login.aspx?err=2", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            putNumbersInHiddenValues();
            lblYear.Text = DateTime.Now.Year.ToString();
        }
    }
    protected void putNumbersInHiddenValues()
    {
        booksNumber.Value = getNumberOfItems("BookData").ToString();
        usersNumber.Value = getNumberOfItems("UserData").ToString();
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
                cmd.Parameters.AddWithValue("@bdes", inputBookDescription.Text);
                cmd.Parameters.Add("@bimg", SqlDbType.Image).Value = imgbyte;
                string bookNeeded = inputBookNeeded.Text.Trim();
                if (!bookNeeded.ToUpper().Equals("NONE"))
                    cmd.Parameters.AddWithValue("@bnfe", bookNeeded);
                else
                {
                    cmd.Parameters.AddWithValue("@bnfe", DBNull.Value);
                }
                string bookPrice = inputBookPrice.Text.Trim();
                if (!(bookPrice.ToUpper().Equals("0")) || bookPrice.Length!=0)
                    cmd.Parameters.AddWithValue("@bpri", bookPrice + " $");
                else
                {
                    cmd.Parameters.AddWithValue("@bpri", DBNull.Value);
                }


                int a = cmd.ExecuteNonQuery();
                if (a == 1)
                {
                    tbBookAdded.Text = "The book has been successfully added to the catalog";
                    tbBookAdded.Visible = true;
                    inputBookAuthor.Text = "";
                    inputBookDescription.Text = "";
                    inputBookNeeded.Text = "";
                    inputBookPrice.Text = "";
                    inputBookTitle.Text = "";
                    putNumbersInHiddenValues();
                    ClientScript.RegisterStartupScript(this.GetType(), "GraphScript", "chartData();", false);
                }
            }
            catch (Exception err)
            {
                //    TextBox1.Text = err.Message;
            }
            finally
            {
                connection.Close();

            }
        }
    }
    protected void cancelSubmitBook_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catalog.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void lnkAdminPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
    protected void btnJoinMailList_Click(object sender, EventArgs e)
    {
        Application.Lock();
        MailingList ml = new MailingList();
        string result = ml.AddRecipient(tbJoinMailList.Text);
        tbJoinMailList.Text = result;
        Application.UnLock();
    }
}