﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>
<html style="background-color: black;">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<body style="padding-top: 3%; font-family: Montserrat;">
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
                                <li>
                                <asp:LinkButton ID="lnkLoginRegister" runat="server" OnClick="lnkLoginRegister_Click">Login/Register</asp:LinkButton></li>
                            <li class="active">
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





        
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>

        
    </form>
</body>
</html>
