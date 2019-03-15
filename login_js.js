var req;
function validate()
{
	var username=document.login_form.username.value;
	var password=document.login_form.password.value;
	var url="Login_jsp.jsp?username="+escape(username)+"&password="+escape(password);
	if(window.XMLHttpRequest)
	{
		req=new XMLHttpRequest();
	}
	else if(window.ActiveXobject)
	{
		req = new ActiveXobject("Microsoft.XMLHTTP");
	}
	req.open("get",url,true);
	req.onreadystatechange=callback;
	req.send(null);

}
 function callback() {
	
	if(req.readyState == 4) {
		if(req.status == 200 )
		{
			//var jsp_response = new String (req.responseText);
			alert(req.responsetext);
			document.getElementById("statusPage").innerHTML=req.responseText;
			//document.write(req.responsetext)
		}
	}
}