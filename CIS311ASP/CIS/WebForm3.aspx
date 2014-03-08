<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm3.aspx.vb" Inherits="CIS.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
	<title>Database Page</title>
	<link href="css/bootstrap.css" rel="stylesheet"/>

    
    <link href="css/modern-business.css" rel="stylesheet"/>
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="css/protek.css" rel="stylesheet"/>
    <link href="css/signin.css" rel="stylesheet"/>
    <script src="js/jquery-1.10.2.js"></script>
    
    <script src="js/bootstrap.js"></script>
    <script src="js/clock.js"></script>
    <script src="js/modern-business.js"></script>
    <!-- Custom styles for this template -->
</head>
<body>
    <form id="form1" runat="server">
    <div>
            
    </div>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id ="navigationBar1">
        <div class="container">
            <div class="navbar-header" id ="navigationBar3">
                
                
            </div>
            <div class="navbar-header" id ="navigationBar2">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->
                <a class="navbar-brand" href="index.html">ProTek: shop with confidence</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="contact.html">Contact</a>
                    </li>
                    <li class="dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class = "listItem" ><a href="boy.html"><b><font color="#656565">Boy</font></b></a>
                            </li>
                            <li class = "listItem"><a href="bboy.html"><b><font color="#656565">Baby Boy</font></b></a>
                            </li>
                            <li class = "listItem"><a href="bgirl.html"><b><font color="#656565">Baby Girl</font></b></a>
                            </li>
                            <li class = "listItem"><a href="girl.html"><b><font color="#656565">Girl</font></b></a>
                            </li>
                        </ul>
                    </li>
                     <li><a href="signIn.html">Sign In</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	<div class="container">
	
		<div class="signup-container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="152px" Width="934px">
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
        <p>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>Email</asp:ListItem>
            <asp:ListItem>Profession</asp:ListItem>
            <asp:ListItem>Gender</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
            <asp:Button ID="Button2" runat="server" Text="Showall" />
        <asp:Button ID="Button1" runat="server" Text="Search" Height="24px" Width="82px" />
            </div>
        </div>
    </form>
</body>
</html>
