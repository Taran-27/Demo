using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=INBAWN166924\TARANSERVER;Initial Catalog=RecordDB; Integrated Security= True;");
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "Images/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product1 values('"+TextBox1.Text+"', '"+TextBox2.Text+"', '"+TextBox3.Text+"','"+filepath+"', '"+TextBox4.Text+"')",con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx");
            }
        }
       
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(@"Data Source=INBAWN166924\TARANSERVER;Initial Catalog=RecordDB; Integrated Security= True;");
            SqlCommand cmd = new SqlCommand(@"DELETE FROM [dbo].[Product1]
            WHERE [ProductId]='" + TextBox1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("data deleted successfully");
            con.Close();
            Response.Redirect("Default.aspx");



        }
    }
}