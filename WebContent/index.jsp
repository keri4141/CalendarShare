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

 <!--  
<script src="https://unpkg.com/react@15/dist/react.min.js"></script>
<script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
    -->
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
var currentMousePos = {
		  	x: -1,
		  	y: -1
		};

		  	jQuery(document).on("mousemove", function (event) {
		   currentMousePos.x = event.pageX;
		   currentMousePos.y = event.pageY;
		});
		$(calendar).fullCalendar({

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
			
			var title = prompt('Event Title:');
		
			
			if (title)
			{
				
				
			  	
			  	$.ajax({
			    	url: 'AddEvent',
			    	data: 'title='+title+'&start='+start.format("YYYY-MM-DD HH:mm:SS")+'&end='+end.format("YYYY-MM-DD[T]HH:mm:SS"),
			    	type: 'post',
			    	dataType: 'json',
			    	success: function(response){
			    		
			      console.log(data);
			    	},
			    	error: function(e){
					window.location.reload();
			      	console.log(e.responseText+"ERROR");
			    	}
			   });
			  	$(calendar).fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				
			}
			$(calendar).fullCalendar('unselect');
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
			          	
			            	$(calendar).fullCalendar('refetchEvents'); //refetch updates calendar
			            	
			        	},
			        	error: function(e){
			        		$(calendar).fullCalendar('refetchEvents');
			        	}
			       });
			    	}
			  	}
			},
			eventResize: function(event, delta, revertFunc) {
				 var title = event.title;
				   var start = event.start;
				   var end = event.end;
				   var type= "resize";
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
						
					}
				});
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
				      	
						
				      	revertFunc();
				    	},
				    	error: function(e){
				      	
				      	
				    	}
				    	});
				},
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events:this.props.events

		});
//if grabbed events are hovering over trash can div
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
		let events="/CalendarWeb/UpdateServlet";

	return(
		<div>
		<Calendar events={events}/>
		</div>
		);
}


}
ReactDOM.render(<App />,document.getElementById('app'));
</script>
<script>
/*
$(document).ready(function() {
	 
	
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
			
			var title = prompt('Event Title:');
		
			
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
			eventResize: function(event, delta, revertFunc) {
				 var title = event.title;
				   var start = event.start;
				   var end = event.end;
				   var type= "resize";
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
						
					}
				});
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
				      
				      	revertFunc();
				    	},
				    	error: function(e){
				      	;
				      	
				    	}
				    	});
				},
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: "/CalendarWeb/UpdateServlet"
	});
	//if grabbed events are hovering over trash can div
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
 
	 
});*/
</script>
<style>
#app {
		max-width: 900px;
		margin: 0 auto;
	}
	

	#trash{
		width:100px;
		height:100px;
		float:left;
		background-color:red;
		padding-bottom: 15px;
		position: relative;
	}
</style>
</head>
<body>
<%
String idUsers=(String)session.getAttribute("idUsers");

%>
Welcome, your ID is: ${idUsers}<br>
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
<br><br>


<div id="trash"> TRASH</div>
<script type="text/babel">


</script>

<div id='app'>
</div>
 

</body>
</html>