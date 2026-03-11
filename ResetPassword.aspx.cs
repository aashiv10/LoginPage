using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;

namespace WebApplication3
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            string pass = txtNewPass.Text.Trim();
            string confirm = txtConfirm.Text.Trim();

            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "";

            if (string.IsNullOrWhiteSpace(user) ||
                string.IsNullOrWhiteSpace(pass) ||
                string.IsNullOrWhiteSpace(confirm))
            {
                lblMsg.Text = "Please fill all fields.";
                return;
            }

            if (pass != confirm)
            {
                lblMsg.Text = "Passwords do not match.";
                return;
            }

            if (!Regex.IsMatch(pass, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$"))
            {
                lblMsg.Text = "Password must contain uppercase, lowercase, number and special character.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "UPDATE Users SET Password=@p WHERE Username=@u";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@p", pass);
                cmd.Parameters.AddWithValue("@u", user);

                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Password reset successful.";
                }
                else
                {
                    lblMsg.Text = "Username not found.";
                }
            }
        }
    }
}