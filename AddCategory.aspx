<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Demo.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div class="navbar" style="border-width: 3px; border-color: #333333">
            <table align="center" style="width: 386px; height:410px">
                <tr>
                    <td colspan="2" align="center">
                        <h2>
                            Add Category
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b style="font-size: 21px; font-weight: bold">Category: &nbsp;&nbsp;&nbsp;</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="44px" Width="230px"
                            CauseValidation="True" placeholder="Category Name" BorderColor="#333333" BorderWidth="2px" Font-Bold="true" Font-Size="Medium" ForeColor="Black"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="TextBox1"
                            ForeColor="Red" ErrorMessage="Enter Category Name"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Add" Height="44px" Width="80px"
                            Font-Bold="true" Font-Size="Medium" BackColor="Aqua" BorderColor="#333333"
                            BorderWidth="2px" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br /></td>
                    
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#333333" BorderWidth="2px" CssClass="button" DataKeyNames="CategoryId" EmptyDataText="No record to display" Font-Bold="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="4" Width="257px">
                            <Columns>
                                <asp:TemplateField HeaderText="Category">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Text='<%# Eval("CategoryName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                            </Columns>
                            <HeaderStyle BorderColor="#333333" BorderWidth="3px" Font-Size="Large" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecordDBConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </div>
    </center>
</asp:Content>
