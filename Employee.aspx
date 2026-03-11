<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="WebApplication3.Employee" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }

        .page-wrapper {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .page-header h2 {
            margin: 0;
            font-size: 32px;
            color: #2d3748;
        }

        .page-header p {
            margin-top: 8px;
            color: #6b7280;
            font-size: 15px;
        }

        .card {
            background: #ffffff;
            border-radius: 18px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            padding: 24px;
            margin-bottom: 25px;
        }

        .section-title {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 18px;
            color: #1f2937;
        }

        .status-message {
            display: block;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 7px;
            font-weight: 600;
            color: #374151;
            font-size: 14px;
        }

        .input-box {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }

        .input-box:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.15);
        }

        .button-row {
            margin-top: 20px;
        }

        .btn-primary {
            background: #667eea;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: #5568d8;
        }

        .grid-container {
            overflow-x: auto;
        }

        .grid-container table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        .grid-container th {
            background: #667eea;
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }

        .grid-container td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 14px;
        }

        .grid-container tr:nth-child(even) {
            background: #f9fafb;
        }

        .grid-container tr:hover {
            background: #eef2ff;
        }

        .grid-container a,
        .grid-container input[type="submit"] {
            color: #2563eb;
            font-weight: 600;
            text-decoration: none;
            margin-right: 8px;
            background: none;
            border: none;
            cursor: pointer;
        }

        .grid-container a:hover,
        .grid-container input[type="submit"]:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .page-wrapper {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">

            <div class="page-header">
                <h2>Employee / User Management</h2>
                <p>Manage employee records and add new users to the system</p>
            </div>

            <div class="card">
                <asp:Label ID="lblStatus" runat="server" CssClass="status-message" ForeColor="Red"></asp:Label>

                <div class="section-title">Existing Users</div>

                <div class="grid-container">
                    <asp:GridView ID="gvUsers" runat="server"
                        AutoGenerateColumns="false"
                        DataKeyNames="Id"
                        OnRowEditing="gvUsers_RowEditing"
                        OnRowCancelingEdit="gvUsers_RowCancelingEdit"
                        OnRowUpdating="gvUsers_RowUpdating"
                        OnRowDeleting="gvUsers_RowDeleting"
                        BorderWidth="0"
                        GridLines="None"
                        CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" Visible="false" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="Contact" HeaderText="Contact" />
                            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="card">
                <div class="section-title">Add New User</div>

                <div class="form-grid">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtNewUsername" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Retype Password</label>
                        <asp:TextBox ID="txtNewRetype" runat="server" TextMode="Password" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtNewName" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="txtNewAddress" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Contact</label>
                        <asp:TextBox ID="txtNewContact" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>
                </div>

                <div class="button-row">
                    <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn-primary" OnClick="btnAddUser_Click" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>