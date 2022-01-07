<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AvailableIncome.aspx.cs" Inherits="BudgetWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;
    </p>
    <style type="text/css">
        <!--
        input {
            color: #003068;
            text-decoration: none;
            background-color: #FFFFFF;
            border-color: #88A0C8 #88A0C8 #88A0C8;
            border-style: solid;
            border-top-width: 0px;
            border-right-width: 0px;
            border-bottom-width: 1px;
            border-left-width: 0px
        }
        -->
    </style>
    <h4>Your gross income and total income remaining after budget deductions.</h4>
    <hr />
    <p></p>
    <table class="nav-justified" style="height: 450px">
        <tr>
            <td>Income after tax</td>
            <td>R
                <asp:TextBox ID="txtIncomeLessTax" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h4><i>Deductions</i></h4>
                <hr />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>General monthly expenses:</td>
            <td>R
                <asp:TextBox ID="txtMonthlyExpenses" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMonthlyHomeRepayment" runat="server">Home repayment:</asp:Label></td>
            <td>R
                <asp:TextBox ID="txtHomePayment" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Monthly vehicle repayment:</td>
            <td>R
                <asp:TextBox ID="txtCarPayment" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Monthly savings:</td>
            <td>R
                <asp:TextBox ID="txtSavingsPayment" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td><h4>TOTAL INCOME REMAINING:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R <asp:TextBox ID="txtIncomeLeft" runat="server" ReadOnly="True" Width="120px"></asp:TextBox></h4></td>
            <td>&nbsp;<h4> &nbsp;</h4>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <asp:Label ID="lblError" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnNewBudget" runat="server" Text="New Budget" OnClick="btnNewBudget_Click" />
                <p></p>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
