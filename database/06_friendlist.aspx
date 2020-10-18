<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_friendlist.aspx.cs" Inherits="sixthpage" %>

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
                <li><a href ="07_editmypage.aspx"><img src="photo/person.png" width="70" height="70" >個人頁面</img></a></li>
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
            <div>
                <div >
                    <asp:Label ID="title" runat="server" Text="好友名單" Font-Bold="True" Font-Size="26pt" ForeColor="#000099"></asp:Label>
                
                    <br />
                    <br />
                
                </div>
                <br />
     <asp:Label ID="Label2" runat="server" Text="好友列表" Font-Bold="True" Font-Size="15pt" ForeColor="#000099"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="y_account,f_account" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="f_account" HeaderText="我的朋友" ReadOnly="True" SortExpression="f_account" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
              <center>  <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="359px" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="account" DataSourceID="SqlDataSource3" HeaderText=" 好友的詳細資訊" CssClass="QQ">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="nickname" HeaderText="暱稱" SortExpression="nickname" />
                        <asp:ImageField DataImageUrlField="photo" HeaderText="照片">
                        </asp:ImageField>
                        <asp:BoundField DataField="realname" HeaderText="名字" SortExpression="realname" />
                        <asp:BoundField DataField="bithday" HeaderText="生日" SortExpression="bithday" />
                        <asp:BoundField DataField="age" HeaderText="年紀" SortExpression="age" />
                        <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                        <asp:BoundField DataField="degree" HeaderText="學歷" SortExpression="degree" />
                        <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                        <asp:BoundField DataField="trait" HeaderText="人格特質" SortExpression="trait" />
                        <asp:BoundField DataField="hobby" HeaderText="興趣" SortExpression="hobby" />
                        <asp:BoundField DataField="height" HeaderText="身高" SortExpression="height" />
                        <asp:BoundField DataField="weight" HeaderText="體重" SortExpression="weight" />
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                </asp:DetailsView></center>
                <div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT DISTINCT *
FROM  [s1071742_TALKBOOK_Friend]
WHERE y_account=@account AND
f_account IN
(
SELECT DISTINCT y_account
FROM [s1071742_TALKBOOK_Friend]
WHERE y_account !=@account AND f_account = @account 
)
" DeleteCommand="DELETE [s1071742_TALKBOOK_Friend]
WHERE y_account = @me AND f_account = @Ideal">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="deleteFriend" Name="Ideal" PropertyName="SelectedValue" />
                            <asp:SessionParameter Name="me" SessionField="user" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="account" SessionField="user" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" DeleteCommand="DELETE [s1071742_TALKBOOK_Friend]
WHERE y_account = @Ideal AND f_account = @Me" SelectCommand="SELECT DISTINCT *
FROM  [s1071742_TALKBOOK_Friend]
WHERE y_account=@account AND
f_account IN
(
SELECT DISTINCT y_account
FROM [s1071742_TALKBOOK_Friend]
WHERE y_account !=@account AND f_account = @account 
)
">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="deleteFriend" Name="Ideal" PropertyName="SelectedValue" />
                            <asp:SessionParameter Name="Me" SessionField="user" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="account" SessionField="user" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT * FROM [s1071742_TALKBOOK_Member] WHERE ([account] = @account)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label3" Name="account" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>

                    <br />
&nbsp;               <asp:Label ID="Label1" runat="server" Text="刪除好友"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:DropDownList ID="deleteFriend" runat="server" DataSourceID="SqlDataSource1" DataTextField="f_account" DataValueField="f_account">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="delete" runat="server" Text="確認刪除" Font-Bold="True" BackColor="#FF6666" Font-Size="Medium" OnClick="delete_Click" />
                    <br />
                    <br />
                    <br />
                    <br />

                </div>
            </div>
         <div class="wrap">
        </div>
    </form>
</body>
</html>
