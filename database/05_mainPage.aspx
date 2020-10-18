<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05_mainPage.aspx.cs" Inherits="fifthpage" %>

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

            <center> <img src="photo/loveGod_blurry.png" style="border:2px #ccc solid;padding:5px; height: 287px; width: 203px;"/><asp:Label ID="y_id" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="f_id" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="y_account,f_account" DataSourceID="SqlDataSource1" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="y_account" HeaderText="y_account" ReadOnly="True" SortExpression="y_account" />
                        <asp:BoundField DataField="f_account" HeaderText="f_account" ReadOnly="True" SortExpression="f_account" />
                        <asp:BoundField DataField="relatoinship" HeaderText="relatoinship" SortExpression="relatoinship" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </center>
        </div>
         <div class="wrap">
             <div class="item">


                 <br/> <br/>暱稱:<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                 <br />
                 <br/> <br/> 生日:<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                 <br />
                  <br/> <br/>生理性別:<asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                 <br />
                  <br/> <br/>居住地:<asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                 個人特質:<asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                <asp:Button ID="allClear" runat="server" Text="來撩聊吧!"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="allClear_Click"/>
                 <br />
                 <asp:Label ID="result" runat="server" Text=""></asp:Label>
                 <br />





             </div>
             <div class="item">
                 <br />
                 <br />
                 年齡:<asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                 身高:<asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                 體重:<asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                 學歷:<asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <br />
                 興趣:<asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                 <br />
                 <br />
                 <asp:Button ID="allClear0" runat="server" Text="先不要"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="allClear0_Click"/>
                 <br />
                                
                 
            </div>
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Friend] WHERE [y_account] = @y_account AND [f_account] = @f_account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Friend] ([y_account], [f_account], [relatoinship]) VALUES (@y_account, @f_account, @relatoinship)" SelectCommand="SELECT * FROM [s1071742_TALKBOOK_Friend]" UpdateCommand="UPDATE [s1071742_TALKBOOK_Friend] SET [relatoinship] = @relatoinship WHERE [y_account] = @y_account AND [f_account] = @f_account">
            <DeleteParameters>
                <asp:Parameter Name="y_account" Type="String" />
                <asp:Parameter Name="f_account" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="y_account" SessionField="user" Type="String" />
                <asp:SessionParameter DefaultValue="myIdeal" Name="f_account" SessionField="myIdealAccount" Type="String" />
                <asp:Parameter DefaultValue="NULL" Name="relatoinship" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="relatoinship" Type="String" />
                <asp:Parameter Name="y_account" Type="String" />
                <asp:Parameter Name="f_account" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
