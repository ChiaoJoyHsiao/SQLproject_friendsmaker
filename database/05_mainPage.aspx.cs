using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class fifthpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)//驗證成功
        {
            //Label1 暱稱
            int rows = dataRows();  //隨機取亂數
            if (Session["myIdeal"] != null)//沒有按下先不要就存好myIdeal對象不要讓對象亂跑
            {
                rows = int.Parse(Session["myIdeal"].ToString());
            }             
                //這邊要做確認身分登入 核對後導向
                string cs = "Data Source=140.138.144.66;Initial Catalog=1082netdbA;User ID=1082netdbA;Password=yzuim1082netdbA";
                string sql_str = "SELECT account,[address],bithday,hobby,nickname,realname,age,degree,trait,photo,gender,weight,height FROM[s1071742_TALKBOOK_Member]WHERE account!=@account EXCEPT(SELECT account,[address],bithday,hobby,nickname,realname,age,degree,trait,photo,gender,weight,height FROM[s1071742_TALKBOOK_Member] WHERE account IN (SELECT f_account FROM [s1071742_TALKBOOK_Friend]WHERE y_account = @account AND f_account = account))";

                using (SqlConnection connection = new SqlConnection(cs))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(sql_str, connection))
                    {
                        command.Parameters.Add("@account", SqlDbType.NVarChar, 10).Value = Session["user"];
                        using (SqlDataReader dr = command.ExecuteReader())
                        {
                            try
                            {
                                if (dr.HasRows)//反正登入就確定會有資料了 讀取資料打再上面
                                {
                                    DataTable dt = new DataTable();
                                    dt.Load(dr);
                                    Session["myIdeal"] = rows.ToString(); //記住對象帳號
                                    Label1.Text = dt.Rows[rows]["nickname"].ToString();
                                    Label2.Text = dt.Rows[rows]["bithday"].ToString();
                                    Label2.Text = Convert.ToDateTime(Label2.Text).ToString("yyyy/MM/dd");
                                    Label3.Text = dt.Rows[rows]["gender"].ToString();
                                    Label4.Text = dt.Rows[rows]["address"].ToString();
                                    Label5.Text = dt.Rows[rows]["trait"].ToString();
                                    Label6.Text = dt.Rows[rows]["age"].ToString();
                                    Label7.Text = dt.Rows[rows]["height"].ToString();
                                    Label8.Text = dt.Rows[rows]["weight"].ToString();
                                    Label9.Text = dt.Rows[rows]["degree"].ToString();
                                    Label10.Text = dt.Rows[rows]["hobby"].ToString();
                                    Session["myIdealAccount"] = dt.Rows[rows]["account"].ToString();


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
        else
        {
            Response.Write("<Script language='Javascript'>");
            Response.Write("alert('尚未登入，接下來將您導向首頁')");
            Response.Write("</" + "Script>");
            Response.Write("<script language=javascript>window.location.href='01_welcome.aspx'</script>");
        }
    }

    protected void allClear_Click(object sender, EventArgs e)
    {

        try
        {
            SqlDataSource1.Insert();
            if (Session["myIdeal"] != null)//清掉對象
            {
                Session.Remove("myIdeal");
                if (Session["myIdealAccount"] != null)
                    Session.Remove("myIdealAccount");
            }
            Response.Redirect("05_mainPage.aspx");
        }
        catch
        {
            result.Text = "新增失敗，請確認網頁資料顯示正確欸！";
        }
        
    }

    protected void allClear0_Click(object sender, EventArgs e)
    {
        if (Session["myIdeal"] != null)//清掉對象
            Session.Remove("myIdeal");
        Response.Redirect("05_mainPage.aspx");

    }

    public int dataRows()//隨機亂數 先讀資料庫看他的數量有多少
    {
        int count = 0;
        if (Session["user"] != null)//驗證成功
        {
            //Label1 暱稱

            //這邊要做確認身分登入 核對後導向
            string cs = "Data Source=140.138.144.66;Initial Catalog=1082netdbA;User ID=1082netdbA;Password=yzuim1082netdbA";
            string sql_str = "SELECT account,[address],bithday,hobby,nickname,realname,age,degree,trait,photo,gender,weight,height FROM[s1071742_TALKBOOK_Member]WHERE account!=@account EXCEPT(SELECT account,[address],bithday,hobby,nickname,realname,age,degree,trait,photo,gender,weight,height FROM[s1071742_TALKBOOK_Member] WHERE account IN (SELECT f_account FROM [s1071742_TALKBOOK_Friend]WHERE y_account = @account AND f_account = account))";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(sql_str, connection))
                {
                    command.Parameters.Add("@account", SqlDbType.NVarChar, 10).Value = Session["user"];
                    using (SqlDataReader dr = command.ExecuteReader())
                    {
                        try
                        {
                            if (dr.HasRows)//帳號密碼有查詢到
                            {
                                while (dr.Read())
                                {
                                    count++;
                                }
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

        Random cRandom = new Random();
        if(count==0)
        result.Text = "恭喜此網站的用戶你都已經送出邀請了";
        return cRandom.Next(0, count);
    }


    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("01_welcome.aspx");
    }
}