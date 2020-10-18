using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class seventhpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)//驗證成功
        {
            account.Text = Session["user"].ToString() + "你好，從這裡修改你的資料...";
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
        if (System.IO.Path.GetExtension(FileUpload1.FileName).Substring(1) == "png" || System.IO.Path.GetExtension(FileUpload1.FileName).Substring(1) == "jpg")
        {        //做資料新增驗證
            try
            {

                string path = "photo/";
                if (FileUpload1.HasFile) //有檔案存路徑沒檔案存null
                {
                    path += FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath(path));
                    Session["photo"] = path;
                }
                else
                {
                    Session["photo"] = "null";
                }
                SqlDataSource1.Update();
                Label1.Text = "更新成功！";
            }
            catch (Exception ex)
            {
                Label1.Text = "更新失敗，請重新嘗試" + ex;
            }
        }
        else
        {
            error.Text = "請上傳jpg或png圖片檔，重新再試";
            return;
        }
 
    }
    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("01_welcome.aspx");
    }

    protected void deleteAccount_Click(object sender, EventArgs e)
    {
        submit.Visible = true;
        passwords.Visible = true;
        enterPassword.Visible = true;
        sure.Visible = true;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //比對密碼
        if (Session["user"] != null)//驗證成功
        {
            //Label1 暱稱

            //這邊要做確認身分登入 核對後導向
            string cs = "Data Source=140.138.144.66;Initial Catalog=1082netdbA;User ID=1082netdbA;Password=yzuim1082netdbA";
            string sql_str = "SELECT * FROM[s1071742_TALKBOOK_Member] WHERE account = @account";

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
                            if (dr.HasRows)//找到帳號
                            {
                                while (dr.Read())
                                {
                                    if(passwords.Text == dr["password"].ToString())
                                    {
                                        SqlDataSource2.Delete();
                                        Response.Write("<Script language='Javascript'>");
                                        Response.Write("alert('刪除成功，接下來將您導向首頁')");
                                        Response.Write("</" + "Script>");
                                        Response.Write("<script language=javascript>window.location.href='01_welcome.aspx'</script>");
                                    }
                                    else
                                    {
                                        sure.Text = "密碼輸入錯誤，請重新確認";
                                    }
                                }
                            }
                            connection.Close();
                        }
                        catch(Exception ex)
                        {
                            sure.Text = ex.ToString();
                        }
                    }
                }
            }

        }
    }
}