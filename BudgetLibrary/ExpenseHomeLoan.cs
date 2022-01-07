using System;
using System.Collections.Generic;
using System.Text;

namespace BudgetLibrary
{
    //ExpenseHomeLoan that inherits from the abstract class Expense

    public class ExpenseHomeLoan : Expense
    {
        public override double CalcRepayment()
        {
            double value = (PurchasePrice - Deposit) * (1 + (InterestRate / 100) * (MonthsRepayment / 12));
            return value / MonthsRepayment;
        }
    }
}
