﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactAbout : System.Web.UI.Page
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