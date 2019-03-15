var req;
function registerNewUser()
{
	if(window.XMLHttpRequest){
		req=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		req=new ActiveXObject("Microsoft.XMLHTTP");
	}
	var username=document.registation_form.username.value;
	var email=document.registation_form.email.value;
	var password=document.registation_form.password.value;
	var firstname=document.registation_form.firstname.value;
	var lastname=document.registation_form.lastname.value;
	var mobile=document.registation_form.mobile.value;
	
	
		var url="Registration_jsp.jsp?username="+escape(username)+"&email="+escape(email)+"&password="+escape(password)+"&fistname="+escape(firstname)+"&lastname="+escape(lastname)+"&mobile="+escape(mobile);
		req.open("get",url,true);
		req.onreadystatechange = callback;
		req.send(null);
	
}	

function callback()
{
	if(req.readyState == 4) {
		if(req.status == 200 )
		{
			document.getElementById("statusPage").innerHTML=req.responseText;
			
			
		}
	}
}