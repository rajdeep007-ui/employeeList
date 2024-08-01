using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace GridEmployee
{
    public partial class GridList : System.Web.UI.Page
    {
        private SqlCommand sqlCommand;
        private SqlDataAdapter sqlDataAdapter; // SqlDataAdapter is a bridge between Dataset and Sql Server Database to retrive data.
        DataSet dataSet; // Sayan Dataset is the local copy of your database which exists in the local system and makes the application execute faster and reliable.
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Database connection
        public void CreateConnection()
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            // Connection String from Web.config
            sqlCommand = new SqlCommand(); // 
            sqlCommand.Connection = sqlConnection;
        }
        public void OpenConnection()
        {
            sqlCommand.Connection.Open();
        }
        public void CloseConnection()
        {
            sqlCommand.Connection.Close();
        }
        public void DisposeConnection()
        {
            sqlCommand.Connection.Dispose();
        }
        // Database connection

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();

                sqlCommand.CommandText = "Sp_Gridviewemployee";
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@Event", "A");
                sqlCommand.Parameters.AddWithValue("@empcode", Convert.ToString(txtEmpcode.Value.Trim()));
                sqlCommand.Parameters.AddWithValue("@firstname", Convert.ToString(txtFirstName.Value.Trim()));
                sqlCommand.Parameters.AddWithValue("@lastname", Convert.ToString(txtLastName.Value.Trim()));
                sqlCommand.Parameters.AddWithValue("@phonenumber", Convert.ToString(txtPhoneNumber.Value.Trim()));
                sqlCommand.Parameters.AddWithValue("@emailaddress", Convert.ToString(txtEmailAddress.Value.Trim()));
                sqlCommand.Parameters.AddWithValue("@salary", Convert.ToString(txtSalary.Value.Trim()));
                int result = Convert.ToInt32(sqlCommand.ExecuteNonQuery());

                if (result == 1)
                {
                    lblMessage.Text = "Record Inserted Succssfully";
                }
                else
                {
                    lblMessage.Text = "Unable to insert Succssfully";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Something went wrong";
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }
    }
}
