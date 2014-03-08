
<%@ Page Language="c#" AutoEventWireup="false"  Inherits="CIS.ApplicationSignUp" %>
<%@ Import Namespace="System.Net.Mail" %> 
 <%@ Import Namespace="System.Web.Configuration" %>
<script  runat="server">

    protected void submit(object sender, EventArgs e)
    {
        String output;
        String email;
        String password;
        String gender;
        String profession;
        if (IsValid(useremail.Text) == false)
        {
            outputLabel.Text = "Wrong Email";
            return;
        }
        else if (userpass.Text != userpass2.Text)
        {
            outputLabel.Text = "Password Doesn't Match";
            return;
        }
        output = "UserName: " + useremail.Text + "<br />"
            + "UserPass: " + userpass.Text + "<br />"
            + "Profession: " + drop1.SelectedItem + "<br />";
        if (male.Checked == true)
        {
            output += "Gender: Male";
            gender = "Male";
        }
        else
        {
            output += "Gender: Female";
            gender = "Female";
        }
        email = useremail.Text;
        password = userpass.Text;

        profession = drop1.SelectedItem.Text;
        //output = output.Replace("@", System.Environment.NewLine);
        outputLabel.Text = output;
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["huyString"].ConnectionString;
        System.Data.SqlClient.SqlConnection conn = null;
        try
        {
            conn = new System.Data.SqlClient.SqlConnection(connString);
            conn.Open();


            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT INTO [Table] Values (@Email,@Password,@Profession,@Gender)";
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Profession", profession);
                cmd.Parameters.AddWithValue("@Gender", gender);

                int rowAffected = cmd.ExecuteNonQuery();
                if (rowAffected == 1)
                {
                    useremail.Text = "";
                    userpass.Text = "";
                    drop1.SelectedIndex = -1;
                    //Alert the user the record got saved

                }
                else
                {
                    //Alert the user the thing not got saved
                }
            }
        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            System.Console.Write(sqlException.Message);
            
            //Alert user
            outputLabel.Text = "I'm a bitchh";
        }
    }
    
        
    
    public bool IsValid(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);
            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }

    protected void submitDatabase(object sender, EventArgs e)
    {
        
    }
 
</script>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8"/>
	<title>Signup Page</title>
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
<body  onload="setInterval('updateClock()', 200);" >

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
			<h1 class="form-signin-heading"> Sign up</h1>
			<form runat="server" id="form1" class="form-signin" role="form">

				<!-- Enter Email -->
				<div class="form-group user-email">
                    
					<asp:TextBox id="useremail" runat="server" type="text" class="login-field form-control" value="" placeholder=" Email Address" name="user-email"  />
				</div>

				<!-- Enter Password -->
				<div class="form-group user-pass">
					 <asp:TextBox id="userpass" runat="server" type="password" class="login-field form-control" value="" placeholder="Password" name="user-pass"  />
				</div>

				<!-- Re Enter Password For Verification -->
				<div class="form-group user-pass2">
					<asp:TextBox id="userpass2" runat="server" type="password" class="login-field form-control" value="" placeholder="Verify Password" name="user-pass2" />
                    <asp:Label Text="Who are you" runat="server" class="form-control" style="text-align: left" />
				</div>
                

                <div class="form-group">
                    <asp:DropDownList id="drop1" runat="server" class="form-control">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Investor</asp:ListItem>
                    <asp:ListItem>Businessman</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                    </asp:DropDownList>
                    
                </div>

                <div>
                    <asp:Label Text="Select your gender" runat="server" class="form-control" style="text-align: left" />
                    <br/>
                    <div id="male-radio">
                        <asp:RadioButton id="male" Text="Male" Checked="True" 
                        GroupName="genders" runat="server"    />
                    </div>
                    <br/>
                    <div id="female-radio">
                        <asp:RadioButton id="female" Text="Female"
                        GroupName="genders" runat="server" />
                    </div>
                    <br/>              
                </div>

                <div class="form-group ">
				 <asp:Button id="submitButton" runat="server" type="submit" name="post-submit" value="Submit" OnClick="submit" class="btn btn-lg btn-primary btn-block" Text ="Submit" /> 
                </div>

                <div>
                <asp:Label id="outputLabel" runat="server"/>
                </div>
			</form>

		</div>
	</div> <!-- /container -->
</body>
</html>
