using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Demo
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = INBAWN166924\TARANSERVER; Initial Catalog = RecordDB; Integrated Security = True;");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from AdminLogin where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Response.Redirect("AddProduct.aspx");
            }
            else
            {
                Label1.Text = "Login Unsuccessfull!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}