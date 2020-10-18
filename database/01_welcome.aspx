<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01_welcome.aspx.cs" Inherits="firstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="reset.css" rel="stylesheet" />
        <link href="background.css" rel="stylesheet" />
    <style>

        .centerPage{
            margin:10px 0;
            text-align:center;
            font-size:28px;
            font-weight:bold;
        }
        center
        {
            margin:10px 0;
            font-size:28px;
            font-weight:bold;
        }
        .button{
            margin:10px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="centerPage">
                <img src="photo/loveGod.png" alt="Alternate Text" />
                <br />
                歡迎來到TALKBOOK撩聊
                <br />
                <div class="button">
                <asp:Button ID="welcome" runat="server" Text="進入撩聊" Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="welcome_Click" />
         </div>
            </div>
            <center>趕緊開始撩聊吧！</center>
        </div>
    </form>
</body>
</html>
