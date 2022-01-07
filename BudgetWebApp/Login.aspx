<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BudgetWebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
    <p></p>
    <div class="container" runat="server">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Login</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                            <div class="form-group">
                                <input type="text" runat="server" id="txtUsername" class="form-control input-sm" placeholder="Username or Email" />
                            </div>
                            <div class="form-group">
                                <input type="password" runat="server" id="txtPassword" class="form-control input-sm" placeholder="Password" />
                            </div>

                            <asp:Button type="submit" value="Login" Text="Login" class="btn btn-info btn-block" ID="btnLogin" runat="server" OnClick="btnLogin_Click" />
                            <hr />
                            <asp:Button type="submit" value="Login" Text="Register Account" class="btn btn-info btn-block" ID="btnRegister" runat="server" OnClick="btnRegister_Click" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="lblError" runat="server" CssClass="redalert" Text="" Visible="False"></asp:Label>
    </div>
</body>
</html>
