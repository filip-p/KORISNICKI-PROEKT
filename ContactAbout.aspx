﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactAbout.aspx.cs" Inherits="ContactAbout" %>

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
    <!--Script references. -->
    <!--Reference the jQuery library. -->
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <!--Reference the SignalR library. -->
    <script src="Scripts/jquery.signalR-2.0.0.min.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="signalr/hubs"></script>
    <!--Add script to update the page and send messages.-->
    <!-- jQuery -->
    <%--<script src="js/jquery.js"></script>--%>

    <title>Book Exchange Contact/About Page</title>

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
                            <li class="active">
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

        <div class="container" style="padding-top: 5%;">
            <%--Contact form--%>
            <div class="col-md-12 text-center">
                <h1>Contact Us</h1>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="well well-sm">
                            <div role="form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <asp:RequiredFieldValidator ID="requiredContactNameValidator" runat="server" ErrorMessage="You must enter your name!" ControlToValidate="name" Display="None" ForeColor="#CC0000" ValidationGroup="ContactUs"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="name" class="form-control" placeholder="Enter your name" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email Address</label>
                                            <div class="input-group">
                                                <asp:Label CssClass="input-group-addon" runat="server">
                                                    <asp:Label CssClass="glyphicon glyphicon-envelope" runat="server"></asp:Label>
                                                </asp:Label>
                                                <asp:RequiredFieldValidator ID="requiredContactEmailValidator" runat="server" ErrorMessage="You must enter your email!" ControlToValidate="email" ForeColor="#CC0000" Display="None" ValidationGroup="ContactUs"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="email" class="form-control" placeholder="Enter your email" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="subject">Subject</label>
                                            <asp:DropDownList ID="subject" class="form-control" runat="server">
                                                <asp:ListItem>Customer Service</asp:ListItem>
                                                <asp:ListItem>Suggestion</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Message</label>
                                            <asp:RequiredFieldValidator ID="requiredContactMessageValidator" runat="server" ErrorMessage="Please contact us with a valid message!" ControlToValidate="message" Display="None" ForeColor="#CC0000" ValidationGroup="ContactUs"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="message" class="form-control" runat="server" Style="resize: none" Columns="25" Rows="7" placeholder="Message (maximum 1000 characters)..." TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10 text-center">
                                            <asp:ValidationSummary ID="requiredContactValidationSummary" runat="server" ValidationGroup="ContactUs" ForeColor="#CC0000" DisplayMode="List" HeaderText="The following errors occured:" />
                                        </div>
                                    </div>
                                    <div class="col-md-12 visible-lg visible-md visible-sm">
                                        <asp:Button ID="btnContactUs" class="btn btn-primary pull-right" Text="Send Message" runat="server" ValidationGroup="ContactUs" />
                                    </div>
                                    <div class="col-md-12 visible-xs">
                                        <asp:Button ID="Button1" class="btn btn-primary btn-block" Text="Send Message" runat="server" ValidationGroup="ContactUs" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div role="form">
                            <h3 class="text-center"><i class="fa fa-globe"></i>Book Exchange's office</h3>
                            <div class="row text-center">
                                <h4><strong>Book Exchange, Inc.</strong></h4>
                                <h4><i class="fa fa-university"></i>st. Rugjer Boshkovikj 5</h4>
                                <h4>Skopje, Macedonia, 1000</h4>
                                <h4>
                                    <asp:Label runat="server" CssClass="glyphicon glyphicon-phone"></asp:Label>
                                    (+389) 72 253457
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--end Contact Form--%>
            <hr />

            <%--Live Chat--%>
            <div class="row">
                <div class="col-md-2">&nbsp;</div>
                <div class="col-md-8 text-center">
                    <div class="panel panel-info">
                        <div class="panel-heading">Chat live with other students!!!</div>
                        <div class="panel-body">
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="liveChatMessageBox" Placeholder="Type your message here!" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <input type="button" id="liveChatSendMessage" value="Send" class="btn btn-primary" />
                                </span>
                            </div>
                            <asp:HiddenField ID="loggedInUserName" runat="server" />
                            <asp:HiddenField ID="loggedInUserColor" runat="server" />
                            <ul id="liveChatSentMessagesField" class="text-left" style="text-transform: none; padding-top: 10px">
                            </ul>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $(function () {
                            var color = 0;
                            var chat = $.connection.chatHub;
                            chat.client.broadcastMessage = function (name, message, colors) {
                                var encodedName = $('<div />').text(name).html();
                                var encodedMsg = $('<div />').text(message).html();

                                $('#liveChatSentMessagesField').append("<li><strong style=\" color:rgb(" + colors[0] + "," + colors[1] + "," + colors[2] + "\")>" + encodedName
                                    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
                            };
                            var isLoggedIn = $('#lnkLoginRegister').text();
                            if (isLoggedIn == " Login/Register") {
                                $('#liveChatMessageBox').val("You must be logged in so you can use the live chat!");
                                $('#liveChatMessageBox').prop('readonly', true);
                                $('#liveChatSendMessage').attr('disabled', 'disabled');
                            }
                            else {
                                var color1 = Math.floor((Math.random() * 255) + 1);
                                var color2 = Math.floor((Math.random() * 255) + 1);
                                var color3 = Math.floor((Math.random() * 255) + 1);
                                $('#loggedInUserColor').val(color1.toString() + "," + color2.toString() + "," + color3.toString());
                                $('#loggedInUserName').val($('#lbUser').text().toString());
                                $('#liveChatMessageBox').focus();

                            }
                            $.connection.hub.start().done(function () {
                                $('#liveChatSendMessage').click(function () {
                                    if ($.trim($('#liveChatMessageBox').val()).length > 0) {
                                        var color = $('#loggedInUserColor').val();
                                        var colors = color.split(",");
                                        chat.server.send($('#loggedInUserName').val(), $('#liveChatMessageBox').val(), colors);
                                        $('#liveChatMessageBox').val('').focus();
                                    }
                                });
                            });
                        });
                    </script>
                </div>
                <div class="col-md-2">&nbsp;</div>
            </div>
            <%--End live chat--%>
            <%--Google maps ember iframes--%>
            <div class="row">
                <div class="col-md-12 visible-lg visible-md text-center">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h1>Find us</h1>
                        </div>
                        <div class="panel-body">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1482.4238734092603!2d21.410723!3d42.00354299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDLCsDAwJzEyLjgiTiAyMcKwMjQnMzguNiJF!5e0!3m2!1sen!2sus!4v1434900875914" width="800" height="600" frameborder="0" style="border: 0"></iframe>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 visible-sm  text-center ">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h1>Find us</h1>
                        </div>
                        <div class="panel-body">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1482.4238734092603!2d21.410723!3d42.00354299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDLCsDAwJzEyLjgiTiAyMcKwMjQnMzguNiJF!5e0!3m2!1sen!2sus!4v1434900875914" width="600" height="450" frameborder="0" style="border: 0"></iframe>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 visible-xs text-center">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h1>Find us</h1>
                        </div>
                        <div class="panel-body">

                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1482.4238734092603!2d21.410723!3d42.00354299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDLCsDAwJzEyLjgiTiAyMcKwMjQnMzguNiJF!5e0!3m2!1sen!2sus!4v1434900875914" width="250px" frameborder="0" style="border: 0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <%--end Google Maps embed iframe--%>
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
