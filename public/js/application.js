$(document).ready(function() {


  $("#add_question").on('click', function(e){
    e.preventDefault();
    $.ajax ({
      type: 'post',
      url: '/survey'
    }).done(function(response) {
      $(".dynamic_form").html(response)
    })  
  })


  $(document).on("change", ".drop_down", function(){
    var selectedValue = parseInt($(this).val());
    console.log(selectedValue);


      switch(selectedValue){
        case 1:
          displayFreeResponseSection();
          break;
        case 2:
          displayMultipleChoiceSection();
          break;
        // default:
        //   alert("catch default")
        //   break;
      }

  });

  function displayFreeResponseSection(){
    $(".mult_choice").remove();
    $("#option_amount").html("<textarea id='free_response' name='prompt' placeholder='Input Choice'/></textarea>");
  }

  function displayMultipleChoiceSection(){
    $("#free_response").remove();
    $("#option_amount").html("<select class='mult_choice'><option id='option' value='0'></option><option id='option' value='2'>2 Options</option><option id='option'  value='3'>3 Options</option><option id='option' value='4'>4 Options</option></select><br>");
  }

  $(document).on("change", '.mult_choice', function(){

    var multSelectedValue = parseInt($(this).val());

    var choices = ''
      
      for (var i=1; i < multSelectedValue + 1; i++)
        {
          choices = choices + ("<br>Choice " + i + ": <input type='text' name='choice" + i + "'><br>");
        }

    $("#option_field").html(choices);

    });

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
