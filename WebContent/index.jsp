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
	var zone = "05:30";  


	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		selectable:true,
		selectHelper:true,
		
		select: function(start, end, allDay)
		{
			/*
				after selection user will be promted for enter title for event.
			*/
			var title = prompt('Event Title:');
		
			/*
				if title is enterd calendar will add title and event into fullCalendar.
			*/
			if (title)
			{
				
				test={'title':title,'start':start,'end':end};
			  	
			  	$.ajax({
			    	url: 'AddEvent',
			    	data: 'title='+title+'&start='+start.format("YYYY-MM-DD HH:mm:SS")+'&zone='+zone+'&end='+end.format("YYYY-MM-DD[T]HH:mm:SS")+'&zone='+zone,
			    	type: 'post',
			    	dataType: 'json',
			    	success: function(data){
			    		
			      console.log(data);
			    	},
			    	error: function(e){
			      	console.log(e.responseText+"ERROR");
			    	}
			   });
			  	$('#calendar').fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				
			}
			$('#calendar').fullCalendar('unselect');
		},
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: "/CalendarWeb/UpdateServlet"
	});
	
	 
	 
});
</script>
<style>
#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}
	
</style>
</head>
<body>
<%
String idUsers=(String)session.getAttribute("idUsers");

%>
Welcome :: ${idUsers}
<a href="LogoutServlet">Logout</a>|

<form action="ShareServlet" method="POST">
<table>
<tr>
<td>Enter the ID of the person you want to share your calendar with</td>
<td><input type='text' name='id_user'></td>
</tr>
<tr>
<td><input type='submit' value='Share'></td>
</tr>

</table>
</form>
<br>
<br>
<form action="ViewShareServlet" method="POST">
<table>
<tr>
<td>View Calendars that were shared with you</td>

</tr>
<tr>
<td><input type='submit' value='View'></td>
</tr>

</table>
</form>

<div id='calendar'>
</div>
 

 

</body>
</html>