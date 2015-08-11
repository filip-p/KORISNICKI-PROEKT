<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="AddBook" %>

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
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <link href="css/c3.css" rel="stylesheet">
    <!-- Fonts -->
    <title>Book Exchange Book Add Page</title>

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

        <div class="container" style="padding-top: 5%;">
            <div class="row">
                <div class="col-md-6">
                    <%--Form for adding a new book--%>
                    <div class="jumbotron">
                        <div role="form">
                            <h3 class="text-center" style="margin-top: -5px">Sell/Exchange a book</h3>
                            <div class="text-center">
                                <asp:Label ID="tbBookAdded" runat="server" CssClass="alert-success"></asp:Label>
                            </div>
                            <div>

                                <asp:ValidationSummary ID="AddBookSummary" runat="server" HeaderText="The list of errors that occured:" ForeColor="#CC0000" ValidationGroup="AddBook" />
                            </div>
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="inputBookTitleValidator" CssClass="alert-danger" runat="server" ErrorMessage="You must tell us the book title!" ControlToValidate="inputBookTitle" ValidationGroup="AddBook" Display="None"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="inputBookTitle" class="form-control" placeholder="Book Title" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="inputBookAuthorValidator" runat="server" ErrorMessage="You must tell us the book author!" ControlToValidate="inputBookAuthor" CssClass="alert-danger" Display="None" ValidationGroup="AddBook"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="inputBookAuthor" class="form-control" placeholder="Book Author" runat="server" EnableViewState="False"></asp:TextBox>
                            </div>
                            <div class="form-group  text-center">
                                <asp:RequiredFieldValidator ID="inputBookPriceValidator" runat="server" ErrorMessage="You need to specify if you are selling this book or not" ControlToValidate="inputBookPrice" CssClass="alert-danger" Display="None" ValidationGroup="AddBook"> </asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="inputPriceRange" runat="server" ErrorMessage="The price needs to be a positive number, or 0 if you don't want to sell the book" ValidationGroup="AddBook" Type="Integer" ControlToValidate="inputBookPrice" MinimumValue="0" MaximumValue="999999999" Display="None" CssClass="alert-danger"></asp:RangeValidator>
                                <div class="visible-md visible-lg">
                                    <asp:Label runat="server" CssClass="alert-info">If you don't want to sell this book for money, type in "0".</asp:Label>
                                </div>
                                <div class="visible-sm visible-xs">
                                    <asp:Label runat="server" CssClass="alert-info" Style="font-size: x-small">If you don't want to sell this book for money, type in "0".</asp:Label>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="inputBookPrice" class="form-control" placeholder="Book Price" runat="server" EnableViewState="False" ValidationGroup="AddBook" TextMode="Number"></asp:TextBox>
                                    <span class="input-group-addon">$</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="inputBookDescriptionValidator" runat="server" ErrorMessage="You need to discribe the book so users can easily find it if they need it!" ControlToValidate="inputBookDescription" CssClass="alert-danger" Display="None" ValidationGroup="AddBook"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="inputBookDescription" class="form-control" placeholder="Book Description" runat="server" TextMode="MultiLine" EnableViewState="False" Style="resize: none; overflow: auto" Rows="10"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">
                                <asp:CompareValidator ID="exchangeAndPriceValidator" runat="server" ErrorMessage="You can either sell or exchange the book, not both!" ValidationGroup="AddBook" Operator="NotEqual" ControlToCompare="inputBookPrice" ControlToValidate="inputBookNeeded" Display="None"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="inputBookNeededValidator" runat="server" ErrorMessage="You need to specify if you are exchanging this book or not" ControlToValidate="inputBookNeeded" CssClass="alert-danger" Display="None" ValidationGroup="AddBook"></asp:RequiredFieldValidator>
                                <div class="visible-md visible-lg">
                                    <asp:Label runat="server" CssClass="alert-info ">If you don't want to exchange this book, type in "NONE", otherwise use <b>";"</b> after every book u want to exchange (ex. Book1,Book2,Book3,Book4).</asp:Label>
                                </div>
                                <div class="visible-sm visible-xs">
                                    <asp:Label runat="server" CssClass="alert-info " Style="font-size: x-small">If you don't want to exchange this book, type in "NONE", otherwise use "," after every book u want to exchange (ex. Book1,Book2,Book3,Book4).</asp:Label>
                                </div>
                                <asp:TextBox ID="inputBookNeeded" class="form-control" placeholder="Books that can be exchanged for this item" runat="server" EnableViewState="False" ValidationGroup="AddBook"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <div>
                                    <asp:RequiredFieldValidator ID="imageUploadValidator" runat="server" ErrorMessage="You must insert an image of your book" ControlToValidate="inputImageUpload" CssClass="alert-danger" ValidationGroup="AddBook" Display="None"></asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="imageUploadExpression" runat="server" ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|.*\.[Pp][Nn][Gg]$)" ErrorMessage="Only jpg and png images are allowed" ControlToValidate="inputImageUpload" CssClass="alert-danger" ValidationGroup="AddBook" Display="None"></asp:RegularExpressionValidator>
                                </div>
                                <asp:Label runat="server" Text="Insert your book Image here!"></asp:Label>
                                <asp:FileUpload ID="inputImageUpload" runat="server" />
                            </div>
                            <div>
                                &nbsp;
                            </div>
                            <div class="row visible-md visible-lg">
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="cancelSubmitBook" runat="server" class="btn btn-warning " Text="Cancel and go back" OnClick="cancelSubmitBook_Click" OnClientClick="return confirm('Are you sure you want to cancel?');" CausesValidation="False"></asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="submitBook" runat="server" class="btn btn-primary pull-right" Text="SUBMIT" OnClick="submitBook_Click" ValidationGroup="AddBook"></asp:Button>
                                </div>
                            </div>
                            <div class="row visible-sm visible-xs">
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="cancelSubmitBookSm" runat="server" class="btn btn-warning btn-block" Text="Cancel and go back" OnClick="cancelSubmitBook_Click" OnClientClick="return confirm('Are you sure you want to cancel your purchase?');" CausesValidation="False"></asp:LinkButton>
                                </div>
                                <div>
                                    &nbsp;
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="submitBookSm" runat="server" class="btn btn-primary btn-block " Text="SUBMIT" OnClick="submitBook_Click" ValidationGroup="AddBook"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                <%--end Form for adding a new book--%>
                </div>
                <%--C3 Chart with Registered Users / Books added ratio--%>
                <div class="col-md-6">
                    <h3 class="page-header text-center">Ratio of registered users and books added for exchange</h3>
                    <div id="userBookRatioChart"></div>
                </div>
                <%--end C3 Chart with Registered Users / Books added ratio--%>
            </div>
            <%--Footer--%>
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
            <%--end Footer--%>
        </div>
        <asp:HiddenField ID="booksNumber" runat="server" />
        <asp:HiddenField ID="usersNumber" runat="server" />



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




