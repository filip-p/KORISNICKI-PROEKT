<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html style="background-color: black;">
<head runat="server">
    <meta charset="UTF-8">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customCss.css" rel="stylesheet">
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
                           <li class="active">
                                <asp:LinkButton ID="lnkButtonHome" runat="server" OnClick="lnkButtonHome_Click"><span class="glyphicon glyphicon-home"></span> Home</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkCatalog" runat="server" OnClick="lnkCatalog_Click"><span class="glyphicon glyphicon-list-alt"></span> Catalog</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lnkContactAbout" runat="server" OnClick="lnkContactAbout_Click"><span class="glyphicon glyphicon-info-sign"></span> Contact/About</asp:LinkButton></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
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

        <div class="container-fluid" style="background-color: #577492;">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1 style="color: #fff; font-size: 4em;">Book Exchange</h1>
                </div>
            </div>
        </div>
     <%--   <div class="container" style="width: 25em; height: 25em; border-radius: 50%; font-size: 1.3em; color: #fff; background: #fff; position:relative; z-index: 2;">
            <div class="row">
                <div class=" col-sm-12 text-center">
                    <img src="img/bookCover.png" class="img-responsive">
                </div>
            </div>
        </div>--%>
        <div class="container-fluid" style="background-color: #18bc9c;">
            <div class="row">
                <div class="col-sm-12">
                    <div class="container text-center" style="padding-top:1em">
                        <div id="main_area">
                            <!-- Slider -->
                            <div class="row">
                                <div class="col-xs-12" id="slider">
                                    <!-- Top part of the slider -->
                                    <div class="row">
                                        <div class="col-sm-8" id="carousel-bounding-box">
                                            <div class="carousel slide" id="myCarousel">
                                                <!-- Carousel items -->
                                                <div class="carousel-inner">
                                                    <div class="active item" data-slide-number="0">
                                                        <img src="img/HomeImg.jpg" style="width: 770px; height: 450px">
                                                    </div>

                                                    <div class="item" data-slide-number="1">
                                                        <img src="http://placehold.it/770x300&text=two">
                                                    </div>

                                                    <div class="item" data-slide-number="2">
                                                        <img src="http://placehold.it/770x300&text=three">
                                                    </div>

                                                    <div class="item" data-slide-number="3">
                                                        <img src="http://placehold.it/770x300&text=four">
                                                    </div>

                                                    <div class="item" data-slide-number="4">
                                                        <img src="http://placehold.it/770x300&text=five">
                                                    </div>

                                                    <div class="item" data-slide-number="5">
                                                        <img src="http://placehold.it/770x300&text=six">
                                                    </div>
                                                </div>
                                                <!-- Carousel nav -->
                                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                </a>
                                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-sm-4" id="carousel-text"></div>

                                        <div id="slide-content" style="display: none;">
                                            <div id="slide-content-0">
                                                <h2>Slider One</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>

                                            <div id="slide-content-1">
                                                <h2>Slider Two</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>

                                            <div id="slide-content-2">
                                                <h2>Slider Three</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>

                                            <div id="slide-content-3">
                                                <h2>Slider Four</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>

                                            <div id="slide-content-4">
                                                <h2>Slider Five</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>

                                            <div id="slide-content-5">
                                                <h2>Slider Six</h2>
                                                <p>Lorem Ipsum Dolor</p>
                                                <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/Slider-->

                            <div class="row hidden-xs" id="slider-thumbs">
                                <!-- Bottom switcher of slider -->
                                <ul class="hide-bullets">
                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-0">
                                            <img src="http://placehold.it/170x100&text=one"></a>
                                    </li>

                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-1">
                                            <img src="http://placehold.it/170x100&text=two"></a>
                                    </li>

                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-2">
                                            <img src="http://placehold.it/170x100&text=three"></a>
                                    </li>

                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-3">
                                            <img src="http://placehold.it/170x100&text=four"></a>
                                    </li>

                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-4">
                                            <img src="http://placehold.it/170x100&text=five"></a>
                                    </li>

                                    <li class="col-sm-2">
                                        <a class="thumbnail" id="carousel-selector-5">
                                            <img src="http://placehold.it/170x100&text=six"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!----</h1> -->
        </div>
        <div class="container-fluid" style="background-color: #977492; margin-bottom: -15em">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 style="color: #fff; font-size: 74px;">Book Exchange</h1>
                </div>
            </div>
        </div>



        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>

        <script>
            $(document).ready(function ($) {

                $('#myCarousel').carousel({
                    interval: 5000
                });

                $('#carousel-text').html($('#slide-content-0').html());

                //Handles the carousel thumbnails
                $('[id^=carousel-selector-]').click(function () {
                    var id = this.id.substr(this.id.lastIndexOf("-") + 1);
                    var id = parseInt(id);
                    $('#myCarousel').carousel(id);
                });


                // When the carousel slides, auto update the text
                $('#myCarousel').on('slid.bs.carousel', function (e) {
                    var id = $('.item.active').data('slide-number');
                    $('#carousel-text').html($('#slide-content-' + id).html());
                });
            });
        </script>
    </form>
</body>
</html>
