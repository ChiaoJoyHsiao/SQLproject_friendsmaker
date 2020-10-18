using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sixthpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["user"] != null)//驗證成功
        {
           
        }
        else
        {
            Response.Write("<Script language='Javascript'>");
            Response.Write("alert('尚未登入，接下來將您導向首頁')");
            Response.Write("</" + "Script>");
            Response.Write("<script language=javascript>window.location.href='01_welcome.aspx'</script>");
        }
    }


    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("01_welcome.aspx");
    }



    protected void delete_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
        SqlDataSource2.Delete();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        Label3.Text = gr.Cells[1].Text;
    }
}