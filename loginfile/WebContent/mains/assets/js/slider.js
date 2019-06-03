$('.triggerbtn').click(function() {
	
	 if($("#footer1").css("display") == "none"){   
	        jQuery('#footer1').show();
	    }
	 else {  
	        jQuery('#footer1').hide();
	    }  
	 $('.slider').toggleClass('close');
	});