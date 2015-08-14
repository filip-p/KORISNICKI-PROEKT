<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customCss.css" rel="stylesheet">
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <title>Book Exchange Admin Page</title>
     <!-- jQuery -->
        <script src="js/jquery.js"></script>
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
                            <li>
                                <asp:LinkButton ID="lnkContactAbout" runat="server" OnClick="lnkContactAbout_Click"><span class="glyphicon glyphicon-info-sign"></span> Contact/About</asp:LinkButton></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 1em">
                            <li class="active">
                                <asp:LinkButton ID="lnkAdminPage" runat="server" OnClick="lnkAdminPage_Click"><span class="glyphicon glyphicon-user"></span> Admin Page</asp:LinkButton></li>
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

        <div class="container-fluid" style="padding-top: 5%;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header text-center">Users in the database</h1>
                        <asp:GridView ID="gvUsersInDB" Style="text-transform: none" CssClass="table table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvUsersInDB_PageIndexChanging" PageSize="3">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="User Id" ReadOnly="True" />
                                <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" />
                                <asp:BoundField DataField="password" HeaderText="Password" ReadOnly="True" />
                                <asp:BoundField DataField="email" HeaderText="E-mail" ReadOnly="True" />
                                <asp:BoundField DataField="faculty" HeaderText="Faculty" ReadOnly="True" />
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowEditButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </div>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header text-center">Books in the database</h1>
                        <asp:GridView ID="gvBooksInDB" CssClass="table table-hover table-responsive" Style="text-transform: none" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="3" OnRowCancelingEdit="gvBooksInDB_RowCancelingEdit" OnRowEditing="gvBooksInDB_RowEditing" OnRowUpdating="gvBooksInDB_RowUpdating" OnPageIndexChanging="gvBooksInDB_PageIndexChanging" OnRowDeleting="gvBooksInDB_RowDeleting">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="<h3>Book Name</h3>" HeaderStyle-CssClass="col-md-3 text-center">
                                    <ItemTemplate>
                                        <div class="text-center">
                                            <h4 class="text-center">
                                                <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                                            </h4>
                                            <img class="img-responsive" src='data:image/jpg;base64,<%# Eval("BookImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("BookImage")) : string.Empty %>' alt="image" style="width: 300px; height: 300px" />
                                            <h5 class="text-center">
                                                <asp:Label ID="Label1" runat="server" Text="Book ID = "></asp:Label>
                                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                            </h5>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-md-3 text-center" Wrap="True"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="<h3>Book Author & Description</h3>" HeaderStyle-CssClass="col-md-4 text-center">
                                    <ItemTemplate>
                                        <div>
                                            <h4 class="text-center">
                                                <asp:Label runat="server" DataField="BookAuthor" Text='<%# Eval("BookAuthor") %>'></asp:Label></h4>
                                            <hr />
                                            <asp:Label runat="server" ID="lblBookDescription" DataField="BookDescription" Text='<%# Bind("BookDescription") %>' />
                                            <asp:TextBox runat="server" ReadOnly="True" Style="resize: none; overflow: auto" ID="tbBookDescription" DataField="BookDescription" Text='<%# Bind("BookDescription") %>' TextMode="MultiLine" Rows="13" Visible="False" Width="400"></asp:TextBox>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-md-4 text-center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="<h3>Seller</h3>" HeaderStyle-CssClass="col-md-3 text-center">
                                    <ItemTemplate>
                                        <h4 class="text-center">Seller ->
                                            <asp:Label runat="server" DataField="BookSellerUser" Text='<%# Eval("BookSellerUser") %>' /></h4>
                                        <hr />
                                        <h4 class="text-center">
                                            <asp:Label runat="server" DataField="BookPrice" Text='<%# Eval("BookPrice") != System.DBNull.Value  ? string.Format("Price = {0}",Eval("BookPrice")) : string.Format("This book is for exchange only")%>' /></h4>
                                        <hr />
                                        <p class="text-center">
                                            <asp:Label runat="server" DataField="BookNeededForExchange" Text='<%# Eval("BookNeededForExchange") != System.DBNull.Value  ? string.Format("Exchangeable for :<br>{0}",Eval("BookNeededForExchange")) : string.Format("This book is only for sale")%>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-md-3 text-center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="buttonsMiddle">
                                    <EditItemTemplate>
                                        <div class="text-center">
                                            <asp:LinkButton ID="linkButtonUpdate" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Update"><asp:Label runat="server" CssClass="glyphicon glyphicon-ok"></asp:Label> Update</asp:LinkButton>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div class="text-center">
                                            <asp:LinkButton ID="linkButtonEdit" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Edit"><asp:Label runat="server" CssClass="glyphicon glyphicon-edit"></asp:Label> Edit</asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-md-1 text-center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="buttonsMiddle">
                                    <ItemTemplate>
                                        <div class="text-center">
                                            <asp:LinkButton Visible="false" ID="linkButtonCancel" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel"><asp:Label runat="server" CssClass="glyphicon glyphicon-remove"></asp:Label> Cancel</asp:LinkButton>
                                            <asp:LinkButton ID="linkButtonDelete" runat="server" CssClass="btn btn-warning" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete that item?');" ><asp:Label runat="server" CssClass="glyphicon glyphicon-trash"></asp:Label> Delete</asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-md-1 text-center"></HeaderStyle>
                                </asp:TemplateField>



                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Position="TopAndBottom" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Wrap="True" Font-Size="Large" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>

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
        </div>
       

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>

    </form>
</body>
</html>
