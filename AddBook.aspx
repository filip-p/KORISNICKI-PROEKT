﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="AddBook" %>

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

    <link href="css/c3.css" rel="stylesheet">
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
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body style="padding-bottom:3%;">
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
                        <asp:LinkButton ID="lnkBrand" runat="server" OnClick="lnkBrand_Click" Style="margin-top: -0.5em" class="navbar-brand"><asp:Image runat="server" AlternateText="Book Exchange Logo" ImageUrl="img/logo.jpg" class="img-responsive"></asp:Image>
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
                <div class="col-md-5">
                    <div class="form-area">
                        <div role="form">
                            <br style="clear: both">
                            <h3 style="margin-bottom: 25px; text-align: center;">Sell/Exchange a book</h3>
                            <div class="form-group">
                                <asp:TextBox ID="inputBookTitle" class="form-control" placeholder="Book Title" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="inputBookAuthor" class="form-control" placeholder="Book Author" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="inputBookPrice" class="form-control" placeholder="Book Price" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="inputBookDescription" class="form-control" placeholder="Book Description" runat="server" TextMode="MultiLine" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="inputBookNeeded" class="form-control" placeholder="Books that can be exchanged for this item" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:FileUpload ID="inputImageUpload" runat="server" />
                            </div>
                            <asp:Button ID="submitBook" runat="server" class="btn btn-primary pull-right" Text="Submit" OnClick="submitBook_Click"></asp:Button>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <h3 class="page-header text-center">Ratio of registered users and books added for exchange</h3>
                    <div id="userBookRatioChart"></div>
                </div>
            </div>
            <hr />
            <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>


        </div>
        <asp:HiddenField ID="booksNumber" runat="server" />
        <asp:HiddenField ID="usersNumber" runat="server" />


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
                        <input type="text" class="form-control" placeholder="E-mail address">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Join!</button>
                        </span>
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
        <script src="js/chart.js"></script>
        <!-- C3 Charts JavaScript -->
        <script src="js/d3.min.js"></script>
        <script src="js/c3.min.js"></script>

    </form>
</body>
</html>




