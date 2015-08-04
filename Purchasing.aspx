<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchasing.aspx.cs" Inherits="Purchasing" %>

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
    <title>Book Exchange Purchasing Page</title>

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
                <div class="col-sm-12">
                   <%--<asp:Label ID="labelCreditCardHide" runat="server" CssClass="alert-success fa-5x ">--%>
                        <div role="form" class="form-horizontal col-sm-6">
                            <fieldset>
                                <legend>Payment</legend>
                                <div class="form-group">
                                    <label class="control-label">Card Holder's Name</label>
                                    <asp:TextBox ID="inputCardName" class="form-control" pattern="\w+ \w+.*" required="required" runat="server"></asp:TextBox>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label">Card Number</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="inputFirstFour" runat="server" CssClass="form-control" autocomplete="off" MaxLength="4" pattern="\d{4}" Placeholder="XXXX" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="inputSecondFour" runat="server" CssClass="form-control" autocomplete="off" MaxLength="4" pattern="\d{4}" Placeholder="XXXX" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="inputThirdFour" runat="server" CssClass="form-control" autocomplete="off" MaxLength="4" pattern="\d{4}" Placeholder="XXXX" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="inputFourthFour" runat="server" CssClass="form-control" autocomplete="off" MaxLength="4" pattern="\d{4}" Placeholder="XXXX" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Card Expiry Date</label>
                                    <div class="row">
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                                                <asp:ListItem Selected="True">January</asp:ListItem>
                                                <asp:ListItem>February</asp:ListItem>
                                                <asp:ListItem>March</asp:ListItem>
                                                <asp:ListItem>April</asp:ListItem>
                                                <asp:ListItem>May</asp:ListItem>
                                                <asp:ListItem>June</asp:ListItem>
                                                <asp:ListItem>July</asp:ListItem>
                                                <asp:ListItem>August</asp:ListItem>
                                                <asp:ListItem>September</asp:ListItem>
                                                <asp:ListItem>October</asp:ListItem>
                                                <asp:ListItem>November</asp:ListItem>
                                                <asp:ListItem>December</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                                                <asp:ListItem>2014</asp:ListItem>
                                                <asp:ListItem>2015</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Card CVV</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="inputCCV" runat="server" class="form-control" autocomplete="off" MaxLength="3" pattern="\d{3}" Placeholder="XXX" required="required" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:Image runat="server" ImageUrl="img/creditCvv.png" CssClass="img-responsive" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="row">
                            </div>
                            <div>
                                &nbsp;
                            </div>
                            <div class="row visible-md visible-lg">
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="btnCancel" runat="server" class="btn btn-lg btn-warning" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel your purchase?');">Cancel</asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary pull-right" Text="SUBMIT" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                            <div class="row visible-sm visible-xs">
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="btnCancel2" runat="server" class="btn btn-warning btn-block" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel your purchase?');">Cancel</asp:LinkButton>
                                </div>
                                <div>
                                    &nbsp;
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="btnSubmit2" runat="server" class="btn btn-primary btn-block" Text="SUBMIT" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <h1 class="text-center">You are purchasing:</h1>
                            <div class="text-center"><asp:Image ID ="imgPurchasing" runat="server" CssClass="img-responsive  " Style="display:initial"/></div>
                            <h4>Book Name: <b><asp:Label ID="namePurchasing" runat="server"  ></asp:Label></b></h4>
                            <h4>Book Author: <b><asp:Label ID="authorPurchasing" runat="server" ></asp:Label>   </b></h4>
                            <div><asp:Label ID="descriptionPurchasing" runat="server" ></asp:Label></div>
                          <div class="text-center"><asp:Label runat="server" CssClass="fa-4x" Text="Price: " ></asp:Label><asp:Label ID="pricePurchasing" runat="server" CssClass="fa-4x" ></asp:Label></div>
                        </div>
                    <%--</asp:Label>--%>
                </div>

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

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>




