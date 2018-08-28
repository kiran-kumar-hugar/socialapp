
function sendRequest(id){
 $.ajax({
 url: "/send_request", 
 type: "POST",
 data:{ "id": id },
 success: function(result){
	 if(result.status == 'success'){
	 		$('#status').css('display','block').text(result.message)
	 		setTimeout(function(){
				$('#status').css('display','none').text('')
	 			},3000)
	 }else{
			$('#status').css('display','block').text(result.message)
			setTimeout(function(){
				$('#status').css('display','none').text('')
	 			},3000)
	 }

  }});
}

