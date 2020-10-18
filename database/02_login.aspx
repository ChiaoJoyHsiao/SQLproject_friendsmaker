<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02_login.aspx.cs" Inherits="secondPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
            <link href="reset.css" rel="stylesheet" />
        <link href="background.css" rel="stylesheet" />
    <style>
        .title{
            margin:50px 0;
            font-size:36px;
            font-weight:bold;
            background-color:lightsteelblue;
            text-align:center;
            width:400px;
            height:100px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><div class="title">
                <br />TALKBOOK 撩聊
            </div></center>
           <center> <div class="login">
                <asp:Label ID="account" runat="server" Text="帳號：" Font-Bold="True" Font-Size="20pt"></asp:Label>
                <asp:TextBox ID="accountBox" runat="server" Width="304px"></asp:TextBox><br />
                <asp:Label ID="passwords" runat="server" Text="密碼：" Font-Bold="True" Font-Size="20pt"></asp:Label>
                <asp:TextBox ID="passwordsBox" runat="server" Width="304px" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" Text="再次確認密碼：" Font-Bold="True" Font-Size="20pt"></asp:Label>
                <asp:TextBox ID="passwordAgain" runat="server" Width="304px" TextMode="Password"></asp:TextBox>
                <br /><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordAgain" ControlToValidate="passwordsBox" ErrorMessage="CompareValidator" ForeColor="Red">密碼與再次確認密碼不符，請重新輸入</asp:CompareValidator>
            </div></center>
            <br /><br />
           <center> 
               <asp:Button ID="allClear" runat="server" Text="全部清除"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="allClear_Click"/>
            <asp:Button ID="login" runat="server" Text="登入" Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="login_Click" />
<asp:Button ID="registered" runat="server" Text="我要註冊" Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="registered_Click" />
           </center>
        </div>
    </form>
</body>
</html>
