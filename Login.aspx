<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link runat="server" rel="shortcut icon" href="~/favicon.ico" type="image/x-icon" />
    <link runat="server" rel="icon" href="~/favicon.ico" type="image/ico" />
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customCss.css" rel="stylesheet">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="fonts/css/font-awesome.css" rel="stylesheet" type="text/css">
    <%--<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <title>Book Exchange Login/Registration Page</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	        <![endif]-->
</head>
<body style="padding-bottom: 3%;">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header" style="font-size: 1.5em">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-3">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <asp:LinkButton ID="lnkBrand" runat="server" OnClick="lnkBrand_Click" class="navbar-brand"><asp:Image runat="server" AlternateText="Book Exchange Logo" ImageUrl="img/logo.png" class="img-responsive" Style="max-width: 120%;height: inherit;margin-top: -15px;"></asp:Image>
                        </asp:LinkButton>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse-3" style="font-size: 1em;">
                        <ul class="nav navbar-nav ">
                            <li>
                                <asp:LinkButton ID="lnkButtonHome" runat="server" OnClick="lnkButtonHome_Click"><span class="glyphicon glyphicon-home"></span> Home</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCatalog" runat="server" OnClick="lnkCatalog_Click"><span class="glyphicon glyphicon-list-alt"></span> Catalog</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkContactAbout" runat="server" OnClick="lnkContactAbout_Click"><span class="glyphicon glyphicon-info-sign"></span> Contact/About</asp:LinkButton></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 1em">
                            <li>
                                <asp:LinkButton ID="lnkAdminPage" Visible="false" runat="server" OnClick="lnkAdminPage_Click"><span class="glyphicon glyphicon-user"></span> Admin Page</asp:LinkButton></li>
                            <li class="active">
                                <asp:LinkButton ID="lnkLoginRegister" runat="server" OnClick="lnkLoginRegister_Click"><span class="glyphicon glyphicon-log-in"></span> Login/Register</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton runat="server" class="btn btn-default btn-outline btn-circle collapsed" data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">Search</asp:LinkButton>
                            </li>
                        </ul>
                        <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
                            <div class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <asp:TextBox ID="inputSearch" runat="server" class="form-control" placeholder="Search"></asp:TextBox>
                                </div>
                                <asp:LinkButton ID="lnkSearch" runat="server" type="submit" class="btn btn-danger" OnClick="lnkSearch_Click"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
            <!-- /.navbar -->

        </div>
        <!-- /.container-fluid -->
        <div class="container" style="padding-top: 3%;">
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="page-header text-center">Login</h1>
                    <div class="col-md-12">
                        <div class="text-center">
                            <asp:Label ID="tbLoggedIn" runat="server" CssClass="alert-danger alert-dissmisible"></asp:Label>
                        </div>
                        <asp:ValidationSummary ID="LoginValidationSummary" runat="server" ValidationGroup="Login" HeaderText="The following errors occured:" ForeColor="#CC0000" />
                    </div>
                    <div>
                        &nbsp;
                   
                    </div>
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputLoginUsername" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="inputLoginUsername" CssClass="form-control" runat="server" EnableViewState="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="inputLoginUsernameValidator" runat="server" ErrorMessage="You must specify a Username!" ControlToValidate="inputLoginUsername" Display="None" ValidationGroup="Login" CssClass="alert-danger"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputLoginPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="inputLoginPassword" CssClass="form-control" TextMode="Password" EnableViewState="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="inputLoginPasswordValidator" runat="server" ErrorMessage="You must specify a password!" ControlToValidate="inputLoginPassword" Display="None" ValidationGroup="Login" CssClass="alert-danger"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class=" col-sm-12 text-center">
                                <asp:Button runat="server" ID="btnLogin" class="btn btn-info btn-lg" OnClick="btnLogin_Click" Text="Login" ValidationGroup="Login" />
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h4 class="hidden-xs hidden-sm hidden-md text-center">Don't have an account? Register for free! <span class="glyphicon glyphicon-chevron-right"></span></h4>
                    <h4 class="hidden-lg  text-center">Don't have an account? Register for free! <span class="glyphicon glyphicon-chevron-down"></span></h4>
                </div>
                <div class="col-lg-6">
                    <h1 class="page-header text-center">Register</h1>
                    <div class="col-md-12">
                        <asp:ValidationSummary ID="ValidationSummaryRegister" runat="server" ValidationGroup="Register" ForeColor="#CC0000" HeaderText="The following errors occured:" />
                        <div class="text-center">
                            <asp:Label ID="tbHasUser" runat="server" CssClass="alert-danger form-control alert-dissmisible"></asp:Label>
                        </div>
                    </div>
                    <div>
                        &nbsp;
                   
                    </div>

                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputUsername" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <asp:RequiredFieldValidator ID="RequiredUsernameField" runat="server" ErrorMessage="You must specify a Username!" ControlToValidate="inputUsername" Display="None" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="inputUsername" placeholder="Username" runat="server" class="form-control" EnableViewState="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputFaculty" class="col-sm-2 control-label">Faculty</label>
                            <div class="col-sm-10">
                                <asp:RequiredFieldValidator ID="RequiredFacultyValidator" runat="server" ErrorMessage="You must specify a Faculty" ValidationGroup="Register" ControlToValidate="inputFaculty" Display="None"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="inputFaculty" placeholder="Faculty" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="inputEmail" placeholder="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="EmailRegularExpression" runat="server" ErrorMessage="Provide a valid Email!" ControlToValidate="inputEmail" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Register"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredEmailValidator" runat="server" ErrorMessage="You must specify an Email" Display="None" ControlToValidate="inputEmail" ValidationGroup="Register"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="inputPassword" placeholder="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredPasswordValidator" runat="server" ErrorMessage="You must specify a Password" Display="None" ControlToValidate="inputPassword" ValidationGroup="Register"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputConfirmPassword" class="col-sm-2 control-label">Confirm password</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="inputConfirmPassword" placeholder="Confirm Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="comparePasswordsValidator" runat="server" ControlToCompare="inputPassword" ControlToValidate="inputConfirmPassword" ErrorMessage="Passwords don't match!" Display="None" ValidationGroup="Register"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="row hidden-xs hidden-sm">
                            <div class="col-md-12">
                                <asp:CheckBox runat="server" ID="chkBoxMailList" Text="I wish to subscribe myself to the mailing list" />
                                <hr class="style-rainbow">
                            </div>
                        </div>
                        <div class="visible-md visible-lg ">
                            <div class="col-md-12 ">
                                <asp:Button runat="server" ID="buttonRegister" class="btn btn-primary btn-block" OnClick="buttonRegister_Click" Text="Register" ValidationGroup="Register" />
                            </div>

                        </div>
                        <div class="visible-sm visible-xs">
                            <div class="col-sm-12 form-group ">
                                <asp:Button ID="buttonSmallRegister" class="btn btn-primary btn-block" runat="server" OnClick="buttonSmallRegister_Click" Text="Register" ValidationGroup="Register" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer text-center">
            <hr />
            <div class="col-md-5">
                <div>
                    <ul class="social-network social-circle foot">
                        <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
                <div>
                    <asp:Label ID="footerLbl" runat="server">Logged in as: <i class="icon-user"></i>
                        <asp:LinkButton ID="lbUser" runat="server"></asp:LinkButton>
                        - 
                       
                            <i class="icon-calendar"></i>
                        <asp:Label ID="lblTime" runat="server"></asp:Label>
                    </asp:Label>
                </div>
            </div>
            <hr class="visible-xs visible-sm" />
            <div class="col-md-4 ">
                <h5 class="">Join our Mailing List for special offers, discounts and updates.</h5>
                <div class="input-group">
                    <div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The E-mail field must not be empty" ValidationGroup="MailList" ControlToValidate="tbJoinMailList" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="The Email format is Invalid" ValidationGroup="MailList" ControlToValidate="tbJoinMailList" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                    </div>
                    <asp:TextBox ID="tbJoinMailList" CssClass="form-control" Placeholder="E-mail address" runat="server" ValidationGroup="MailList"></asp:TextBox>
                    <div>&nbsp;</div>
                    <div>&nbsp;</div>
                    <asp:Label runat="server" class="input-group-btn">
                        <asp:Button runat="server" ID="btnJoinMailList" class="btn btn-default" Text="Join!" type="button" OnClick="btnJoinMailList_Click" ValidationGroup="MailList"></asp:Button>
                    </asp:Label>
                </div>
                <!-- /input-group -->

            </div>
            <hr class="visible-xs visible-sm" />
            <div class="col-md-3">
                Copyright &copy; Book Exchange
                   
                    <asp:Label ID="lblYear" runat="server"></asp:Label>
            </div>

        </footer>





        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
