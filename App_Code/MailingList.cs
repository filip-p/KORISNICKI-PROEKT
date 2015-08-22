using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MailingList
/// </summary>
public class MailingList
{

    public MailingList()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string AddRecipient(string recipientEmail)
    {
        WebServices.Uslugi webService = new WebServices.Uslugi();
        string result = webService.AddToMailingList(recipientEmail);
        if (result.Contains("been added"))
        {
            if (recipientNotInMailListDatabase(recipientEmail))
            {
                addRecipientToDatabase(recipientEmail, DateTime.Now.ToString());
            }
            else
            {
                result = "You are already subscribed to the mailing list";
            }
        }
        return result;

    }
    private void addRecipientToDatabase(string recipientEmail,string currentServerDate)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString;
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        command.CommandText = "INSERT INTO MailingListData (Id, email,date_registered) values (@id,@email,@date)";
        try
        {
            connection.Open();
            Guid newGUID = Guid.NewGuid();
            command.Parameters.AddWithValue("@id", newGUID.ToString());
            command.Parameters.AddWithValue("@email", recipientEmail);
            command.Parameters.AddWithValue("@date", currentServerDate);
            command.ExecuteNonQuery();
        }
        catch (Exception e)
        {
        }
        finally
        {
            connection.Close();
        }
    }

    private bool recipientNotInMailListDatabase(string recipientEmail)
    {
         SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersDBConnection"].ConnectionString);
        conn.Open();
        string checkuser = "SELECT count(*) FROM UserData where email='" + recipientEmail + "'";
        SqlCommand command = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}