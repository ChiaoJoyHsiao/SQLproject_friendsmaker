using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fourth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)//驗證成功
        {

            Response.Write("<Script language='Javascript'>");
            Response.Write("alert('尚未登入，接下來將您導向首頁')");
            Response.Write("</" + "Script>");
            Response.Write("<script language=javascript>window.location.href='01_welcome.aspx'</script>");
        }
        welcome.Text = Session["user"].ToString() + "你好，接下來請設定理想對象...";

    }

    protected void allClear_Click(object sender, EventArgs e)
    {
        //全部設置為預設la
        gender.SelectedIndex = -1;
        age.SelectedIndex = 0;
        constellation.SelectedIndex = 0;
        personal.Text = "";
        height.Text = "";
        weight.Text = "";
        degree.SelectedIndex = 0;
        Like.SelectedIndex = -1;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //資料驗證登入
        try
        {
            SqlDataSource1.Update();
            Response.Redirect("05_mainPage.aspx");
        }
        catch (Exception ex)
        {
            Label1.Text = "新增資料失敗，請重新嘗試" + ex;
        }
    }
}