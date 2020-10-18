<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03_registered.aspx.cs" Inherits="third" %>

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
        .radio{
            display:inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

                <div class="title"><center><br />
<asp:Label ID="title" runat="server" Text="填寫基本資料" Font-Bold="True" Font-Size="26pt" ForeColor="#000099"></asp:Label><br /><br />
                </center></div>            
            
        </div>
        <center><asp:Image ID="Image1" runat="server"></asp:Image>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br /><asp:Label ID="error" runat="server" Text=""></asp:Label></center>
     <div class="wrap">
             <div class="item">
                帳號：<asp:TextBox ID="account" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="account" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
          <br /><br />密碼：<asp:TextBox ID="passwords" runat="server" TextMode="Password"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="passwords" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>

                 <br /><br /> 暱稱：<asp:TextBox ID="nickName" runat="server"></asp:TextBox>
                &nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nickName" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />生日：<asp:TextBox ID="birthday" runat="server" TextMode="Date"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="birthday" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />生理性別：<asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                     <asp:ListItem Value="boy">男</asp:ListItem>
                     <asp:ListItem Value="girl">女</asp:ListItem>
                 </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="gender" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
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
                &nbsp;
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />人格特質：<asp:TextBox ID="person" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="person" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />
                <br />
                <asp:Button ID="allClear" runat="server" Text="全部清除"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="allClear_Click"/>
            </div>
               <div class="item">
                本名：<asp:TextBox ID="realname" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="realname" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                 <br /><br />年齡：<asp:TextBox ID="age" runat="server"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="age" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="age" ErrorMessage="*18歲~100歲" ForeColor="Red" MaximumValue="100" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                 <br /><br />身高：<asp:TextBox ID="height" runat="server"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="height" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<br /> <br />體重：<asp:TextBox ID="weight" runat="server"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="weight" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                  <br /> <br />學歷：<asp:DropDownList ID="degree" runat="server">
                    <asp:ListItem>國小</asp:ListItem>
                    <asp:ListItem>國中</asp:ListItem>
                    <asp:ListItem>高中/職</asp:ListItem>
                    <asp:ListItem>大專院校</asp:ListItem>
                    <asp:ListItem>碩士</asp:ListItem>
                    <asp:ListItem>博士</asp:ListItem>
                </asp:DropDownList>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="degree" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                  <br /> <br />興趣：<asp:TextBox ID="hobby" runat="server"></asp:TextBox>
                   &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="hobby" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                   <br />
                <br />*興趣寫得越詳細，可以讓撩聊對象越了解你喔！
                <br /><br /><asp:Button ID="submit" runat="server" Text="立即送出"  Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="submit_Click"/>
                   <br />
                   <br />
                   <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>       
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Member] WHERE [account] = @account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Member] ([trait], [gender], [photo], [height], [weight], [degree], [realname], [age], [nickname], [hobby], [bithday], [address], [password], [account]) VALUES (@trait, @gender, @photo, @height, @weight, @degree, @realname, @age, @nickname, @hobby, @bithday, @address, @password, @account)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [trait], [gender], [photo], [height], [weight], [degree], [realname], [age], [nickname], [hobby], [bithday], [address], [password], [account] FROM [s1071742_TALKBOOK_Member]" UpdateCommand="UPDATE [s1071742_TALKBOOK_Member] SET [trait] = @trait, [gender] = @gender, [photo] = @photo, [height] = @height, [weight] = @weight, [degree] = @degree, [realname] = @realname, [age] = @age, [nickname] = @nickname, [hobby] = @hobby, [bithday] = @bithday, [address] = @address, [password] = @password WHERE [account] = @account">
            <DeleteParameters>
                <asp:Parameter Name="account" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="person" Name="trait" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="gender" Name="gender" PropertyName="SelectedValue" Type="String" />
                <asp:SessionParameter Name="photo" SessionField="photo" Type="String" />
                <asp:ControlParameter ControlID="height" Name="height" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="weight" Name="weight" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="degree" Name="degree" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="realname" Name="realname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="age" Name="age" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="nickName" Name="nickname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="hobby" Name="hobby" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="birthday" DbType="Date" Name="bithday" PropertyName="Text" />
                <asp:ControlParameter ControlID="address" Name="address" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="passwords" Name="password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="account" Name="account" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="trait" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="photo" Type="String" />
                <asp:Parameter Name="height" Type="Int32" />
                <asp:Parameter Name="weight" Type="Int32" />
                <asp:Parameter Name="degree" Type="String" />
                <asp:Parameter Name="realname" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="nickname" Type="String" />
                <asp:Parameter Name="hobby" Type="String" />
                <asp:Parameter Name="bithday" DbType="Date" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="account" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

