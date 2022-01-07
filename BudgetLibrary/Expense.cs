using System;
using System.Collections.Generic;
using System.Text;

namespace BudgetLibrary
{
    //abstract class Expense with an abstract method CalcRepayment

    public abstract class Expense
    {
        public double PurchasePrice { get; set; }

        public double Deposit { get; set; }

        public double InterestRate { get; set; }

        public double MonthsRepayment { get; set; }

        public abstract double CalcRepayment();
    }
}
