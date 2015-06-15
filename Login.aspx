<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customCss.css" rel="stylesheet">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
<body style="padding-top: 3%;">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Second navbar for search -->
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
                        <asp:LinkButton ID="lnkBrand" runat="server" OnClick="lnkBrand_Click" Style="margin-top: -0.5em" class="navbar-brand"><img src="http://placehold.it/100x40">
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
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active">
                                <asp:LinkButton ID="lnkLoginRegister" runat="server" OnClick="lnkLoginRegister_Click"><span class="glyphicon glyphicon-log-in"></span> Login/Register</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCart" runat="server" OnClick="lnkCart_Click"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</asp:LinkButton></li>
                          </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
            <!-- /.navbar -->

        </div>
        <!-- /.container-fluid -->
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="page-header text-center">Login</h1>
                    <div class="col-md-12">
                        <asp:TextBox ID="tbLoggedIn" runat="server" CssClass="form-control text-center" EnableViewState="False" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                        <asp:ValidationSummary ID="LoginValidationSummary" runat="server" ValidationGroup="Login" ForeColor="#CC0000" HeaderText="The following errors occured:" />
                    </div>
                    <hr>
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputLoginUsername" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="inputLoginUsername" CssClass="form-control" runat="server" EnableViewState="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="inputLoginUsernameValidator" runat="server" ErrorMessage="You must specify a Username!" ControlToValidate="inputLoginUsername" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputLoginPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="inputLoginPassword" CssClass="form-control" TextMode="Password" EnableViewState="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="inputLoginPasswordValidator" runat="server" ErrorMessage="You must specify a password!" ControlToValidate="inputLoginPassword" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>

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
                    <h4 class="hidden-lg  text-center">Don't have an account? Register for free! <span class="glyphicon glyphicon-chevron-down"></h4>
                </div>
                <div class="col-lg-6">
                    <h1 class="page-header text-center">Register</h1>
                    <div class="col-md-12">
                        <asp:ValidationSummary ID="ValidationSummaryRegister" runat="server" ValidationGroup="Register" ForeColor="#CC0000" HeaderText="The following errors occured:" />
                        <asp:TextBox ID="tbHasUser" runat="server" CssClass="form-control text-center" EnableViewState="False" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <hr />
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
            <div class="footer-below">
                <hr />
                <p>Copyright &copy; FINKI 2015</p>
                <br>
                <br>
                <br>
                <br>
            </div>
        </div>





        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
