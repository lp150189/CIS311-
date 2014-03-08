<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm3.aspx.vb" Inherits="CIS.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Profession" HeaderText="Profession" SortExpression="Profession" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:CommandField HeaderStyle-Width="10%" ShowDeleteButton="True" ShowEditButton="True" EditImageUrl="images/zedit.png" DeleteImageUrl="images/zdelete.png" ButtonType="Image" CancelImageUrl="images/zcancel.png" UpdateImageUrl="images/zaccept.png" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:huyString %>" 
                                    SelectCommand="SELECT * FROM [Table]"
                                    DeleteCommand="DELETE FROM [Table] WHERE [id] = @id"
                                    UpdateCommand="UPDATE [Table] SET [Email] = @Email, [Password] = @Password, [Profession] = @Profession, [Gender] = @gender WHERE [id] = @id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Profession" Type="String" />
                                        <asp:Parameter Name="Gender" Type="String" />
                                    </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Email</asp:ListItem>
            <asp:ListItem>Profession</asp:ListItem>
            <asp:ListItem>Gender</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <p>
            <asp:Button ID="Button2" runat="server" Text="Showall" />
        </p>
    </form>
</body>
</html>
