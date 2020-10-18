<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04_ideal.aspx.cs" Inherits="fourth" %>

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
             .radio{
                 display:inline-block;
             }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <center>  <div>
            <div class="title">
                <br />我的理想型
            </div>
          <div class="item">
              <asp:Label ID="welcome" runat="server" Text=""></asp:Label><br /></div>
          <div class="item">

              性別：<asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                  <asp:ListItem>男</asp:ListItem>
                  <asp:ListItem>女</asp:ListItem>
              </asp:RadioButtonList>
          </div>
          <div class="item">
              年齡：<asp:DropDownList ID="age" runat="server">
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
              星座：<asp:DropDownList ID="constellation" runat="server">
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

              <div class="remind">
                  *勾選「是」我們會依據您的喜好來推薦對象給您。<br />
                  *勾選「否」我們將隨機推薦對象給您。
              </div>
              <div class="button">
                  <asp:Button ID="allClear" runat="server" Text="全部清除" Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="allClear_Click"></asp:Button>
                  <asp:Button ID="submit" runat="server" Text="立即送出" Font-Bold="True" Font-Size="Larger" BackColor="#FF6666" OnClick="submit_Click"></asp:Button>
                  <br />
                  <br />
                  <asp:Label ID="Label1" runat="server"></asp:Label>
              </div>
          </div>
        </div></center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT [idealage], [idealconstellation], [idealgender], [idealweight], [idealheight], [idealdegree], [idealtrait], [account] FROM [s1071742_TALKBOOK_Member]" DeleteCommand="DELETE FROM [s1071742_TALKBOOK_Member] WHERE [account] = @account" InsertCommand="INSERT INTO [s1071742_TALKBOOK_Member] ([idealage], [idealconstellation], [idealgender], [idealweight], [idealheight], [idealdegree], [idealtrait], [account]) VALUES (@idealage, @idealconstellation, @idealgender, @idealweight, @idealheight, @idealdegree, @idealtrait, @account)" UpdateCommand="UPDATE [s1071742_TALKBOOK_Member] SET [idealage] = @idealage, [idealconstellation] = @idealconstellation, [idealgender] = @idealgender, [idealweight] = @idealweight, [idealheight] = @idealheight, [idealdegree] = @idealdegree, [idealtrait] = @idealtrait WHERE [account] = @account">
            <DeleteParameters>
                <asp:Parameter Name="account" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idealage" Type="String" />
                <asp:Parameter Name="idealconstellation" Type="String" />
                <asp:Parameter Name="idealgender" Type="String" />
                <asp:Parameter Name="idealweight" Type="Int32" />
                <asp:Parameter Name="idealheight" Type="Int32" />
                <asp:Parameter Name="idealdegree" Type="String" />
                <asp:Parameter Name="idealtrait" Type="String" />
                <asp:Parameter Name="account" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="age" Name="idealage" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="constellation" Name="idealconstellation" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="weight" Name="idealweight" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="gender" Name="idealgender" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="degree" Name="idealdegree" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="height" Name="idealheight" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="personal" Name="idealtrait" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="account" SessionField="user" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

