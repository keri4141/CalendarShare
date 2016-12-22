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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css">

<script type="text/babel">

class Calendar extends React.Component
{
	componentDidMount()
	{	
		const{calendar}=this.refs;

		$(calendar).fullCalendar({

		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
	

		navLinks: true, // can click day/week names to navigate views
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		events:this.props.events

		});

	}
render()
{
	return(
	<div ref="calendar"></div>
	);
}
}

class App extends React.Component
{

	render(){
		let events="/CalendarWeb/ViewSharedCalendarsServlet";

	return(
		<div>
		<Calendar events={events}/>
		</div>
		);
}


}
ReactDOM.render(<App />,document.getElementById('app'));


</script>
<style>
#app {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

<div id='app'>
</div>
 

 

</body>
</html>