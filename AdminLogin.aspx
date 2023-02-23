<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Demo.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style7 {
            width: 736px;
            height: 500px;
            margin-bottom: 112px;
        }
        .auto-style8 {
            width: 272px;
        }
        .auto-style9 {
            margin-bottom: 12px;
        }
        .auto-style10 {
            width: 50%;
            height: 116px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table align="center" class="auto-style7" style="background-color: #00FFFF">
                <tr>
                    <td colspan="2" align="center">
                        <h2>Admin Login</h2>
                    </td>
                    
                </tr>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Email Id:</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style9" Height="51px" Width="261px" BackColor="Cyan" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style10">
                        <b>Password:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style9" Height="51px" Width="259px" BackColor="Cyan" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Height="49px" Text="Login" Width="180px" BackColor="Cyan" OnClick="Button1_Click" />
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                   
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
