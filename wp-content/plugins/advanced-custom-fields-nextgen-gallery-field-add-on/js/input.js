(function($){
	
	
	function initialize_field( $el ) {
		
		//$el.doStuff();
			
	}
	
	
	function acf_show_multiselect_size( $el ) {
		
		// vars
		var $input = $el.find('.acf-ngg-input-method');
		
		if ($input.val() == 'multiselect') {
			
			$el.find('.acf-field[data-name="multiple_size"]').show();
			
		} else {
			
			$el.find('.acf-field[data-name="multiple_size"]').hide();
			
		}
		
	}
	
	
	$(document).on('change', '.acf-ngg-input-method', function(){
		//alert ('ready');
		acf_show_multiselect_size( $(this).closest('.field') );
		
	});
	
	$(document).ready(function() {
		
		acf_show_multiselect_size( $('.acf-ngg-input-method').closest('.field') );
		
	});


})(jQuery);
