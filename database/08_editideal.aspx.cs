using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eighthpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)//驗證成功
        {
            account.Text = Session["user"].ToString() + "你好，從這裡修改你的理想對象資料...";
        }
        else
        {
            Response.Write("<Script language='Javascript'>");
            Response.Write("alert('尚未登入，接下來將您導向首頁')");
            Response.Write("</" + "Script>");
            Response.Write("<script language=javascript>window.location.href='01_welcome.aspx'</script>");
        }
    }

    protected void edit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Update();
            Label1.Text = "更新成功";
        }
        catch
        {
            Label1.Text = "更新失敗,請重新嘗試";
        }
    }
    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("01_welcome.aspx");
    }
}