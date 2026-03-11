<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .login-title {
            text-align: center;
            font-size: 30px;
            font-weight: 700;
            color: #333;
            margin-bottom: 8px;
        }

        .login-subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 28px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            margin-bottom: 7px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d0d0d0;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        .form-input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102,126,234,0.15);
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-login:hover {
            background: #5568d8;
        }

        .message {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-weight: 600;
            color: red;
        }

        .links {
            margin-top: 18px;
            text-align: center;
        }

        .links a {
            text-decoration: none;
            color: #667eea;
            font-weight: 600;
            margin: 0 10px;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-title">Employee System</div>
            <div class="login-subtitle">Login to continue</div>

            <div class="form-group">
                <label class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Retype Password</label>
                <asp:TextBox ID="txtRetype" runat="server" TextMode="Password" CssClass="form-input" placeholder="Retype password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="links">
                <asp:HyperLink ID="lnkReset" runat="server" NavigateUrl="ResetPassword.aspx">Reset Password</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>