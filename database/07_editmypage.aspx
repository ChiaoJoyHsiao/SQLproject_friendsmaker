<%@ Page Language="C#" AutoEventWireup="true" CodeFile="07_editmypage.aspx.cs" Inherits="seventhpage" %>

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
   
                   </p>
               </nav>
           </center>
        </div>
        
        
        <div>
            <center>
                <div class="item">
                                 <asp:Label ID="account" runat="server" Text=""></asp:Label><br /><br />
                <asp:Label ID="title" runat="server" Text="修改個人資料" Font-Bold="True" Font-Size="26pt" ForeColor="#000099" font-family="Microsoft JhengHei"></asp:Label><br />
                </div><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT [photo], [nickname], [account], [address], [weight], [height], [hobby] FROM [s1071742_TALKBOOK_Member]" UpdateCommand="UPDATE [s1071742_TALKBOOK_Member] SET [photo] = @photo, [nickname] = @nickname, [address] = @address, [weight] = @weight, [height] = @height, [hobby] = @hobby WHERE [account] = @account" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Member] WHERE [account] = @account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Member] ([photo], [nickname], [account], [address], [weight], [height], [hobby]) VALUES (@photo, @nickname, @account, @address, @weight, @height, @hobby)">
                    <DeleteParameters>
                        <asp:Parameter Name="account" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="photo" Type="String" />
                        <asp:Parameter Name="nickname" Type="String" />
                        <asp:Parameter Name="account" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="weight" Type="Int32" />
                        <asp:Parameter Name="height" Type="Int32" />
                        <asp:Parameter Name="hobby" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="photo" SessionField="photo" Type="String" />
                        <asp:ControlParameter ControlID="nickName" Name="nickname" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="address" Name="address" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="weight" Name="weight" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="height" Name="height" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="hobby" Name="hobby" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="account" SessionField="user" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </center>
        </div>

        <center>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" />
        <asp:FileUpload ID="FileUpload1" runat="server" /></center><br />
       <center> <asp:Label ID="error" runat="server" Text=""></asp:Label></center>
     <div class="wrap">
             <div class="item">
                暱稱：<asp:TextBox ID="nickName" runat="server"></asp:TextBox>
                <br /><br />居住地：<asp:DropDownList ID="address" runat="server">
                    <asp:ListItem>基隆市</asp:ListItem>
                    <asp:ListItem>新北市</asp:ListItem>
                    <asp:ListItem>台北市</asp:ListItem>
                    <asp:ListItem>桃園市</asp:ListItem>
                    <asp:ListItem>新竹市</asp:ListItem>
                    <asp:ListItem>新竹縣</asp:ListItem>
                    <asp:ListItem>苗栗縣</asp:ListItem>
                    <asp:ListItem>台中市</asp:ListItem>
                    <asp:ListItem>彰化縣</asp:ListItem>
                    <asp:ListItem>南投縣</asp:ListItem>
                    <asp:ListItem>雲林縣</asp:ListItem>
                    <asp:ListItem>嘉義市</asp:ListItem>
                    <asp:ListItem>嘉義縣</asp:ListItem>
                    <asp:ListItem>台南市</asp:ListItem>
                    <asp:ListItem>高雄市</asp:ListItem>
                    <asp:ListItem>屏東縣</asp:ListItem>
                    <asp:ListItem>台東縣</asp:ListItem>
                    <asp:ListItem>花蓮縣</asp:ListItem>
                    <asp:ListItem>宜蘭縣</asp:ListItem>
                    <asp:ListItem>澎湖縣</asp:ListItem>
                    <asp:ListItem>金門縣</asp:ListItem>
                    <asp:ListItem>連江縣</asp:ListItem>
                </asp:DropDownList>
                 <br />
                <br />
                 <br />
                 <br />身高：<asp:TextBox ID="height" runat="server"></asp:TextBox>
                 <br />
                 <br />體重：<asp:TextBox ID="weight" runat="server"></asp:TextBox>
                 <br />
                 <br />興趣：<asp:TextBox ID="hobby" runat="server"></asp:TextBox>
                 <br />
                 <br />
                 <br />
            </div>
         
        </div>
        <div>
            <center>
             <asp:Button ID="edit" runat="server" Text="立即更改"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="edit_Click"/>
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                <br />
                    <asp:Button ID="deleteAccount" runat="server" Text="不想玩了，我想刪除帳號"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="deleteAccount_Click" />
                <br />
                <br />
               <asp:Label ID="enterPassword" runat="server" Text="請輸入密碼：" Visible="False"></asp:Label> <asp:TextBox ID="passwords" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="submit" runat="server" Text="送出" Font-Bold="True"  BackColor="#FF6666" Visible="False" OnClick="submit_Click"/>
<br /><asp:Label ID="sure" runat="server" Text="*請注意，送出後即不可反悔請三思而行" ForeColor="Red" Visible="false"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Member] WHERE [account] = @account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Member] ([account]) VALUES (@account)" SelectCommand="SELECT [account] FROM [s1071742_TALKBOOK_Member]">
                    <DeleteParameters>
                        <asp:SessionParameter Name="account" SessionField="user" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="account" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </center>
         </div>
    </form>
</body>
</html>

