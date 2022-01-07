using BudgetWebApp.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BudgetWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BudgetValue bv;
        BudgetSaving bs;

        protected void Page_Load(object sender, EventArgs e)
        {
            setValues();
        }

        //Method to set the values from the database into the appropriate fields
        //-------------------------------------------------------------------------------------------------//
        public void setValues()
        {

            using (BudgetAppEntities db = new BudgetAppEntities())
            {
                string username = (string)Session["USERNAME"];

                try
                {
                    bv = db.BudgetValues.Where(user => user.Username == username).First();
                }
                catch
                {
                    Response.Redirect("ExpValues.aspx");
                }

                try
                {
                    bs = db.BudgetSavings.Where(user => user.Username == username).First();
                    txtSavingsPayment.Text = bs.MonthlySavings.ToString();
                }
                catch
                {
                    txtSavingsPayment.Text = "0";
                }

                txtIncomeLessTax.Text = bv.IncomeLessTax.ToString();
                txtCarPayment.Text = Math.Round((double)bv.VehicleExpense).ToString();
                txtMonthlyExpenses.Text = bv.MonthlyExpenses.ToString();

                if (bv.RentExpense == 0)
                {
                    lblMonthlyHomeRepayment.Text = "Monthly home repayment:";
                    txtHomePayment.Text = Math.Round((double)bv.HomeLoanExpense).ToString();
                }
                else if (bv.HomeLoanExpense == 0)
                {
                    lblMonthlyHomeRepayment.Text = "Monthly rent:";
                    txtHomePayment.Text = bv.RentExpense.ToString();
                }

                txtIncomeLeft.Text = Math.Round(((double)(bv.IncomeLessTax - bv.MonthlyExpenses - bv.RentExpense - bv.HomeLoanExpense - bv.VehicleExpense - Convert.ToDouble(txtSavingsPayment.Text)))).ToString();

                //Prompt the user to enter a new budget if they do not have enough income
                if(Convert.ToInt32(txtIncomeLeft.Text) < 0)
                {
                    lblError.Visible = true;
                    lblError.Text = "You do not have enough income for this budget, a new budget is recommended";
                }

                db.SaveChanges();
            }
        }

        //New budget on click method to take the user to the Budget Values page
        //-------------------------------------------------------------------------------------------------//
        protected void btnNewBudget_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExpValues.aspx");
        }

        //Logout button on click method to take the user back to the login
        //-------------------------------------------------------------------------------------------------//
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}