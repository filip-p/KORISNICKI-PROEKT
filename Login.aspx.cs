using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        Response.Redirect("Login.aspx");
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
}