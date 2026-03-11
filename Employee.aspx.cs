using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class Employee : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Name, Username, Address, Contact FROM Users";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            lblStatus.ForeColor = System.Drawing.Color.Red;
            lblStatus.Text = "";

            if (string.IsNullOrWhiteSpace(txtNewUsername.Text) ||
                string.IsNullOrWhiteSpace(txtNewPassword.Text) ||
                string.IsNullOrWhiteSpace(txtNewRetype.Text) ||
                string.IsNullOrWhiteSpace(txtNewName.Text))
            {
                lblStatus.Text = "Please fill required fields.";
                return;
            }

            if (txtNewPassword.Text != txtNewRetype.Text)
            {
                lblStatus.Text = "Passwords do not match.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username=@u";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@u", txtNewUsername.Text.Trim());

                con.Open();
                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists > 0)
                {
                    lblStatus.Text = "Username already exists.";
                    return;
                }

                string query = @"INSERT INTO Users (Username, Password, Name, Address, Contact)
                                 VALUES (@u, @p, @n, @a, @c)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@u", txtNewUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@n", txtNewName.Text.Trim());
                cmd.Parameters.AddWithValue("@a", txtNewAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@c", txtNewContact.Text.Trim());

                cmd.ExecuteNonQuery();
            }

            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblStatus.Text = "User added successfully.";
            ClearFields();
            BindUsers();
        }

        private void ClearFields()
        {
            txtNewUsername.Text = "";
            txtNewPassword.Text = "";
            txtNewRetype.Text = "";
            txtNewName.Text = "";
            txtNewAddress.Text = "";
            txtNewContact.Text = "";
        }

        protected void gvUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            BindUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            BindUsers();
        }

        protected void gvUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            string name = ((System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string username = ((System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string address = ((System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string contact = ((System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"UPDATE Users
                                 SET Name=@n, Username=@u, Address=@a, Contact=@c
                                 WHERE Id=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@a", address);
                cmd.Parameters.AddWithValue("@c", contact);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvUsers.EditIndex = -1;
            BindUsers();
        }

        protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Users WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindUsers();
        }
    }
}