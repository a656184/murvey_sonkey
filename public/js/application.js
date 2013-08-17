$(document).ready(function() {



	$("#add_choice").on('click', function(e){
		e.preventDefault();
		console.log('hello world');
	})


		$("#add_question").on('click', function(e){
		e.preventDefault();
		console.log('goodbye world');
	})
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
