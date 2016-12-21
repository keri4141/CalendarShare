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
		selectable:true,
		selectHelper:true,
		
		
		navLinks: true, // can click day/week names to navigate views
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		events: "/CalendarWeb/ViewSharedCalendarsServlet"
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

<div id='calendar'>
</div>
 

 

</body>
</html>