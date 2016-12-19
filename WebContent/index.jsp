<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>


 

 
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css">

<script>
$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		defaultDate: '2016-12-12',
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'All Day Event',
				start: '2016-12-01'
			},
			{
				title: 'Long Event',
				start: '2016-12-07',
				end: '2016-12-10'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-12-09T16:00:00'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-12-16T16:00:00'
			},
			{
				title: 'Conference',
				start: '2016-12-11',
				end: '2016-12-13'
			},
			{
				title: 'Meeting',
				start: '2016-12-12T10:30:00',
				end: '2016-12-12T12:30:00'
			},
			{
				title: 'Lunch',
				start: '2016-12-12T12:00:00'
			},
			{
				title: 'Meeting',
				start: '2016-12-12T14:30:00'
			},
			{
				title: 'Happy Hour',
				start: '2016-12-12T17:30:00'
			},
			{
				title: 'Dinner',
				start: '2016-12-12T20:00:00'
			},
			{
				title: 'Birthday Party',
				start: '2016-12-13T07:00:00'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2016-12-28'
			}
		]
	});
	
});
</script>
<style>
#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>
</head>
<body>
<a href="LogoutServlet">Logout</a>|
<div id='calendar'></div>
 

 

</body>
</html>