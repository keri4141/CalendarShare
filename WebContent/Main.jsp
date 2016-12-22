<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>

<script src="js/react.min.js" charset="utf-8"></script>
    <script src="js/react-dom.min.js" charset="utf-8"></script>
    <script src="js/browser.min.js" charset="utf-8"></script>
   

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react-bootstrap/0.30.7/react-bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
</head>
<body>


<div id="content"></div>
<div id="test"></div>
<script type="text/babel">



    var LoginRegButtons = React.createClass({
    render: function() {

        var ButtonGroup = ReactBootstrap.ButtonGroup,
            Button  = ReactBootstrap.Button;

        return (
				
	<div>

		<center>
			<h1>
					Main Page </h1>
			<form action="login.jsp" method="post" id="loginPage">
			 <ButtonGroup>
			<Button bsStyle="primary" bsSize="large" block type="submit" id="loginPage" value="Submit">Go to Login Page</Button>
			 </ButtonGroup>
			</form>
			<br/>
			<br/>
			
			
			
			<form action="register.jsp" method="post" id="registerPage">
			<ButtonGroup>
			<Button bsStyle="primary" bsSize="large" block type="submit" id="registerPage" value="Submit">Go to Registration Page</Button>
			</ButtonGroup>
			</form>
			
		</center>
		</div>


              );
    }
});

ReactDOM.render(<LoginRegButtons />, document.getElementById("content"));


</script>


</body>
</html>