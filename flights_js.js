var req;

function searchFlights()
{
	var trip_type=document.getElementById('trip_type').value;
	var flight_from=document.getElementById('flight_from').value;
	var flight_to=document.getElementById('flight_to').value;
	var depart_date=document.flights_form.depart_date.value;
	
	alert(depart_date);
	var url="Flights_jsp.jsp?trip_type="+escape(trip_type)+"&flight_from="+escape(flight_from)+"&flight_to="+escape(flight_to)+"&depart_date="+escape(depart_date);
	if(flight_from===flight_to)
	{
		alert("can't load request.... enter different source and destination")
	}
	else
	{

	if(window.XMLHttpRequest)
		{
			req=new XMLHttpRequest();
		}

		else if (window.ActiveXObject)
		{
			req=new ActiveXObject("Microsoft.XMLHttp");
		}
		req.open("get",url,true);
		req.onreadystatechange=callback;
		alert(url);
		req.send(null);
	}

}
function callback()
{
	if(req.readyState == 4) {
		if(req.status == 200 )
		{
			document.getElementById('detailDiv').innerHTML=req.responseText;
			
			
		}
	}
}
function oneWayVisible()
{
	document.getElementById("return_Trip").hidden=true;
	document.getElementById("one_way").hidden=false;
}
function returnTripVisible()
{
	document.getElementById("one_way").hidden=true;
	document.getElementById("return_Trip").hidden=false;
}