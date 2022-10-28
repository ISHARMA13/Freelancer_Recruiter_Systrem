var count=1;//Number(localStorage.getItem("countedu"))||

document.getElementById("eduadd").addEventListener("click", function(event){
	  event.preventDefault();
	  var id = "edu".concat(count);
	  console.log(count);
	  
	  document.getElementById(id).innerHTML=document.getElementById(id).innerHTML+`<div class="inneredu"><label for="university`+count+`">Institute:</label>
		<input type="text" name="university`+count+`" id="university`+count+`" required> <br>
		
		<label for="degree`+count+`">Degree:</label>
		<input type="text" name="degree`+count+`" id="degree`+count+`"> <br>
		
		<label for="start`+count+`">Start Date:</label>
		<input type="date" name="start`+count+`" id="start`+count+`" required> <br>
		
		<label for="end`+count+`">End date (expected):</label>
		<input type="date" name="end`+count+`" id="end`+count+`" required> <br></div>`;
	  count+=1;
	  if(count==3){
		  document.getElementById("eduadd").style.display="none";
	  }
	  if(count>1){
		  document.getElementById("edudel").style.display="block";
	  }
	  //localStorage.setItem("countedu",count);
	  return false;
	});
	
document.getElementById("edudel").addEventListener("click", function(event){
	  event.preventDefault();
	  
	  count-=1;
	  var id = "edu".concat(count);
	  console.log(id);

		document.getElementById(id).innerHTML="";

	  if(count<3){
		  document.getElementById("eduadd").style.display="block";
	  }
	  if(count<=1){
		  document.getElementById("edudel").style.display="none";
	  }

	  //localStorage.setItem("countedu",count);
	  return false;
	});