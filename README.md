# Employee Management System (ASP.NET Web Forms)

**Working Demo Video - https://mail.google.com/mail/u/0?ui=2&ik=bc5962e832&attid=0.1&permmsgid=msg-a:r-1287761923240297660&view=att&disp=safe&realattid=f_mmla38vn0&zw
**SSMS - https://mail.google.com/mail/u/0?ui=2&ik=bc5962e832&attid=0.2&permmsgid=msg-a:r-1287761923240297660&view=att&disp=safe&realattid=f_mmlao4au1&zw

A simple **ASP.NET WebForms application using SQL Server** that provides:

- User Login
- Password Reset
- Employee/User Management
- Add / Edit / Delete users
- SQL Server database integration

---

# Tech Stack

| Technology | Usage |
|------------|------|
| ASP.NET WebForms | Frontend + Backend |
| C# | Server-side logic |
| .NET Framework 4.8 | Application framework |
| SQL Server | Database |
| ADO.NET | Database connection |
| Visual Studio | Development IDE |
| SSMS | Database management |

---

# Project Structure

```
WebApplication3
│
├── Login.aspx
├── Login.aspx.cs
├── Login.aspx.designer.cs
│
├── ResetPassword.aspx
├── ResetPassword.aspx.cs
├── ResetPassword.aspx.designer.cs
│
├── Employee.aspx
├── Employee.aspx.cs
├── Employee.aspx.designer.cs
│
├── Web.config
├── Global.asax
├── packages.config
├── favicon.ico
└── WebApplication3.csproj
```

---

# Features

✔ User Login  
✔ Password Validation  
✔ Reset Password  
✔ Employee Management  
✔ Add New User  
✔ Edit User  
✔ Delete User  
✔ SQL Server Integration  

---

# Database Setup

Open **SQL Server Management Studio (SSMS)** and run the following script.

## 1️⃣ Create Database

```sql
CREATE DATABASE EmployeeDB;
GO
```

---

## 2️⃣ Use Database

```sql
USE EmployeeDB;
GO
```

---

## 3️⃣ Create Table

```sql
CREATE TABLE Users
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Name NVARCHAR(100),
    Address NVARCHAR(200),
    Contact NVARCHAR(50)
);
GO
```

---

## 4️⃣ Insert Default Admin User

```sql
INSERT INTO Users (Username, Password, Name, Address, Contact)
VALUES
('admin','Admin@123','Admin User','Sample Address','9999999999');
GO
```

---

# Database Information

| Field | Type |
|------|------|
| Id | INT |
| Username | NVARCHAR(50) |
| Password | NVARCHAR(100) |
| Name | NVARCHAR(100) |
| Address | NVARCHAR(200) |
| Contact | NVARCHAR(50) |

---

# Connection String Setup

Open **Web.config** and add/update:

```xml
<connectionStrings>
  <add name="dbcon"
       connectionString="Data Source=AASHII\SQLEXPRESS;Initial Catalog=EmployeeDB;Integrated Security=True"
       providerName="System.Data.SqlClient"/>
</connectionStrings>
```

### Example SQL Server Instances

```
Data Source=.\SQLEXPRESS
```

or

```
Data Source=localhost
```

---

# How to Run the Project

## Step 1 — Clone Repository

```bash
git clone https://github.com/aashiv10/LoginPage.git
```

---

## Step 2 — Open Project

Open in **Visual Studio**

Open file:

```
WebApplication3.csproj
```

---

## Step 3 — Restore Packages

If Visual Studio asks:

```
Restore NuGet Packages
```

Click **Restore**.

---

## Step 4 — Setup Database

Open **SSMS** and run the SQL scripts above.

---

## Step 5 — Update Connection String

Open:

```
Web.config
```

Update your SQL Server instance.

---

## Step 6 — Set Start Page

In **Solution Explorer**

Right click:

```
Login.aspx
```

Select:

```
Set As Start Page
```

---

## Step 7 — Run the Project

Press:

```
F5
```

or click **Start Debugging**.

---

# Default Login Credentials

| Field | Value |
|------|------|
| Username | admin |
| Password | Admin@123 |
| Retype Password | Admin@123 |

---

# Application Flow

```
Login.aspx
   ↓
Employee.aspx
```

Forgot password flow:

```
Login.aspx
   ↓
ResetPassword.aspx
```

---

# Password Rules

Password must contain:

- 1 uppercase letter
- 1 lowercase letter
- 1 number
- 1 special character
- Minimum 6 characters

Regex used:

```csharp
@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$"
```

---

# Common Errors and Fixes

## Error

```
Could not load type WebApplication.Login
```

### Fix

Namespace mismatch.

Ensure all files use the same namespace.

Example:

```
namespace WebApplication3
```

and

```
Inherits="WebApplication3.Login"
```

---

## Error

```
ConnectionStrings["dbcon"] is null
```

### Fix

Add connection string in **Web.config**.

---

## Error

```
SQL connection failed
```

### Fix

Update SQL Server instance name.

Example:

```
Data Source=.\SQLEXPRESS
```

---

## Error

```
Event handler not found
```

Example:

```
btnLogin_Click
```

### Fix

Ensure the method exists in:

```
Login.aspx.cs
```

---

# Git Ignore (Recommended)

Create a `.gitignore` file:

```
.vs/
bin/
obj/
packages/
*.user
*.suo
```

---

# Future Improvements

- Password hashing
- Logout system
- Session authentication
- Search users
- Pagination
- Bootstrap UI
- Role-based authentication

---

# Author

**Aashi Vidyarthi**

GitHub Repository: https://github.com/aashiv10/LoginPage
