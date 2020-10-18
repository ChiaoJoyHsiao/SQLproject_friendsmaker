using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class secondPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void registered_Click(object sender, EventArgs e)
    {
        Response.Redirect("03_registered.aspx");//導向註冊頁面
    }

    protected void login_Click(object sender, EventArgs e)
    {

        //這邊要做確認身分登入 核對後導向
        string cs = "Data Source=140.138.144.66;Initial Catalog=1082netdbA;User ID=1082netdbA;Password=yzuim1082netdbA";
        string sql_str = "SELECT[account], [password] FROM[s1071742_TALKBOOK_Member] WHERE(([account] = @account) AND([password] = @password))";

        using (SqlConnection connection = new SqlConnection(cs))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand(sql_str, connection))
            {
                command.Parameters.Add("@account", SqlDbType.NVarChar, 10).Value = accountBox.Text;
                command.Parameters.Add("@password", SqlDbType.NVarChar, 10).Value = passwordsBox.Text;
                using (SqlDataReader dr = command.ExecuteReader())
                {

                    try
                    {
                        if (dr.HasRows)//帳號密碼有查詢到
                        {
                            Session["user"] = accountBox.Text;//傳遞帳號變數
                            Response.Redirect("05_mainPage.aspx");//導向主畫面
                        }
                        else //登入失敗
                        {
                            Response.Write("<Script language='Javascript'>");
                            Response.Write("alert('登入失敗，請再確認帳號密碼是否正確')");
                            Response.Write("</" + "Script>");
                        }
                        connection.Close();
                    }
                    catch
                    {

                    }
                }
            }
        }
    }

    protected void allClear_Click(object sender, EventArgs e)
    {
        accountBox.Text = "";
        passwordsBox.Text = "";
        passwordAgain.Text = "";
    }
}