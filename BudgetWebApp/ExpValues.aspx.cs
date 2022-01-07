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
    public partial class WebForm2 : System.Web.UI.Page
    {
        BudgetAppEntities db = new BudgetAppEntities();
        BudgetValues bve = new BudgetValues();

        //new variables for use within this form
        double vehicleMonthly;
        double propMonthly;
        double rentMonthly;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //adding the budget value to the class, adding the class to the database
            //-------------------------------------------------------------------------------------------------//

            if (checkFilled())
            {
                clearUserBudget();
                string username = (string)Session["USERNAME"];

                bve.GMI = int.Parse(txtGMI.Text.Trim());
                bve.GMItax = int.Parse(txtGMItax.Text.Trim());
                bve.GroceriesExp = int.Parse(txtGroceries.Text.Trim());
                bve.WaterLightsExp = int.Parse(txtWaterLights.Text.Trim());
                bve.TravelExp = int.Parse(txtTravelCosts.Text.Trim());
                bve.CellularExp = int.Parse(txtCellular.Text.Trim());
                bve.OtherExp = int.Parse(txtOther.Text.Trim());

                double finalBudget = bve.FinalBudget();
                double incomeLessTax = bve.IncomeLessTax();
                double monthlyExpenses = bve.MonthlyExpenses();

                BudgetValue bv = new BudgetValue();
                bv.Username = username;
                bv.IncomeLessTax = (int)incomeLessTax;
                bv.FinalBudget = (int)finalBudget;
                bv.MonthlyExpenses = (int)monthlyExpenses;

                db.BudgetValues.Add(bv);
                db.SaveChanges();

                try
                {
                    //calling the calcMonthly method and adding the values into the calculated values database
                    calcMonthly();
                    using (BudgetAppEntities db = new BudgetAppEntities())
                    {
                        bv = db.BudgetValues.Where(user => user.Username == username).First();
                        bv.HomeLoanExpense = (int?)propMonthly;
                        bv.VehicleExpense = (int?)vehicleMonthly;
                        bv.RentExpense = (int?)rentMonthly;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    lblError.Visible = true;
                    lblError.Text = "Please fill in all fields";
                    return;
                }

                Response.Redirect("AvailableIncome.aspx");
            }
        }

        //calcMonthly method to calculate the users expenses and monthly repayments based on their values
        //-------------------------------------------------------------------------------------------------//
        private void calcMonthly()
        {
            if (cbVehicleBuy.Checked == true)
            {
                //adding new object to ExpenseVehicle and abstract method to calc the repayment
                Expense vehicleExpense = new ExpenseVehicle
                {
                    MakeModel = txtMakeModel.Text.Trim(),
                    EstimatedInsurance = double.Parse(txtInsVehicle.Text),
                    PurchasePrice = double.Parse(txtPriceVehicle.Text),
                    Deposit = double.Parse(txtVehicleDeposit.Text),
                    InterestRate = double.Parse(txtVehicleInterest.Text),
                    MonthsRepayment = 60,
                };

                vehicleMonthly = vehicleExpense.CalcRepayment();
            }
            else
            {
                vehicleMonthly = 0;
            }
            //-------------------------------------------------------------------------------------------------//

            if (cbBuying.Checked == true)
            {
                cbRenting.Checked = false;

                //Input validation to check if monthly repayments are between 240 and 360
                if (double.Parse(txtMonthlyRep.Text) >= 240 && double.Parse(txtMonthlyRep.Text) <= 360)
                {
                    //adding new object to ExpenseHomeLoan and abstract method to calc the repayment
                    Expense propExpense = new ExpenseHomeLoan
                    {
                        PurchasePrice = double.Parse(txtRentPurchase.Text),
                        Deposit = double.Parse(txtDeposit.Text),
                        InterestRate = double.Parse(txtPropertyInterest.Text),
                        MonthsRepayment = double.Parse(txtMonthlyRep.Text)
                    };
                    propMonthly = propExpense.CalcRepayment();

                    // checking is the repayment is more than a third of the users income
                    if (propExpense.CalcRepayment() > (bve.FinalBudget() / 3))
                    {
                        lblError.Visible = true;
                        lblError.Text = "Home loan approval unlikely with current budget and home price";
                    }
                    else
                    {
                        propMonthly = 0;
                    }
                }
                else
                {
                    lblError2.Visible = true;
                    lblError2.Text = "Monthly repayment must be between 240 and 360 months";
                    string nullString = "";
                    propMonthly = double.Parse(nullString);
                }

            }
            //-------------------------------------------------------------------------------------------------//

            if (cbRenting.Checked == true)
            {
                Rent rentExpense = new Rent
                {
                    RentalAmount = double.Parse(txtRentPurchase.Text)
                };

                rentMonthly = rentExpense.RentalAmount;
            }
            else
            {
                rentMonthly = 0;
            }
        }

        //bool method to check if all the fields are filled
        //-------------------------------------------------------------------------------------------------//

        private bool checkFilled()
        {
            if (string.IsNullOrWhiteSpace(txtGMI.Text) || string.IsNullOrWhiteSpace(txtGMItax.Text) ||
                string.IsNullOrWhiteSpace(txtGroceries.Text) || string.IsNullOrWhiteSpace(txtWaterLights.Text) ||
                string.IsNullOrWhiteSpace(txtTravelCosts.Text) || string.IsNullOrWhiteSpace(txtCellular.Text) || string.IsNullOrWhiteSpace(txtOther.Text))
            {
                lblError.Visible = true;
                lblError.Text = "Please fill in all fields";
                return false;
            }
            else
            {
                return true;
            }
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
                    var user = new BudgetValue { Username = username };
                    db.BudgetValues.Attach(user);
                    db.BudgetValues.Remove(user);
                    db.SaveChanges();
                }
            }
            catch
            {

            }

        }

        //hiding and showing buttons based on checkbox checked changed
        //-------------------------------------------------------------------------------------------------//
        protected void cbVehicleBuy_CheckedChanged(object sender, EventArgs e)
        {
            if (cbVehicleBuy.Checked == true)
            {
                lblVehicleInstructions.Visible = true; lblMakeModel.Visible = true; txtMakeModel.Visible = true;
                lblPriceVehicle.Visible = true; txtPriceVehicle.Visible = true; lblR4.Visible = true;
                lblVehicleDeposit.Visible = true; txtVehicleDeposit.Visible = true; lblR5.Visible = true;
                lblVehicleIntrest.Visible = true; txtVehicleInterest.Visible = true;
                lblInsVehicle.Visible = true; txtInsVehicle.Visible = true; lblR6.Visible = true;
            }
            else if (cbVehicleBuy.Checked == false)
            {
                lblVehicleInstructions.Visible = false; lblMakeModel.Visible = false; txtMakeModel.Visible = false;
                lblPriceVehicle.Visible = false; txtPriceVehicle.Visible = false; lblR4.Visible = false;
                lblVehicleDeposit.Visible = false; txtVehicleDeposit.Visible = false; lblR5.Visible = false;
                lblVehicleIntrest.Visible = false; txtVehicleInterest.Visible = false;
                lblInsVehicle.Visible = false; txtInsVehicle.Visible = false; lblR6.Visible = false;
            }
        }

        protected void cbBuying_CheckedChanged(object sender, EventArgs e)
        {
            if (cbBuying.Checked == true)
            {
                cbRenting.Checked = false;
                lblRentPurchase.Text = "Purchase price of property:"; lblR3.Visible = true;
                lblDeposit.Visible = true; txtDeposit.Visible = true;
                lblInterest.Visible = true; txtPropertyInterest.Visible = true;
                lblMonthlyRep.Visible = true; txtMonthlyRep.Visible = true;
            }
        }

        protected void cbRenting_CheckedChanged(object sender, EventArgs e)
        {
            if (cbRenting.Checked == true)
            {
                cbBuying.Checked = false;
                lblRentPurchase.Text = "Monthly rental amount:"; lblR3.Visible = false;
                lblDeposit.Visible = false; txtDeposit.Visible = false;
                lblInterest.Visible = false; txtPropertyInterest.Visible = false;
                lblMonthlyRep.Visible = false; txtMonthlyRep.Visible = false;
            }
        }

    }
}