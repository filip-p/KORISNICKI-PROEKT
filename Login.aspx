<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/test.css" rel="stylesheet">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <title>Book Exchange Home</title>

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
                                <asp:LinkButton ID="lnkButtonHome" runat="server" OnClick="lnkButtonHome_Click">Home</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCatalog" runat="server" OnClick="lnkCatalog_Click">Catalog</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkContactAbout" runat="server" OnClick="lnkContactAbout_Click">Contact/About</asp:LinkButton></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                                <li class="active">
                                <asp:LinkButton ID="lnkLoginRegister" runat="server" OnClick="lnkLoginRegister_Click">Login/Register</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCart" runat="server" OnClick="lnkCart_Click">Cart</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkWishlist" runat="server" OnClick="lnkWishlist_Click">Wishlist</asp:LinkButton></li>
                        
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
            <!-- /.navbar -->

        </div>
        <!-- /.container-fluid -->
        <div class="container" style="margin-bottom: -15em">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="page-header text-center">Login</h1>
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Sign in</button>
                            </div>
                        </div>
                    </div>
                    <h4 class="text-center">Don't have an account? Register for free!</h4>
                </div>
                <div class="col-md-6">
                    <h1 class="page-header text-center">Register</h1>
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputUsername" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputUsername" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputFaculty" class="col-sm-2 control-label">Faculty</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputFaculty" placeholder="Faculty">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputConfirmPassword" class="col-sm-2 control-label">Confirm password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputConfirmPassword" placeholder="Confirm password">
                            </div>
                        </div>
                        <div class="row hidden-xs hidden-sm">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-sm-3" style="padding-right: 0px;">
                                        <hr style="border-top: 3px solid #33CC33">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        <hr style="border-top: 3px solid #FFFFCC">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        
                                        
                                        
                                        <hr style="border-top: 3px solid #FF9933">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        <hr style="border-top: 3px solid #FF0000">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        <hr style="border-top: 3px solid #FF33CC">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        <hr style="border-top: 3px solid #990099">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
                                        <hr style="border-top: 3px solid #0000FF">
                                    </div>
                                    <div class="col-sm-3" style="padding-left: 0px;">
                                        <hr style="border-top: 3px solid #00CCFF">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="visible-md visible-lg ">
                            <div class="col-md-12 ">
                                <asp:Button runat="server" ID="buttonRegister" class="btn btn-primary btn-block" OnClick="buttonRegister_Click" Text="Register" />
                            </div>

                        </div>
                        <div class="visible-sm visible-xs">
                            <div class="col-sm-12 form-group ">
                               <asp:Button ID="buttonSmallRegister" class="btn btn-primary btn-block" runat="server" OnClick="buttonSmallRegister_Click" Text="Register" />
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




        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
