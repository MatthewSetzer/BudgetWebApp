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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Creating a new instance of the BudgetAppEntities from the DbModel

        BudgetAppEntities db = new BudgetAppEntities();

        //HashPassword method to take the inputed password and hash it for verification with the stored password

        static string HashPassword(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding uTF8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(uTF8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Username = txtUsername.Value;
            string HashedPassword = HashPassword(txtPassword.Value);

            UserCredential credential = new UserCredential();
            BudgetValue bv = new BudgetValue();

            var result = (from user in db.UserCredentials where user.Username == Username || user.Email == Username && user.Password == HashedPassword select user).FirstOrDefault();
            var resultBudget = (from user in db.BudgetValues where user.Username == Username select user).FirstOrDefault();

            if (result != null && resultBudget != null)
            {
                Session["USERNAME"] = Username;
                Response.Redirect("AvailableIncome.aspx");
            }
            else if (result != null)
            {
                Session["USERNAME"] = Username;
                Response.Redirect("ExpValues.aspx");
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Username or Password incorrect";
            }
        }

        protected void btnRegister_Click (object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }


    }
}