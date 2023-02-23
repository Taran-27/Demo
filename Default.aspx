<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Demo.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
    </table>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >
        <ItemTemplate>
            <table>
                <tr>
                    <td style=" text-align:center; background-color:#5f98f3">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>' Font-Bold="True"
                            Font-Names="Open Sans Extrabold" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style=" text-align:center">
                        <asp:Image ID="Image1" runat="server" BorderColor="#5F98F3" BorderWidth="1px" Height="279px" Width="278px" ImageUrl='<%# Eval("Pimage") %>' />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style=" text-align:center; background-color:#5f98f3">
                        <asp:Label ID="Label2" runat="server" Text="Price: Rs" Font-Bold="True" Font-Names="Arial" ForeColor="White" style=" text-align:center"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pprice") %>' Font-Bold="True" Font-Names="Arial" ForeColor="White" style=" text-align:center"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td align="center">Qauntity
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style=" text-align:center">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="200px" CommandArgument='<%# Eval("ProductId") %>' CommandName="AddToCart" ImageUrl="~/Images/AddCartButton.jpg" /> 
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecordDBConnectionString %>" SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice] FROM [Product1]"></asp:SqlDataSource>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
