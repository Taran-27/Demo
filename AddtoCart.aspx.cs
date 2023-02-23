using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Demo
{
    public partial class AddtoCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                if (Session["buyitems"] == null)
                {
                    Button1.Enabled = false;
                    Button2.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                    Button2.Enabled = true;
                }

                //Adding product to grid view
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        SqlConnection conn = new SqlConnection(@"Data Source=INBAWN166924\TARANSERVER;Initial Catalog=RecordDB;Integrated Security=True");

                        SqlDataAdapter da = new SqlDataAdapter("select * from Product1 where ProductId=" + Request.QueryString["id"], conn);
                        DataSet ds = new DataSet(); //temp datas store aagi irukum,the data which is been selected 
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString(); //dr-datarow, ds-dataset
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                         
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt; //upla value dataset la store aagi irukum adha grid view la kamika indha gridview code, for displaying data in gridview we have to write datasource
                        GridView1.DataBind();//datasource provide panna odanae we should bind the data
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                       

                        Response.Redirect("AddtoCart.aspx");

                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr; //serial name srno
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection scon = new SqlConnection(@"Data Source=INBAWN166924\TARANSERVER;Initial Catalog=RecordDB;Integrated Security=True");

                        SqlDataAdapter da = new SqlDataAdapter("select * from Product1 where ProductId=" + Request.QueryString["id"], scon);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        ////GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        //GridView1.FooterRow.Cells[5].Text = TotalPrice.ToString();
                        ////GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        //GridView1.FooterRow.Cells[6].Text = "helloo";
                        Response.Redirect("AddtoCart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }
                }

            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = OrderDate;
            orderid();

        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                int price = Convert.ToInt32(dt.Rows[i]["pprice"]);
                int qu= Convert.ToInt32(dt.Rows[i]["pquantity"]);
                //totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["pprice"].ToString());
                totalprice = totalprice + price * qu;


                i = i + 1;

            }
            return totalprice;
        }
        public void orderid()
        {
            String alpha = "abCdEfghIJklMNopqrStuvwxYZ123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }

            }
            // setting sr.no after deleting the cart
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;
            Response.Redirect("AddtoCart.aspx");
        }

        public void BuyNow(object sender, EventArgs e)
        {
            //Response.Redirect("PlaceOrder.aspx");

            Response.Redirect("testPay.html?id=" + grandtotal());
            //window.location= "testPay.html?amount_id=" + grandtotal();


        }

        protected void AdminEdit(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        
    }
}
