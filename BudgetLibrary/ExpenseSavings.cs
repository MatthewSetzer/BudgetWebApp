using System;
using System.Collections.Generic;
using System.Text;

namespace BudgetLibrary
{
    public class ExpenseSavings : Expense
    {
        public override double CalcRepayment()
        {
            double InitialCalc = Math.Pow((1 + (InterestRate / 100) / 12), 12*(MonthsRepayment/12)) -1;
            double RegularPayment = InitialCalc / ((InterestRate / 100)/12);
            return (PurchasePrice / RegularPayment);
        }
    }
}
