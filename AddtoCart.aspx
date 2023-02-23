<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="Demo.AddtoCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head> 
<body>
    <form id="form1" runat="server">
        <div align="center" style=" margin: 0 auto;">
            <h2 style=" text-decoration: underline overline blink; color:#5f98f3"> You Have Following Product In Your Cart</h2>
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Colonna MT" Font-Size="X-Large" NavigateUrl="~/Default.aspx">Continue Shopping</asp:HyperLink>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderWidth="5px" EmptyDataText="No Product Avaliable in Shopping Cart" Font-Bold="True" Height="257px" ShowFooter="True" Width="1100px" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="Sr No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pid" HeaderText="Product ID">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image">
                        <ControlStyle Height="300px" Width="300px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField DataField="pname" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pprice" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                    
                   
                     <%--<asp:DataControlField ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="4" RepeatDirection="Horizontal">--%>
                    
                    <%--</asp:DataControlField>--%>

                    <%--<asp:TemplateField HeaderText = "update">
            <ItemTemplate>
               <%-- <asp:Label ID="quantity" runat="server" Text='<%# Eval("") %>' Visible = "false" />--%>
                <%--<asp:DropDownList ID="ddownlist1" runat="server" >
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>--%>
            <%--</ItemTemplate>
        </asp:TemplateField>--%>
                    
                </Columns>
                <FooterStyle BackColor="Cyan" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Cyan" ForeColor="Black" />
            </asp:GridView>

            <br />
            <asp:Button ID="Button1" runat="server" Text="AdminEdit" BackColor="Cyan" BorderColor="Black" BorderStyle="Ridge" Font-Bold="True" Font-Size="Large" Height="46px" Width="135px" OnClick="AdminEdit" />
            <asp:Button ID="Button2" runat="server" Text="BuyNow" BackColor="Cyan" BorderColor="Black" BorderStyle="Ridge" Font-Bold="True" Font-Size="Large" Height="46px" Width="135px" OnClick="BuyNow" />
        </div>
    </form>
</body>
</html>
