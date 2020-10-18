using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class third : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void allClear_Click(object sender, EventArgs e)
    {
        //清除頁面資料
        realname.Text ="";
        account.Text = "";
        passwords.Text = "";
        age.Text = "";
        weight.Text = "";
        height.Text = "";
        degree.SelectedIndex = 0;
        hobby.Text = "";
        nickName.Text = "";
        birthday.Text = "";
        gender.SelectedValue = "boy";
        address.SelectedIndex = 0;
        person.Text = "";
    }

    protected void submit_Click(object sender, EventArgs e)
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
                SqlDataSource1.Insert();
                Label1.Text = "註冊成功";
                Session.Remove("photo");
                Session["user"] = account.Text;
                Response.Redirect("04_ideal.aspx");
            }
            catch (Exception ex)
            {
                Label1.Text = "新增資料失敗，請重新嘗試" +ex;
            }
        }
        else
        {
            error.Text = "請上傳jpg或png圖片檔，重新再試";
            allClear_Click(sender, e);
            return;
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        
    }

    protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        
    }
}