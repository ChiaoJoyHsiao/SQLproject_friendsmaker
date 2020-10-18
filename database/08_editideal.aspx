<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_editideal.aspx.cs" Inherits="eighthpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="reset.css" rel="stylesheet" />
     <link href="background.css" rel="stylesheet" />
    <style>
        .wrap{
            display:flex;
            width:100%;
            text-align:center;
        }
        .wrap .item{
            margin:50px auto 0;
 
        }
        nav a {
            color: inherit; /* 移除超連結顏色 */
            display: block; /* 讓 <a> 填滿 <li> */
            font-size: 1.2rem;
            padding: 10px;
            text-decoration: none;  /* 移除超連結底線 */
          }
        nav li:hover {
            background-color: rgb(115, 115, 115);
            color: white;
          }

        .flex-nav {
            display: flex;
            justify-content: center;
           }

        .inline-block-nav {
            text-align: center;
            font-size: 0;   /* 移除 <li> 之間的空隙 */
        }

        .inline-block-nav > li {
                display: inline-block;
            }
        .title{
            margin:50px 0;
            font-size:36px;
            font-weight:bold;
            background-color:lightsteelblue;
            text-align:center;
            width:400px;
            height:100px;
        }
            .item{
                color:darkblue;
                font-weight:bold;
                font-family:'Microsoft JhengHei';
                margin:10px 0;
            }
            .item .remind{
                color:cornflowerblue;
                margin:10px 0;
            }
             .button{
            margin:10px 0;
        }
        .radio {
            display:inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <center>
               <nav>
                <ul class="inline-block-nav">
                <li><a href ="06_friendlist.aspx"><img src="photo/chat.png" width="70" height="70" >好友名單</img></a></li>
                <li><a href ="05_mainPage.aspx"><img src="photo/love.png" width="70" height="70" >撩聊吧</img></a></li>
                <li><a href ="07_editmypage.aspx"><img src="photo/person.png" width="70" height="70" >修改個人資料</img></a></li>
                <li><a href ="08_editideal.aspx"><img src="photo/person.png" width="70" height="70" >修改理想型資料</img></a></li>
                                        <li><a href ="01_welcome.aspx">
                        <asp:ImageButton ID="logout" runat="server" Height="66px" ImageUrl="photo/logout.png" OnClick="logout_Click" Width="83px" />登出
                        </a></li>
                </ul>
                   <p>
                       &nbsp;</p>
                   <p>
                       &nbsp;</p>
                   <p>
                       &nbsp;</p>
               </nav>
           </center>
        </div>
            
                <div class="item">
                    <center>
               <asp:Label ID="account" runat="server" Text=""></asp:Label><br /><br />
                <asp:Label ID="title" runat="server" Text="修改理想型資料" Font-Bold="True" Font-Size="26pt" ForeColor="#000099"></asp:Label>

                        <br />


                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT [idealage], [idealconstellation], [idealdegree], [idealtrait], [idealheight], [idealweight], [idealgender], [account] FROM [s1071742_TALKBOOK_Member]" UpdateCommand="UPDATE [s1071742_TALKBOOK_Member] SET [idealage] = @idealage, [idealconstellation] = @idealconstellation, [idealdegree] = @idealdegree, [idealtrait] = @idealtrait, [idealheight] = @idealheight, [idealweight] = @idealweight, [idealgender] = @idealgender WHERE [account] = @account" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Member] WHERE [account] = @account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Member] ([idealage], [idealconstellation], [idealdegree], [idealtrait], [idealheight], [idealweight], [idealgender], [account]) VALUES (@idealage, @idealconstellation, @idealdegree, @idealtrait, @idealheight, @idealweight, @idealgender, @account)">
                            <DeleteParameters>
                                <asp:Parameter Name="account" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="idealage" Type="String" />
                                <asp:Parameter Name="idealconstellation" Type="String" />
                                <asp:Parameter Name="idealdegree" Type="String" />
                                <asp:Parameter Name="idealtrait" Type="String" />
                                <asp:Parameter Name="idealheight" Type="Int32" />
                                <asp:Parameter Name="idealweight" Type="Int32" />
                                <asp:Parameter Name="idealgender" Type="String" />
                                <asp:Parameter Name="account" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="idelAge" Name="idealage" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="con" Name="idealconstellation" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="degree" Name="idealdegree" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="personal" Name="idealtrait" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="height" Name="idealheight" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="weight" Name="idealweight" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="gender" Name="idealgender" PropertyName="SelectedValue" Type="String" />
                                <asp:SessionParameter Name="account" SessionField="user" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />

                    </center>
                </div>
                <div class="item">
                    <center>
          <div class="item">
              性別：<asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                  <asp:ListItem>男</asp:ListItem>
                  <asp:ListItem>女</asp:ListItem>
              </asp:RadioButtonList>       </div>
          <div class="item">
              年齡：<asp:DropDownList ID="idelAge" runat="server">
                  <asp:ListItem>18 - 25</asp:ListItem>
                  <asp:ListItem>26 - 30</asp:ListItem>
                  <asp:ListItem>31 - 40</asp:ListItem>
                  <asp:ListItem>41 - 50</asp:ListItem>
                  <asp:ListItem>51 - 60</asp:ListItem>
                  <asp:ListItem>61 - 70</asp:ListItem>
                  <asp:ListItem>71 - 80</asp:ListItem>
                  <asp:ListItem>81 - 90</asp:ListItem>
                  <asp:ListItem>91 - 100</asp:ListItem>
              </asp:DropDownList>
          </div>
          <div class="item">
              星座：<asp:DropDownList ID="con" runat="server">
                  <asp:ListItem>摩羯座</asp:ListItem>
                  <asp:ListItem>水瓶座</asp:ListItem>
                  <asp:ListItem>雙魚座</asp:ListItem>
                  <asp:ListItem>牡羊座</asp:ListItem>
                  <asp:ListItem>金牛座</asp:ListItem>
                  <asp:ListItem>雙子座</asp:ListItem>
                  <asp:ListItem>巨蟹座</asp:ListItem>
                  <asp:ListItem>獅子座</asp:ListItem>
                  <asp:ListItem>處女座</asp:ListItem>
                  <asp:ListItem>天秤座</asp:ListItem>
                  <asp:ListItem>天蠍座</asp:ListItem>
                  <asp:ListItem>射手座</asp:ListItem>
              </asp:DropDownList>
          </div>
          <div class="item">
              人格特質：<asp:TextBox ID="personal" runat="server"></asp:TextBox>
          </div>
          <div class="item">
              身高：<asp:TextBox ID="height" runat="server"></asp:TextBox>
              <br /><br />
              體重：<asp:TextBox ID="weight" runat="server"></asp:TextBox>
          </div>
          <div class="item">
              學歷：<asp:DropDownList ID="degree" runat="server">
                    <asp:ListItem>國小</asp:ListItem>
                    <asp:ListItem>國中</asp:ListItem>
                    <asp:ListItem>高中/職</asp:ListItem>
                    <asp:ListItem>大專院校</asp:ListItem>
                    <asp:ListItem>碩士</asp:ListItem>
                    <asp:ListItem>博士</asp:ListItem>
                </asp:DropDownList>
          </div>
          <div class="item">
              喜好配對輔助：<asp:RadioButtonList ID="Like" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                  <asp:ListItem>是</asp:ListItem>
                  <asp:ListItem>否</asp:ListItem>
              </asp:RadioButtonList>
              <br />

              <div class="remind">
                  *勾選「是」我們會依據您的喜好來推薦對象給您。<br />
                  *勾選「否」我們將隨機推薦對象給您。
              </div>
          </div>
          </div>
            </center>
                <center>

                    <asp:Button ID="edit" runat="server" BackColor="#FF6666" Font-Bold="True" Font-Size="Larger" Text="立即更改" OnClick="edit_Click" />

                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </center>
    </form>
</body>
</html>
