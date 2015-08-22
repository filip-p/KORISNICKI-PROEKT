using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for Uslugi
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Uslugi : System.Web.Services.WebService {

    public Uslugi () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    [WebMethod(Description="This method accepts a given currency as a parameter (dollar)"+
        " and returns the value of the Book in the currency set by the user. It then connects to the Google Finance API"+
        " and returns live currencies for multiple countries")]
    public string ConvertCurrency(string currency,string amount)
    {
        WebClient web = new WebClient();
        string apiURL = String.Format("https://www.google.com/finance/converter?a={0}&from={1}&to={2}&meta={3}", amount, "USD", currency.ToUpper(), Guid.NewGuid().ToString());
        string response = web.DownloadString(apiURL);
        Regex regex = new Regex(@"(?<=bld\>)[0-9\.]+");
        string rate = regex.Match(response).Value;
        return rate;
    }
    
}
