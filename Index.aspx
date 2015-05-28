<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background:url(img/HomeImg.jpg) no-repeat center center fixed; background-color: #577492">
<head runat="server">
    <meta charset = "UTF-8">
<!-- Bootstrap Core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Fonts -->
	    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius:0px">
		<div class="container">
			<a class="navbar-brand" href="#">Book Exchange</a>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
		    	<li ><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Catalog</a></li>
		    	<li ><a href="#"><span class="glyphicon glyphicon-user"></span> About</a></li>
      		</ul>
      		<ul class="nav navbar-nav navbar-right">
       			 <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
		    </ul>
		</div>
	</nav>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
             <%--   <h1><img src="img/HomeImg.jpg"</h1>--%>
            </div>
        </div>
        <!----</h1> -->
    </div>

	<!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
