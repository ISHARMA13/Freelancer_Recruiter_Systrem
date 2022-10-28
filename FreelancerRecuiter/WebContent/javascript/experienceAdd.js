var count=1;//Number(localStorage.getItem("countedu"))||

document.getElementById("expadd").addEventListener("click", function(event){
	  event.preventDefault();
	  var id = "exp".concat(count);
	  console.log(count);
	  
	  document.getElementById(id).innerHTML=document.getElementById(id).innerHTML+`<div class="innerexp"><label for="company`+count+`">Company:</label>
		<input type="text" name="company`+count+`" id="company`+count+`" required> <br>
		
		<label for="title`+count+`">Title:</label>
		<input type="text" name="title`+count+`" id="title`+count+`"> <br>
		
		<label for="Xstart`+count+`">Start Date:</label>
		<input type="date" name="Xstart`+count+`" id="Xstart`+count+`" required> <br>
		
		<label for="Xend`+count+`">End date (expected):</label>
		<input type="date" name="Xend`+count+`" id="Xend`+count+`" required> <br>
		
		<label for="description`+count+`">Description:</label> <br>
		<textarea id="description`+count+`" name="description`+count+`" rows="7" cols="50"></textarea> <br></div>`;
	  count+=1;
	  if(count==3){
		  document.getElementById("expadd").style.display="none";
	  }
	  if(count>1){
		  document.getElementById("expdel").style.display="block";
	  }
	  //localStorage.setItem("countedu",count);
	  return false;
	});
	
document.getElementById("expdel").addEventListener("click", function(event){
	  event.preventDefault();
	  
	  count-=1;
	  var id = "exp".concat(count);
	  console.log(id);

		document.getElementById(id).innerHTML="";

	  if(count<3){
		  document.getElementById("expadd").style.display="block";
	  }
	  if(count<=1){
		  document.getElementById("expdel").style.display="none";
	  }

	  //localStorage.setItem("countedu",count);
	  return false;
	});