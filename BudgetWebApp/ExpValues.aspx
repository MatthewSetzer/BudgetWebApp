<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpValues.aspx.cs" Inherits="BudgetWebApp.WebForm2" %>

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
    <p></p>
    <p style="text-align: center">
        <asp:Label ID="lblError" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
    </p>
    <table class="nav-justified" style="height: 450px">
        <tr>
            <td style="width: 665px">&nbsp;</td>
            <td style="width: 370px">&nbsp;</td>
            <td style="width: 997px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 665px; height: 119px;">
                <h4>Please enter the following information.</h4>
                <hr />
            </td>
            <td style="width: 370px; height: 119px;"></td>
            <td style="width: 997px; height: 119px;">
                <h4>Please indicate if you are renting or buying a property and/or buying a vehicle.</h4>
                <hr />
                <br />
                &nbsp;<asp:CheckBox ID="cbRenting" runat="server" AutoPostBack="True" OnCheckedChanged="cbRenting_CheckedChanged" Text="Renting" />
                &nbsp;&nbsp; &nbsp;<asp:CheckBox ID="cbBuying" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="cbBuying_CheckedChanged" Text="Buying" />
                &nbsp;&nbsp;
                <asp:CheckBox ID="cbVehicleBuy" runat="server" Text="I am buying a vehicle" AutoPostBack="True" OnCheckedChanged="cbVehicleBuy_CheckedChanged" />
                <br />
            </td>
            <td style="height: 119px"></td>
        </tr>
        <tr>
            <td style="height: 42px; width: 665px;">Gross monthly income:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtGMI" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ControlToValidate="txtGMI" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="height: 42px; width: 997px;">
                <asp:Label runat="server" ID="lblRentPurchase">Purchase price of property:</asp:Label></td>
            <td style="height: 42px">
                <asp:Label ID="lblR2" runat="server" Text="R"></asp:Label>
                &nbsp;<asp:TextBox ID="txtRentPurchase" runat="server" Width="120px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    ControlToValidate="txtRentPurchase" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 665px;">Estimated monthly tax deduction: </td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtGMItax" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                    ControlToValidate="txtGMItax" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="height: 42px; width: 997px;">
                <asp:Label runat="server" ID="lblDeposit">Total deposit</asp:Label></td>
            <td style="height: 42px">
                <asp:Label ID="lblR3" runat="server" Text="R"></asp:Label>
                &nbsp;<asp:TextBox ID="txtDeposit" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                    ControlToValidate="txtDeposit" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;"></td>
            <td style="width: 370px; height: 42px;"></td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblInterest">Interest rate[%]:</asp:Label></td>
            <td style="height: 42px">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPropertyInterest" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                    ControlToValidate="txtPropertyInterest" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">&nbsp;</td>
            <td style="width: 370px; height: 42px;">&nbsp;</td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblMonthlyRep">Terms[months]:</asp:Label></td>
            <td style="height: 42px">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtMonthlyRep" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                    ControlToValidate="txtMonthlyRep" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 665px;"></td>
            <td style="width: 370px; height: 42px;"></td>
            <td style="height: 42px; width: 997px;">&nbsp;</td>
            <td style="height: 42px">
                <asp:Label ID="lblError2" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 665px">
                <h4>Please enter your monthly expenditure for the following.</h4>
                <hr />
            </td>
            <td style="width: 370px">&nbsp;</td>
            <td style="width: 997px">
                <asp:Label runat="server" ID="lblVehicleInstructions" Visible="False"><h4>Enter the following vehicle information.</h4></asp:Label><hr />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 42px; width: 665px;">Groceries:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtGroceries" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                    ControlToValidate="txtGroceries" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="height: 42px; width: 997px;">
                <asp:Label runat="server" ID="lblMakeModel" Visible="False">Make and model</asp:Label></td>
            <td style="height: 42px">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtMakeModel" runat="server" Visible="False" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">Water and lights:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtWaterLights" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                    ControlToValidate="txtWaterLights" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblPriceVehicle" Visible="False">Purchase price of vehicle:</asp:Label></td>
            <td style="height: 42px">
                <asp:Label ID="lblR4" runat="server" Text="R" Visible="False"></asp:Label>
                &nbsp;<asp:TextBox ID="txtPriceVehicle" runat="server" Visible="False" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9"
                    ControlToValidate="txtPriceVehicle" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">Travel costs:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtTravelCosts" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10"
                    ControlToValidate="txtTravelCosts" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblVehicleDeposit" Visible="False">Total deposit:</asp:Label></td>
            <td style="height: 42px">
                <asp:Label ID="lblR5" runat="server" Text="R" Visible="False"></asp:Label>
                &nbsp;<asp:TextBox ID="txtVehicleDeposit" runat="server" Visible="False" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11"
                    ControlToValidate="txtVehicleDeposit" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">Cellphone/telephone:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtCellular" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12"
                    ControlToValidate="txtCellular" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblVehicleIntrest" Visible="False">Interest rate[%]:</asp:Label></td>
            <td style="height: 42px">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtVehicleInterest" runat="server" Visible="False" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13"
                    ControlToValidate="txtVehicleInterest" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">Other:</td>
            <td style="width: 370px; height: 42px;">R
                <asp:TextBox ID="txtOther" runat="server" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14"
                    ControlToValidate="txtOther" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
            <td style="width: 997px; height: 42px;">
                <asp:Label runat="server" ID="lblInsVehicle" Visible="False">Estimated insurance premium:</asp:Label></td>
            <td style="height: 42px">
                <asp:Label ID="lblR6" runat="server" Text="R" Visible="False"></asp:Label>
                &nbsp;<asp:TextBox ID="txtInsVehicle" runat="server" Visible="False" Width="120px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15"
                    ControlToValidate="txtInsVehicle" runat="server"
                    ErrorMessage="Only Numbers allowed"
                    ValidationExpression="\d+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 665px; height: 42px;">&nbsp;</td>
            <td style="width: 370px; height: 42px;"></td>
            <td style="width: 997px; height: 42px;"></td>
            <td style="height: 42px">
                <h4>
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="159px" OnClick="btnSave_Click" Height="35px" /></h4>
            </td>
        </tr>
    </table>
</asp:Content>
