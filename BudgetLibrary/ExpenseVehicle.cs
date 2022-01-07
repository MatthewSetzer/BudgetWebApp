using System;
using System.Collections.Generic;
using System.Text;

namespace BudgetLibrary
{
    //ExpenseVehicle that inherits from Expense with MakeModel and EstimatedInsurance variables

    public class ExpenseVehicle : Expense
    {
        public string MakeModel { get; set; }

        public double EstimatedInsurance { get; set; }


        //override method to return monthly car repayment
        public override double CalcRepayment()
        {
            double value = (PurchasePrice - Deposit) * (1 + (InterestRate / 100) * (MonthsRepayment / 12));
            return value / MonthsRepayment + EstimatedInsurance;
        }
    }
}
