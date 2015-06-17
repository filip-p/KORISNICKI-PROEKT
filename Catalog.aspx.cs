﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalog : System.Web.UI.Page
{
    int j = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["New"] != null)
            {
                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-out\"></span> Logout";
            }
            else
            {
                lnkLoginRegister.Text = "<span class=\"glyphicon glyphicon-log-in\"></span> Login/Register";
                Response.Redirect("Login.aspx?err=1", false);
                Context.ApplicationInstance.CompleteRequest();

            }
            if (Request.QueryString["name"] == null)
                prikaziStavki(null);
            else
                prikaziStavki((string)Request.QueryString["name"]);


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
            lbl.Text = "BookName";
            thd.Controls.Add(lbl);
            thd.CssClass = "col-sm-3 text-center";

            TableHeaderCell thd2 = new TableHeaderCell();
            Label lbl2 = new Label();
            lbl2.Text = "Book Author and Description";
            thd2.Controls.Add(lbl2);
            thd2.CssClass = "col-sm-4 text-center";

            TableHeaderCell thd3 = new TableHeaderCell();
            Label lbl3 = new Label();
            lbl3.Text = "Seller";
            thd3.Controls.Add(lbl3);
            thd3.CssClass = "col-sm-3 text-center";

            TableHeaderCell thd4 = new TableHeaderCell();
            Label lbl4 = new Label();
            lbl4.Text = "&nbsp;";
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
                //   if (!reader["BookSellerUser"].ToString().Equals(Session["New"].ToString()))

                j++;
                TableRow tr = new TableRow();
                TableCell td = new TableCell();
                Label spanBookName = new Label();
                // spanBookName.CssClass = "text-center";
                spanBookName.Text = reader["BookName"].ToString();
                //     td.Text = "<div class=\"row\"><h4>" + reader["BookName"].ToString() + "</h4></div>";
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
                td2.Text = "<h4>" + reader["BookAuthor"].ToString() + "</h4><hr />" +
                "<p>" + reader["BookDescription"].ToString() + "</p>";
                td2.CssClass = "col-sm-4";
                tr.Cells.Add(td2);

                TableCell td3 = new TableCell();
                string exchange = reader["BookNeededForExchange"].ToString();
                td3.Text = "<h4>" + reader["BookSellerUser"].ToString() + "</h4>" +
                    "<h4>Price = " + reader["BookPrice"].ToString() + "</h4><hr /><h4>Tradeable for:</h4><h4>" + exchange + "</h4>";
                //  td3.CssClass = "col-sm-3";
                tr.Cells.Add(td3);

                TableCell td4 = new TableCell();
                LinkButton btn = new LinkButton();
                btn.ID = "btnBuy" + j;
                btn.Command += new CommandEventHandler(this.btn_Command);
                btn.CommandArgument = reader["Id"].ToString();
                btn.CssClass = "btn btn-success btn-block";
                btn.Text = "<span class=\"fa fa-usd\"></span> Buy";


                //    td4.Text += "<br />";
                LinkButton btn2 = new LinkButton();
                btn2.ID = "btnExchange" + j;
                btn2.Command += new CommandEventHandler(this.btn_Command);
                btn2.CommandArgument = reader["Id"].ToString();
                btn2.CssClass = "btn btn-info btn-block";
                btn2.Text = "<span class=\"glyphicon glyphicon-transfer\"></span> Exchange";



                DropDownList ddl = new DropDownList();

                td4.Controls.Add(btn);
                td4.Controls.Add(btn2);
                if (!reader["BookSellerUser"].ToString().Equals(Session["New"].ToString()))
                {
                    btn.CssClass += " disabled";
                    btn2.CssClass += " disabled";
                    Label cantBuyLabel = new Label();
                    cantBuyLabel.Text = "You can't buy this book because you are it's seller";
                    td4.Controls.Add(cantBuyLabel);
                }
                else
                {
                    string[] items = exchange.Split(',');
                    for (int i = 0; i < items.Length; i++)
                        ddl.Items.Add(items[i]);
                    ddl.CssClass = "dropdownz";
                    td4.Controls.Add(ddl);
                }
              
                //td4.Text = "<asp:Button runat=\"server\" id=\"btn" + j + "\" class=\"btn btn-danger\" CommandName=\"addItemToCart\" CommandArgument=\"" + reader["Id"].ToString() + "\" OnCommand=\"btn_Click\"><span class=\"glyphicon glyphicon-shopping-cart\"></span></asp:Button>";
                //    td4.CssClass = "col-sm-2";
                tr.Cells.Add(td4);
                //TODO podeli gi so split za Tradeable, i da se naprai formata za 
                //dodavanje na novi itemi.
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

    private void btn_Command(object sender, CommandEventArgs e)
    {
        tbError.Text = e.CommandArgument.ToString();
    }

    protected void lnkButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
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
        Response.Redirect("AddBook.aspx");
    }
}