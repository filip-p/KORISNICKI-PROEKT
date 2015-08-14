<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link runat="server" rel="shortcut icon" href="~/favicon.ico" type="image/x-icon" />
    <link runat="server" rel="icon" href="~/favicon.ico" type="image/ico" />
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customCss.css" rel="stylesheet" type="text/css">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <title>Book Exchange Home Page</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	        <![endif]-->
</head>
<body>
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
                            <li class="active">
                                <asp:LinkButton ID="lnkButtonHome" runat="server" OnClick="lnkButtonHome_Click"><span class="glyphicon glyphicon-home"></span> Home</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCatalog" runat="server" OnClick="lnkCatalog_Click"><span class="glyphicon glyphicon-list-alt"></span> Catalog</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkContactAbout" runat="server" OnClick="lnkContactAbout_Click"><span class="glyphicon glyphicon-info-sign"></span> Contact/About</asp:LinkButton></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 1em">
                            <li>
                                <asp:LinkButton ID="lnkAdminPage" runat="server" Visible="false" OnClick="lnkAdminPage_Click"><span class="glyphicon glyphicon-user"></span> Admin Page</asp:LinkButton></li>
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
        <div class="container-fluid" style="background-color: rgba(111,175,11,0.7); padding-top: 50px">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1 style="font-size: 3em;" class="visible-lg visible-md">Book Exchange</h1>
                    <h1 class="visible-sm visible-xs">Book Exchange</h1>
                    <h3 class="visible-md visible-lg">A place where exchanging books with fellow students comes natural</h3>
                    <h5 class="visible-xs visible-sm">A place where exchanging books with fellow students comes natural</h5>
                </div>
            </div>
        </div>

        <%--18bc9c--%>
        <div class="container-fluid" style="background-color: rgba(111,175,11,0.7);">
            <div class="row">
                <div class="col-sm-12">
                    <section id="carousel">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="quote"><i class="fa fa-quote-left fa-3x"></i></div>
                                    <div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="5000">
                                        <!-- Carousel indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-target="#fade-quote-carousel" data-slide-to="0" class="active"></li>
                                            <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
                                            <li data-target="#fade-quote-carousel" data-slide-to="2"></li>
                                        </ol>
                                        <!-- Carousel items -->
                                        <div class="carousel-inner">
                                            <div class="active item">
                                                <blockquote>
                                                    <p class="visible-md visible-lg visible-sm text-justify">After i found this website, i didn't even need to keep looking for anything else because Book Exchange literally has all of the things i need to make successful book exchanges with other colleague, and all the deals are made in no time at all!</p>
                                                    <p class="visible-xs" style="font-size: small">After i found this website, i didn't even need to keep looking for anything else because Book Exchange literally has all of the things i need to make successful book exchanges with other colleague, and all the deals are made in no time at all!</p>
                                                </blockquote>
                                                <asp:Image runat="server" ImageUrl="img/homePage/carouselStef.jpg" CssClass="img-responsive profile-circle" />
                                            </div>
                                            <div class="item">
                                                <blockquote>
                                                    <p class="visible-md visible-lg visible-sm text-justify">It's funny when u want something really bad, but when u give up on looking for it, it comes by it self. The same thing happened with Book Exchange. When i finally stopped looking for a book exchange site --> BAAM!. I found this, it's really amazing, i can't say anithing bad about this site. Pure Awesome!!!!</p>
                                                    <p class="visible-xs" style="font-size: small">It's funny when u want something really bad, but when u give up on looking for it, it comes by it self. The same thing happened with Book Exchange. When i finally stopped looking for a book exchange site --> BAAM!. I found this, it's really amazing, i can't say anithing bad about this site. Pure Awesome!!!!</p>
                                                </blockquote>
                                                <asp:Image runat="server" ImageUrl="img/homePage/carouselDare.jpg" class="img-responsive profile-circle" />
                                            </div>
                                            <div class="item">
                                                <blockquote>
                                                    <p class="visible-md visible-lg visible-sm">Takaaa! That's what i said in my language when i first found this site. So easy to navigate, but i can guess it's really complex on the inside. This site is a HIT!</p>
                                                    <p class="visible-xs" style="font-size: small">Takaaa! That's what i said in my language when i first found this site. So easy to navigate, but i can guess it's really complex on the inside. This site is a HIT!</p>
                                                </blockquote>
                                                <asp:Image runat="server" ImageUrl="img/homePage/carouselPance.jpg" class="img-responsive profile-circle" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <div class="container-fluid text-center" style="color: #fff; background-color: #577492; padding-top: 2%; padding-bottom: 2%">
            <div class="row">
                <h1 style="color: #fff">Benefits of using Book Exchange</h1>
                <div class="col-lg-4 col-md-4">
                    <asp:Image runat="server" src="img/homePage/timer.svg" Width="200px" CssClass="hidden-xs hidden-sm" />
                    <asp:Image runat="server" src="img/homePage/timer.svg" Width="100px" CssClass="hidden-md hidden-lg" />
                    <h3>Get the books you need Quickly!</h3>
                    <p>With Book Exchange, finding the books you need for your studies is really fast.</p>
                </div>
                <hr class="visible-sm visible-xs" />
                <div class="col-lg-4 col-md-4">
                    <asp:Image runat="server" src="img/homePage/coffeeCup.png" Width="205px" CssClass="hidden-xs hidden-sm" />
                    <asp:Image runat="server" src="img/homePage/coffeeCup.png" Width="105px" CssClass="hidden-md hidden-lg" />
                    <h3>No setting up required!</h3>
                    <p>With Book Exchange, all you need to do is make an account, everything else is covered by US!</p>
                </div>
                <hr class="visible-sm visible-xs" />
                <div class="col-lg-4 col-md-4">
                    <asp:Image src="img/homePage/cookingGlove.png" runat="server" Width="195px" Height="205px" CssClass="hidden-xs hidden-sm" />
                    <asp:Image src="img/homePage/cookingGlove.png" runat="server" Width="100px" Height="120px" CssClass="hidden-md hidden-lg" />
                    <h3>Safety First!</h3>
                    <p>We guarantee that everything you browse on Book Exchange, as well as all of your transactions will be 100% secure!</p>
                </div>
            </div>
        </div>
        <div class=" oldBookImage container-fluid text-center visible-lg visible-md visible-sm" style="padding-bottom: 35%;">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <h1 class="text-center !important" style="color: darkslategrey;">Want to be part of our Timeline? Sign up now!</h1>
            <asp:LinkButton CssClass="btn btn-warning btn-lg" Style="color: darkslategrey;" PostBackUrl="~/Login.aspx" Text="Sign Up / Login" runat="server"></asp:LinkButton>
            <h1 class="text-center !important" style="color: darkslategrey;">Already part of our Timeline? Start exchanging now !</h1>
            <asp:LinkButton CssClass="btn btn-danger btn-lg" Style="color: darkslategrey;" PostBackUrl="~/Catalog.aspx" Text="Exchange!" runat="server"></asp:LinkButton>
        </div>
        <div class=" oldBookImage container-fluid text-center visible-xs" style="margin-top: auto; padding-bottom: 30%">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <h5 class="text-center !important" style="color: darkslategrey;">Want to be part of our Timeline? Sign up now!</h5>
            <asp:LinkButton CssClass="btn btn-warning btn-xs " Style="color: darkslategrey;" PostBackUrl="~/Login.aspx" Text="Sign Up / Login" runat="server"></asp:LinkButton>
            <h5 class="text-center !important" style="color: darkslategrey;">Already part of our Timeline? Start exchanging now !</h5>
            <asp:LinkButton CssClass="btn btn-danger btn-xs" Style="color: darkslategrey;" PostBackUrl="~/Catalog.aspx" Text="Exchange!" runat="server"></asp:LinkButton>
        </div>
        <footer class="footer text-center" style="padding-bottom: 10%;">
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
    </form>
</body>
</html>
