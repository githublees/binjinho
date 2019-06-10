function chat(){

	if($("#footer1").css("display") == "none"){   
		$("#footer1").show(100, function(){
			$('.slider').toggleClass('close');
		  });
	}else {
		$('.slider').toggleClass('close');
		$("#footer1").hide();
	}
};