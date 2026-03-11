using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;

namespace WebApplication3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string retype = txtRetype.Text.Trim();

            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "";
            txtPassword.BackColor = Color.White;
            txtRetype.BackColor = Color.White;

            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(retype))
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            if (password != retype)
            {
                lblMessage.Text = "Passwords do not match!";
                txtPassword.BackColor = Color.MistyRose;
                txtRetype.BackColor = Color.MistyRose;
                return;
            }

            if (!IsValidPassword(password))
            {
                lblMessage.Text = "Password must contain uppercase, lowercase, number and special character.";
                txtPassword.BackColor = Color.MistyRose;
                txtRetype.BackColor = Color.MistyRose;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username=@u AND Password=@p";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@p", password);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    Response.Redirect("Employee.aspx");
                }
                else
                {
                    txtPassword.BackColor = Color.MistyRose;
                    txtRetype.BackColor = Color.MistyRose;
                    lblMessage.Text = "Invalid login credentials";
                }
            }
        }

        private bool IsValidPassword(string password)
        {
            return Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$");
        }
    }
}