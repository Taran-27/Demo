using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo
{
    public partial class Add_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if(Session["admin"] == null)
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = INBAWN166924\TARANSERVER; Initial Catalog = RecordDB; Integrated Security = True;");
            if (imageUpload.HasFile)
            {
                string filename = imageUpload.PostedFile.FileName;
                string filepath = "Images/" + imageUpload.FileName;
                imageUpload.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product1 values('" + txtName.Text + "', '" + txtDesc.Text + "','" + filepath + "','" + txtPrice.Text + "', '" + txtQuantity.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx");
            }

        }
    }
}