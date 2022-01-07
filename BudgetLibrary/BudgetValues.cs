using System;

namespace BudgetLibrary
{
    //BudgetValuesExpenses class to store the users salary, tax and general expenses

    public class BudgetValues
    {
        public int GMI { get; set; }

        public int GMItax { get; set; }

        public int GroceriesExp { get; set; }

        public int WaterLightsExp { get; set; }

        public int TravelExp { get; set; }

        public int CellularExp { get; set; }

        public int OtherExp { get; set; }


        //method to calculate the user income after deductions
        public double FinalBudget()
        {
            return GMI - (GMItax + GroceriesExp + WaterLightsExp + TravelExp + CellularExp + OtherExp);
        }

        //method to calculate income less tax
        public double IncomeLessTax()
        {
            return GMI - GMItax;
        }

        //method to calc total monthly expenses (excluding car and home payments)
        public double MonthlyExpenses()
        {
            return GroceriesExp + WaterLightsExp + TravelExp + CellularExp + OtherExp;
        }
    }
}
