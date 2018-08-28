function sendRequestToFriend(status, message){
	if(status == 'success'){
	 		$('#status').css('display','block').text(message)
	 		setTimeout(function(){
				$('#status').css('display','none').text('')
	 			},3000)
	 }else{
			$('#status').css('display','block').text(message)
			setTimeout(function(){
				$('#status').css('display','none').text('')
	 			},3000)
	 }
}