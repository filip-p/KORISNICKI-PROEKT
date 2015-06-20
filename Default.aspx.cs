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
            ispolniMaster();
            BindGridData();

        }
        if (Application["brojKorisnici"] != null)
            TextBox1.Text = (string)Application["brojKorisnici"];
        if (Application["brojNaKnigi"] != null)
        {
            TextBox2.Text = (string)Application["brojNaKnigi"];
        }
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
        catch (Exception e)
        {
            TextBox1.Text = e.Message;
        }
        finally
        {
            conn.Close();

        }




    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        byte[] imgbyte;
        //Condition to check if the file uploaded or not
        if (FileUpload1.HasFile)
        {
            //getting length of uploaded file
            int length = FileUpload1.PostedFile.ContentLength;
            //create a byte array to store the binary image data
            imgbyte = new byte[length];
            //store the currently selected file in memeory
            HttpPostedFile img = FileUpload1.PostedFile;
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
                cmd.Parameters.AddWithValue("@bname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@bau", TextBox3.Text);
                cmd.Parameters.AddWithValue("@bseu", Session["New"].ToString());
                cmd.Parameters.AddWithValue("@bpri", TextBox5.Text);
                cmd.Parameters.AddWithValue("@bdes", TextBox6.Text);
                cmd.Parameters.Add("@bimg", SqlDbType.Image).Value = imgbyte;
                cmd.Parameters.AddWithValue("@bnfe", TextBox4.Text);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Application.Lock();
                    if (Application["brojNaKnigi"] == null)
                    {
                        Application["brojNaKnigi"] = 1;
                    }
                    else
                    {
                        Application["brojNaKnigi"] = (int)Application["brojNaKnigi"] + 1;
                    }
                    Application.UnLock();
                    BindGridData();
                   
                }
            }
            catch (Exception err)
            {
                TextBox7.Text = err.Message;
            }
            finally
            {
                connection.Close();
            }
        }
    }

    protected void BindGridData()
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand("SELECT * FROM BookData", connection);
        SqlDataAdapter daimages = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        daimages.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

}