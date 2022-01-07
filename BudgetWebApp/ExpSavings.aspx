<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpSavings.aspx.cs" Inherits="BudgetWebApp.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <p>
        &nbsp;
    </p>
    <table class="nav-justified">
        <tr>
            <td style="width: 554px">
                <h4>Calculate your monthly savings needed in order to reach your target amount.</h4>
                <hr />
            </td>
            <td>
                <asp:Label ID="lblError" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 554px;">Target amount:</td>
            <td style="height: 42px">R
                <asp:TextBox ID="txtTargetAmt" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ControlToValidate="txtTargetAmt" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 554px;">Return earned[%]:</td>
            <td style="height: 42px">&nbsp&nbsp&nbsp
                <asp:TextBox ID="txtReturn" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    ControlToValidate="txtReturn" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 554px;">Term of savings[months]:</td>
            <td style="height: 42px">&nbsp&nbsp&nbsp
                <asp:TextBox ID="txtSavingsTerm" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                    ControlToValidate="txtSavingsTerm" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 554px;">&nbsp;</td>
            <td style="height: 42px">
               &nbsp&nbsp&nbsp <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
            </td>
        <tr>
            <td style="height: 42px; width: 554px;">
                <hr />
            </td>
            <td style="height: 42px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 42px; width: 554px;">Monthly saving required to reach goal amount:</td>
            <td style="height: 42px">R
                <asp:TextBox ID="txtMonthlySavings" runat="server" Width="120px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAddToBudget" CssClass="null" runat="server" Text="Add to budget?" OnClick="btnAddToBudget_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
