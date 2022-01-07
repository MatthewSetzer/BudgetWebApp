using BudgetLibrary;
using BudgetWebApp.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BudgetWebApp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clearUserBudget();
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            //calculating the monthly savings required for the user to reach their target amount
            if (checkFilled())
            {
                ExpenseSavings expenseSavings = new ExpenseSavings();
                expenseSavings.PurchasePrice = Convert.ToDouble(txtTargetAmt.Text);
                expenseSavings.InterestRate = Convert.ToDouble(txtReturn.Text);
                expenseSavings.MonthsRepayment = Convert.ToDouble(txtSavingsTerm.Text);
                double monthlySavings = expenseSavings.CalcRepayment();

                txtMonthlySavings.Text = Math.Round(monthlySavings).ToString();
            }

        }

        //button click method to add the monthly savings amount to the users total budget
        //-------------------------------------------------------------------------------------------------//
        protected void btnAddToBudget_Click(object sender, EventArgs e)
        {

            if (txtMonthlySavings.Text != null)
            {
                string username = (string)Session["USERNAME"];
                BudgetSaving bs = new BudgetSaving();

                using (BudgetAppEntities db = new BudgetAppEntities())
                {
                    bs.Username = username;
                    bs.MonthlySavings = Convert.ToInt32(txtMonthlySavings.Text);
                    db.BudgetSavings.Add(bs);
                    db.SaveChanges();
                }
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please calculate your monthly savings first.";
            }

            Response.Redirect("AvailableIncome.aspx");
        }

        //method to clear the user current budget 
        //-------------------------------------------------------------------------------------------------//
        private void clearUserBudget()
        {
            try
            {
                string username = (string)Session["USERNAME"];
                using (BudgetAppEntities db = new BudgetAppEntities())
                {
                    var user = new BudgetSaving { Username = username };
                    db.BudgetSavings.Attach(user);
                    db.BudgetSavings.Remove(user);
                    db.SaveChanges();
                }
            }
            catch
            {

            }
        }

        //bool method to check if all the fields are filled
        //-------------------------------------------------------------------------------------------------//

        private bool checkFilled()
        {
            if (string.IsNullOrWhiteSpace(txtReturn.Text) ||
                string.IsNullOrWhiteSpace(txtSavingsTerm.Text) || string.IsNullOrWhiteSpace(txtTargetAmt.Text))
            {
                lblError.Visible = true;
                lblError.Text = "Please fill in all fields.";
                return false;
            }
            else
            {
                return true;
            }
        }

    }
}