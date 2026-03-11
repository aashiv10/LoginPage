<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WebApplication3.ResetPassword" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f7fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            width: 400px;
            background: white;
            padding: 30px;
            border-radius: 18px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }

        .box h2 {
            margin-top: 0;
            text-align: center;
        }

        .input-box {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        .msg {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Reset Password</h2>

            <asp:TextBox ID="txtUser" runat="server" CssClass="input-box" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="input-box" placeholder="New Password"></asp:TextBox>
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="input-box" placeholder="Confirm Password"></asp:TextBox>

            <asp:Button ID="btnReset" runat="server" Text="Reset Password" CssClass="btn" OnClick="btnReset_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
        </div>
    </form>
</body>
</html>