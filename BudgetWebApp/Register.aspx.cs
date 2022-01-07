using BudgetWebApp.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BudgetWebApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        BudgetAppEntities db = new BudgetAppEntities();

        //HashPassword method to hash the users password for entry into the database
        static string HashPassword(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding uTF8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(uTF8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        //Click event to register a user and their credentials into the database
        protected void btnRegister_Click(object sender, EventArgs e)
        {

            //input validation
            if (string.IsNullOrEmpty(txtRegUsername.Value) || string.IsNullOrEmpty(txtRegPassword.Value) || string.IsNullOrEmpty(txtRegEmail.Value))
            {
                lblError.Visible = true;
                lblError.Text = "Please fill in all fields.";
                return;

            }
            else if (txtRegPassword.Value != txtRegPasswordConfirm.Value)
            {
                lblError.Visible = true;
                lblError.Text = "Passwords do not match.";
                return;

            }
            else if(txtRegPassword.Value.Length < 6)
            {
                lblError.Visible = true;
                lblError.Text = "Password needs to be greater than 6 characters.";
                return;
            }

            string HashedPassword = HashPassword(txtRegPassword.Value);
            string Username = txtRegUsername.Value;
            string Email = txtRegEmail.Value;

            //adding the user and their values to the database
            UserCredential credential = new UserCredential();
            credential.Username = Username;
            credential.Password = HashedPassword;
            credential.Email = Email;
            db.UserCredentials.Add(credential);
            db.SaveChanges();

            Response.Redirect("Login.aspx");

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}