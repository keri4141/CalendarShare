<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>

<script src="js/react.min.js" charset="utf-8"></script>
    <script src="js/react-dom.min.js" charset="utf-8"></script>
    <script src="js/browser.min.js" charset="utf-8"></script>
   

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react-bootstrap/0.30.7/react-bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">

<style>

#containment
{
width:70%;
}

</style>


</head>
<body>
<center>
LOGIN PAGE
<br><br>
${msg}
<br><br>
<script type="text/babel">
  var Form = ReactBootstrap.Form;
  var FormGroup = ReactBootstrap.FormGroup;
  var FormControl = ReactBootstrap.FormControl;
  var Col= ReactBootstrap.Col;
  var ControlLabel = ReactBootstrap.ControlLabel;
  var ButtonGroup = ReactBootstrap.ButtonGroup,
            Button  = ReactBootstrap.Button;

           
const formInstance = (
 <Form action='LoginServlet' method='post' horizontal>

  <FormGroup controlId="formHorizontalEmail">
      <Col componentClass={ControlLabel} sm={2}>
        User Name
      </Col>
      <Col sm={10}>
        <FormControl input type='text' name='username' placeholder="User Name" />
      </Col>
    </FormGroup>

    <FormGroup controlId="formHorizontalPassword">
      <Col componentClass={ControlLabel} sm={2}>
        Password
      </Col>
      <Col sm={10}>
        <FormControl input type='text' name='password' />
      </Col>
    </FormGroup>

   

    <FormGroup>
      <Col smOffset={2} sm={10}>
        <Button type="submit">
          Sign in
        </Button>
      </Col>
    </FormGroup>
	
  </Form>
);

ReactDOM.render(formInstance, document.getElementById("LOGIN"));

</script>

<div id="containment">
<div id="LOGIN"></div>
</div>

</center>
</body>
</html>