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
	
	var currentMousePos = {
		  	x: -1,
		  	y: -1
		};

		  	jQuery(document).on("mousemove", function (event) {
		   currentMousePos.x = event.pageX;
		   currentMousePos.y = event.pageY;
		});
		  	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		selectable:true,
		selectHelper:true,
		
		//click on a box to create event
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
		//When event is over trash div, it deletes the event
		eventDragStop: function (event, jsEvent, ui, view) {
			   if (isElemOverDiv()) {
			     var con = confirm('Are you sure to delete this event permanently?');
			     if(con == true) {
			      	$.ajax({
			        	url: 'DeleteEventServlet',
			        	data: 'eventid='+event.id,
			        	type: 'POST',
			        	dataType: 'json',
			        	success: function(data){
			          	
			            	$('#calendar').fullCalendar('refetchEvents'); //refetch updates calendar
			            	
			        	},
			        	error: function(e){
			        		$('#calendar').fullCalendar('refetchEvents');
			        	}
			       });
			    	}
			  	}
			},
			eventDrop: function(event, delta, revertFunc) {
				   var title = event.title;
				   var start = event.start;
				   var end = event.end;
				   var type= "moveUpdate";
				   $.ajax({
				    	url: 'UpdateServlet',
				    	data: 'type='+type+'&eventid='+event.id+'&title='+title+'&start='+start.format("YYYY-MM-DD HH:mm:SS")+'&end='+end.format("YYYY-MM-DD[T]HH:mm:SS"),
				    	type: 'POST',
				    	dataType: 'json',
				    	success: function(response){
				      	//if(response.status != 'success')
				      	revertFunc();
				    	},
				    	error: function(e){
				      	//revertFunc();
				      	
				    	}
				    	});
				},
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: "/CalendarWeb/UpdateServlet"
	});
	
	function isElemOverDiv() {
        var trashEl = jQuery('#trash');

        var ofs = trashEl.offset();

        var x1 = ofs.left;
        var x2 = ofs.left + trashEl.outerWidth(true);
        var y1 = ofs.top;
        var y2 = ofs.top + trashEl.outerHeight(true);

        if ((currentMousePos.x >= x1 && currentMousePos.x <= x2) &&
            currentMousePos.y >= y1 && currentMousePos.y <= y2) {
            return true;
        }
        return false;
    }
 
	 
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
	
	
	#trash{
		width:50px;
		height:50px;
		float:left;
		padding-bottom: 15px;
		position: relative;
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

<div id="trash"> TRASH</div>

<div id='calendar'>
</div>
 

</body>
</html>