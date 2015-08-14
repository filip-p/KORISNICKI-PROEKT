using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalog : System.Web.UI.Page
{
    int j = 0;
    string id = "";
    DropDownList ddll;

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
                lbUser.Text = (string)Session["New"];
                lbUser.Visible = true;
                lblTime.Visible = true;
                lblTime.Text = DateTime.Now.ToString();

            }
            else
            {

                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-in\"></span> Login/Register";
                lnkLoginRegister.OnClientClick = "return confirm('Are you sure you want to log out?');";
                footerLbl.Visible = false;
                Response.Redirect("Login.aspx?err=1", false);
                Context.ApplicationInstance.CompleteRequest();

            }
            if (Request.QueryString["name"] == null)
                prikaziStavki(null);
            else
                prikaziStavki((string)Request.QueryString["name"]);

            lblYear.Text = DateTime.Now.Year.ToString();
        }
        if (this.IsPostBack)
        {
            prikaziStavki(null);
        }
    }
    protected void prikaziStavki(string Name)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        string scom;
        if (Name == null)
        {
            scom = "SELECT Id, BookName, BookImage, BookAuthor, BookDescription, BookPrice, BookSellerUser,BookNeededForExchange FROM BookData";
        }
        else
        {
            scom = "SELECT Id, BookName, BookImage, BookAuthor, BookDescription, BookPrice, BookSellerUser,BookNeededForExchange FROM BookData WHERE BookName LIKE '%" + Name + "%'";
        }
        komanda.CommandText = scom;
      

        try
        {
            connection.Open();
           
            SqlDataReader reader = komanda.ExecuteReader();

            TableHeaderRow th = new TableHeaderRow();
            th.TableSection = TableRowSection.TableHeader;


            TableHeaderCell thd = new TableHeaderCell();
            Label lbl = new Label();
            lbl.Text = "<h3>BookName</h3>";
            thd.Controls.Add(lbl);
            thd.CssClass = "col-sm-3 text-center";

            TableHeaderCell thd2 = new TableHeaderCell();
            Label lbl2 = new Label();
            lbl2.Text = "<h3>Book Author & Description</h3>";
            thd2.Controls.Add(lbl2);
            thd2.CssClass = "col-sm-4 text-center";

            TableHeaderCell thd3 = new TableHeaderCell();
            Label lbl3 = new Label();
            lbl3.Text = "<h3>Seller</h3>";
            thd3.Controls.Add(lbl3);
            thd3.CssClass = "col-sm-3 text-center";

            TableHeaderCell thd4 = new TableHeaderCell();
            Label lbl4 = new Label();
            lbl4.Text = "<h3>&nbsp;</h3>";
            thd4.Controls.Add(lbl4);
            thd4.CssClass = "col-sm-2 text-center";

            th.Cells.Add(thd);
            th.Cells.Add(thd2);
            th.Cells.Add(thd3);
            th.Cells.Add(thd4);

            bookShowTable.Rows.Add(th);
            j = 0;
            while (reader.Read())
            {

                j++;
                TableRow tr = new TableRow();
                TableCell td = new TableCell();
                Label spanBookName = new Label();
                string BookName = reader["BookName"].ToString();
                spanBookName.Text = "<h4 class=\"text-center\">" + BookName + "</h4>";
                byte[] picData = (byte[])reader["BookImage"];
                string imageBase64 = Convert.ToBase64String(picData);
                string imageSrc = string.Format("data:image/jpg;base64,{0}", imageBase64);

                Image im = new Image();
                im.ImageUrl = imageSrc;
                im.CssClass = "img-responsive";
                im.Width = 300;
                im.Height = 300;
                td.Controls.Add(spanBookName);
                td.Controls.Add(im);
                td.CssClass = "col-sm-3";
                tr.Cells.Add(td);

                TableCell td2 = new TableCell();
                td2.Text = "<h4 class=\"text-center\">" + reader["BookAuthor"].ToString() + "</h4><hr />" +
                "<p>" + reader["BookDescription"].ToString() + "</p>";
                td2.CssClass = "col-sm-4";
                tr.Cells.Add(td2);

                TableCell td3 = new TableCell();
                string exchange = reader["BookNeededForExchange"].ToString();
                bool buyable = true;
                bool exchangeable = true;
                string BookPrice = reader["BookPrice"].ToString();
                if (reader["BookNeededForExchange"] != DBNull.Value)
                {
                    if (reader["BookPrice"] != DBNull.Value)
                    {
                        td3.Text = "<h4 class=\"text-center\">" + reader["BookSellerUser"].ToString() + "</h4><hr />" +
                            "<h4 class=\"text-center\">Price = " + reader["BookPrice"].ToString() + "</h4><hr /><p>Exchangeable for:</p><p>" + exchange + "</p><hr />";
                    }
                    else
                    {
                        buyable = false;
                        td3.Text = "<h4 class=\"text-center\">" + reader["BookSellerUser"].ToString() + "</h4><hr />" +
                         "<h4 class=\"text-center\">The item is for Exchange ONLY!</h4><hr /><p>Exchangeable for:</p><p>" + exchange + "</p><hr />";
                    }
                }
                else
                {
                    exchangeable = false;
                    td3.Text = "<h4 class=\"text-center\">" + reader["BookSellerUser"].ToString() + "</h4><hr />" +
                        "<h4 class=\"text-center\">Price = " + reader["BookPrice"].ToString() + "</h4><hr /><p>This book is not exchangeable!</p><hr />";
                }
                td3.CssClass = "col-sm-3";
                tr.Cells.Add(td3);

                TableCell td4 = new TableCell();
                td4.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
                LinkButton btn = new LinkButton();
                btn.ID = "btnBuy" + j;
                btn.OnClientClick = "return confirm('Are you sure you want to buy \"" + BookName + "\" for \"" + BookPrice + "\"?');";
                btn.Command += new CommandEventHandler(this.btn_Command);
                btn.CommandArgument = reader["Id"].ToString();
                btn.CssClass = "btn btn-success btn-block";
                btn.Text = "<span class=\"fa fa-usd\"></span> Buy";


                LinkButton btn2 = new LinkButton();

                btn2.ID = "btnExchange" + j;
                btn2.Command += new CommandEventHandler(this.btn_Command2);
                btn2.CommandArgument = reader["Id"].ToString();
                btn2.OnClientClick = "return confirm('Are you sure you want to exchange this book?');";
                btn2.CssClass = "btn btn-info btn-block";
                btn2.Text = "<span class=\"glyphicon glyphicon-transfer\"></span> Exchange";
                ddll = new DropDownList();
                if (buyable)
                    td4.Controls.Add(btn);
                if (exchangeable)
                    td4.Controls.Add(btn2);

                if (reader["BookSellerUser"].ToString().Equals(Session["New"].ToString()))
                {
                    btn.CssClass += " disabled";
                    btn2.CssClass += " disabled";
                    Label cantBuyLabel = new Label();
                    if (exchangeable && buyable)
                        cantBuyLabel.Text = "You can't buy or exchange this book because you are it's seller";
                    else if (exchangeable && !buyable)
                        cantBuyLabel.Text = "You can't exchange this book because you are it's seller";
                    else if (!exchangeable && buyable)
                        cantBuyLabel.Text = "You can't buy this book because you are it's seller";
                    td4.Controls.Add(cantBuyLabel);
                }
                else
                {
                    string[] items = exchange.Split(';');
                    for (int i = 0; i < items.Length; i++)
                    {
                        ddll.Items.Add(items[i]);
                    }
                    ddll.SelectedIndex = 0;
                    ddll.ID = "ddl" + j;
                    ddll.CssClass = "dropdownz";

                    ddll.SelectedIndexChanged += new EventHandler(ddll_SelectedIndexChanged);
                    ddlItem.Value = ddll.SelectedValue.ToString();
                    if (exchangeable)
                        td4.Controls.Add(ddll);
                }


                td4.CssClass = "col-sm-2";
                tr.Cells.Add(td4);

                bookShowTable.Rows.Add(tr);
            }
            reader.Close();
        }
        catch (Exception err)
        {
            tbError.Text = err.Message;
        }
        finally
        {
            connection.Close();
            if (j == 0)
            {
                for (int i = 0; i < bookShowTable.Rows.Count; i++)
                    bookShowTable.Rows.RemoveAt(i);
                bookShowTable.Visible = false;
            }
        }

    }

    protected void ddll_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlItem.Value = ddll.SelectedValue.ToString();
    }

    private void btn_Command2(object sender, CommandEventArgs e)
    {
        id = e.CommandArgument.ToString();
    }

    private void btn_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Purchasing.aspx?id=" + e.CommandArgument.ToString(), false);
        Context.ApplicationInstance.CompleteRequest();
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

    protected void AddBook_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddBook.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void lnkAdminPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}