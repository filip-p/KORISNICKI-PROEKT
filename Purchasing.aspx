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
                                <asp:LinkButton ID="lnkAdminPage" Visible="false" runat="server" OnClick="lnkAdminPage_Click"><span class="glyphicon glyphicon-user"></span> Admin Page</asp:LinkButton></li>
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
                                <asp:TextBox ID="inputCardName" class="form-control" pattern="\w+ \w+.*" runat="server"></asp:TextBox>
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
                                        <asp:TextBox ID="inputCCV" runat="server" class="form-control" autocomplete="off" MaxLength="3" pattern="\d{3}" Placeholder="XXX" TextMode="Number"></asp:TextBox>
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
                        <hr />
                        <div class="row">
                            <div class="col-md-12 jumbotron">
                                <h4 class="text-center">Not sure you have sufficient funds? Change currencies using our currency converter service</h4>
                                <div class="form-group">
                                    <label for="ddlCurrency">Select Currency</label>
                                    <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True" Value="AED">United Arab Emirates Dirham (AED)</asp:ListItem>
                                        <asp:ListItem Value="AFN">Afghan Afghani (AFN)</asp:ListItem>
                                        <asp:ListItem Value="ALL">Albanian Lek (ALL)</asp:ListItem>
                                        <asp:ListItem Value="AMD">Armenian Dram (AMD)</asp:ListItem>
                                        <asp:ListItem Value="ANG">Netherlands Antillean Guilder (ANG)</asp:ListItem>
                                        <asp:ListItem Value="AOA">Angolan Kwanza (AOA)</asp:ListItem>
                                        <asp:ListItem Value="ARS">Argentine Peso (ARS)</asp:ListItem>
                                        <asp:ListItem Value="AUD">Australian Dollar (A$)</asp:ListItem>
                                        <asp:ListItem Value="AWG">Aruban Florin (AWG)</asp:ListItem>
                                        <asp:ListItem Value="AZN">Azerbaijani Manat (AZN)</asp:ListItem>
                                        <asp:ListItem Value="BAM">Bosnia-Herzegovina Convertible Mark (BAM)</asp:ListItem>
                                        <asp:ListItem Value="BBD">Barbadian Dollar (BBD)</asp:ListItem>
                                        <asp:ListItem Value="BDT">Bangladeshi Taka (BDT)</asp:ListItem>
                                        <asp:ListItem Value="BGN">Bulgarian Lev (BGN)</asp:ListItem>
                                        <asp:ListItem Value="BHD">Bahraini Dinar (BHD)</asp:ListItem>
                                        <asp:ListItem Value="BIF">Burundian Franc (BIF)</asp:ListItem>
                                        <asp:ListItem Value="BMD">Bermudan Dollar (BMD)</asp:ListItem>
                                        <asp:ListItem Value="BND">Brunei Dollar (BND)</asp:ListItem>
                                        <asp:ListItem Value="BOB">Bolivian Boliviano (BOB)</asp:ListItem>
                                        <asp:ListItem Value="BRL">Brazilian Real (R$)</asp:ListItem>
                                        <asp:ListItem Value="BSD">Bahamian Dollar (BSD)</asp:ListItem>
                                        <asp:ListItem Value="BTC">Bitcoin (฿)</asp:ListItem>
                                        <asp:ListItem Value="BTN">Bhutanese Ngultrum (BTN)</asp:ListItem>
                                        <asp:ListItem Value="BWP">Botswanan Pula (BWP)</asp:ListItem>
                                        <asp:ListItem Value="BYR">Belarusian Ruble (BYR)</asp:ListItem>
                                        <asp:ListItem Value="BZD">Belize Dollar (BZD)</asp:ListItem>
                                        <asp:ListItem Value="CAD">Canadian Dollar (CA$)</asp:ListItem>
                                        <asp:ListItem Value="CDF">Congolese Franc (CDF)</asp:ListItem>
                                        <asp:ListItem Value="CHF">Swiss Franc (CHF)</asp:ListItem>
                                        <asp:ListItem Value="CLF">Chilean Unit of Account (UF) (CLF)</asp:ListItem>
                                        <asp:ListItem Value="CLP">Chilean Peso (CLP)</asp:ListItem>
                                        <asp:ListItem Value="CNH">CNH (CNH)</asp:ListItem>
                                        <asp:ListItem Value="CNY">Chinese Yuan (CN¥)</asp:ListItem>
                                        <asp:ListItem Value="COP">Colombian Peso (COP)</asp:ListItem>
                                        <asp:ListItem Value="CRC">Costa Rican Colón (CRC)</asp:ListItem>
                                        <asp:ListItem Value="CUP">Cuban Peso (CUP)</asp:ListItem>
                                        <asp:ListItem Value="CVE">Cape Verdean Escudo (CVE)</asp:ListItem>
                                        <asp:ListItem Value="CZK">Czech Republic Koruna (CZK)</asp:ListItem>
                                        <asp:ListItem Value="DEM">German Mark (DEM)</asp:ListItem>
                                        <asp:ListItem Value="DJF">Djiboutian Franc (DJF)</asp:ListItem>
                                        <asp:ListItem Value="DKK">Danish Krone (DKK)</asp:ListItem>
                                        <asp:ListItem Value="DOP">Dominican Peso (DOP)</asp:ListItem>
                                        <asp:ListItem Value="DZD">Algerian Dinar (DZD)</asp:ListItem>
                                        <asp:ListItem Value="EGP">Egyptian Pound (EGP)</asp:ListItem>
                                        <asp:ListItem Value="ERN">Eritrean Nakfa (ERN)</asp:ListItem>
                                        <asp:ListItem Value="ETB">Ethiopian Birr (ETB)</asp:ListItem>
                                        <asp:ListItem Value="EUR">Euro (€)</asp:ListItem>
                                        <asp:ListItem Value="FIM">Finnish Markka (FIM)</asp:ListItem>
                                        <asp:ListItem Value="FJD">Fijian Dollar (FJD)</asp:ListItem>
                                        <asp:ListItem Value="FKP">Falkland Islands Pound (FKP)</asp:ListItem>
                                        <asp:ListItem Value="FRF">French Franc (FRF)</asp:ListItem>
                                        <asp:ListItem Value="GBP">British Pound (£)</asp:ListItem>
                                        <asp:ListItem Value="GEL">Georgian Lari (GEL)</asp:ListItem>
                                        <asp:ListItem Value="GHS">Ghanaian Cedi (GHS)</asp:ListItem>
                                        <asp:ListItem Value="GIP">Gibraltar Pound (GIP)</asp:ListItem>
                                        <asp:ListItem Value="GMD">Gambian Dalasi (GMD)</asp:ListItem>
                                        <asp:ListItem Value="GNF">Guinean Franc (GNF)</asp:ListItem>
                                        <asp:ListItem Value="GTQ">Guatemalan Quetzal (GTQ)</asp:ListItem>
                                        <asp:ListItem Value="GYD">Guyanaese Dollar (GYD)</asp:ListItem>
                                        <asp:ListItem Value="HKD">Hong Kong Dollar (HK$)</asp:ListItem>
                                        <asp:ListItem Value="HNL">Honduran Lempira (HNL)</asp:ListItem>
                                        <asp:ListItem Value="HRK">Croatian Kuna (HRK)</asp:ListItem>
                                        <asp:ListItem Value="HTG">Haitian Gourde (HTG)</asp:ListItem>
                                        <asp:ListItem Value="HUF">Hungarian Forint (HUF)</asp:ListItem>
                                        <asp:ListItem Value="IDR">Indonesian Rupiah (IDR)</asp:ListItem>
                                        <asp:ListItem Value="IEP">Irish Pound (IEP)</asp:ListItem>
                                        <asp:ListItem Value="ILS">Israeli New Sheqel (₪)</asp:ListItem>
                                        <asp:ListItem Value="INR">Indian Rupee (Rs.)</asp:ListItem>
                                        <asp:ListItem Value="IQD">Iraqi Dinar (IQD)</asp:ListItem>
                                        <asp:ListItem Value="IRR">Iranian Rial (IRR)</asp:ListItem>
                                        <asp:ListItem Value="ISK">Icelandic Króna (ISK)</asp:ListItem>
                                        <asp:ListItem Value="ITL">Italian Lira (ITL)</asp:ListItem>
                                        <asp:ListItem Value="JMD">Jamaican Dollar (JMD)</asp:ListItem>
                                        <asp:ListItem Value="JOD">Jordanian Dinar (JOD)</asp:ListItem>
                                        <asp:ListItem Value="JPY">Japanese Yen (¥)</asp:ListItem>
                                        <asp:ListItem Value="KES">Kenyan Shilling (KES)</asp:ListItem>
                                        <asp:ListItem Value="KGS">Kyrgystani Som (KGS)</asp:ListItem>
                                        <asp:ListItem Value="KHR">Cambodian Riel (KHR)</asp:ListItem>
                                        <asp:ListItem Value="KMF">Comorian Franc (KMF)</asp:ListItem>
                                        <asp:ListItem Value="KPW">North Korean Won (KPW)</asp:ListItem>
                                        <asp:ListItem Value="KRW">South Korean Won (₩)</asp:ListItem>
                                        <asp:ListItem Value="KWD">Kuwaiti Dinar (KWD)</asp:ListItem>
                                        <asp:ListItem Value="KYD">Cayman Islands Dollar (KYD)</asp:ListItem>
                                        <asp:ListItem Value="KZT">Kazakhstani Tenge (KZT)</asp:ListItem>
                                        <asp:ListItem Value="LAK">Laotian Kip (LAK)</asp:ListItem>
                                        <asp:ListItem Value="LBP">Lebanese Pound (LBP)</asp:ListItem>
                                        <asp:ListItem Value="LKR">Sri Lankan Rupee (LKR)</asp:ListItem>
                                        <asp:ListItem Value="LRD">Liberian Dollar (LRD)</asp:ListItem>
                                        <asp:ListItem Value="LSL">Lesotho Loti (LSL)</asp:ListItem>
                                        <asp:ListItem Value="LTL">Lithuanian Litas (LTL)</asp:ListItem>
                                        <asp:ListItem Value="LVL">Latvian Lats (LVL)</asp:ListItem>
                                        <asp:ListItem Value="LYD">Libyan Dinar (LYD)</asp:ListItem>
                                        <asp:ListItem Value="MAD">Moroccan Dirham (MAD)</asp:ListItem>
                                        <asp:ListItem Value="MDL">Moldovan Leu (MDL)</asp:ListItem>
                                        <asp:ListItem Value="MGA">Malagasy Ariary (MGA)</asp:ListItem>
                                        <asp:ListItem Value="MKD">Macedonian Denar (MKD)</asp:ListItem>
                                        <asp:ListItem Value="MMK">Myanmar Kyat (MMK)</asp:ListItem>
                                        <asp:ListItem Value="MXN">Mexican Peso (MX$)</asp:ListItem>
                                        <asp:ListItem Value="NOK">Norwegian Krone (NOK)</asp:ListItem>
                                        <asp:ListItem Value="NZD">New Zealand Dollar (NZ$)</asp:ListItem>
                                        <asp:ListItem Value="PAB">Panamanian Balboa (PAB)</asp:ListItem>
                                        <asp:ListItem Value="PKG">PKG (PKG)</asp:ListItem>
                                        <asp:ListItem Value="PKR">Pakistani Rupee (PKR)</asp:ListItem>
                                        <asp:ListItem Value="QAR">Qatari Rial (QAR)</asp:ListItem>
                                        <asp:ListItem Value="RON">Romanian Leu (RON)</asp:ListItem>
                                        <asp:ListItem Value="RUB">Russian Ruble (RUB)</asp:ListItem>
                                        <asp:ListItem Value="RSD">Serbian Dinar (RSD)</asp:ListItem>
                                        <asp:ListItem Value="SEK">Swedish Krona (SEK)</asp:ListItem>
                                        <asp:ListItem Value="SHP">St. Helena Pound (SHP)</asp:ListItem>
                                        <asp:ListItem Value="SKK">Slovak Koruna (SKK)</asp:ListItem>
                                        <asp:ListItem Value="SYP">Syrian Pound (SYP)</asp:ListItem>
                                        <asp:ListItem Value="SZL">Swazi Lilangeni (SZL)</asp:ListItem>
                                        <asp:ListItem Value="TRY">Turkish Lira (TRY)</asp:ListItem>
                                        <asp:ListItem Value="UAH">Ukrainian Hryvnia (UAH)</asp:ListItem>
                                        <asp:ListItem Value="UZS">Uzbekistani Som (UZS)</asp:ListItem>
                                        <asp:ListItem Value="VND">Vietnamese Dong (₫)</asp:ListItem>
                                        <asp:ListItem Value="XPF">CFP Franc (CFPF)</asp:ListItem>
                                        <asp:ListItem Value="ZAR">South African Rand (ZAR)</asp:ListItem>
                                        <asp:ListItem Value="ZMW">Zambian Kwacha (ZMW)</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group">
                                    <label for="tbCurrency">Result</label>
                                    <asp:TextBox ID="tbCurrency" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="currencyButton" runat="server" CssClass="btn btn-info" Text="Exchange Currency" OnClick="currencyButton_Click" UseSubmitBehavior="False" />
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <h1 class="text-center">You are purchasing:</h1>
                        <div class="text-center">
                            <asp:Image ID="imgPurchasing" runat="server" CssClass="img-responsive  " Style="display: initial" />
                        </div>
                        <h4>Book Name: <b>
                            <asp:Label ID="namePurchasing" runat="server" Style="text-transform: none;"></asp:Label></b></h4>
                        <h4>Book Author: <b>
                            <asp:Label ID="authorPurchasing" runat="server" Style="text-transform: none;"></asp:Label>
                        </b></h4>
                        <h4>Book Description: <b>
                            <asp:Label ID="descriptionPurchasing" runat="server" Style="text-transform: none;"></asp:Label></b></h4>
                        <div class="text-center">
                            <asp:Label runat="server" CssClass="fa-4x" Text="Price: "></asp:Label><asp:Label ID="pricePurchasing" runat="server" CssClass="fa-4x"></asp:Label>
                        </div>
                    </div>
                    <%--</asp:Label>--%>
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




