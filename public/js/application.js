$(document).ready(function() {


  $("#add_question").on('click', function(e){
    e.preventDefault();
// Use form.serialize() also, use nested params to be able to have > 1 choice without naming each one. 
    var data = {prompt: $('textarea[name="prompt"]').val(), choice1: $('input[name="choice1"]').val(), choice2: $('input[name="choice2"]').val(), choice3: $('input[name="choice3"]').val(), choice4: $('input[name="choice4"]').val()};
    
    $.ajax ({
      type: 'post',
      url: '/survey',
      data: data
    }).done(function(response) {
      console.log(response);
      $(".dynamic_form").html(response)
    })  
  });

  $("#finish_survey").on('click', function(e){
    e.preventDefault();

    var data = {prompt: $('textarea[name="prompt"]').val(), choice1: $('input[name="choice1"]').val(), choice2: $('input[name="choice2"]').val(), choice3: $('input[name="choice3"]').val(), choice4: $('input[name="choice4"]').val()};
    
    $.ajax ({
      type: 'post',
      url: '/survey',
      data: data
    }).done(function(response) {
      window.location = '/user'
    })  
  });


  $(document).on("change", ".drop_down", function(){
    var selectedValue = parseInt($(this).val());
// CODE REVIEW: How can you use an Object to avoid the case statement here?  This is code that looks fragile - what happens when you add 3,4 ,5 selections ? This is a great opportunity for OO Design. See (http://sandimetz.com/2009/06/ruby-case-statements-and-kindof.html) for some thoughts.

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

// CODE REVEIW: consider using a template here - also see if you can make the number of choices more flexible

  function displayMultipleChoiceSection(){
    $("#free_response").remove();
    $("#option_amount").html("<select class='mult_choice'><option id='option1' value='0'></option><option id='option2' value='2'>2 Options</option><option id='option3'  value='3'>3 Options</option><option id='option4' value='4'>4 Options</option></select><br>");
  }

  $(document).on("change", '.mult_choice', function(){

    var multSelectedValue = parseInt($(this).val());

    var choices = ''

      for (var i=1; i < multSelectedValue + 1; i++) {
        choices += ("<br>Choice " + i +
            ": <input type='text' name='choice" +
             i + "'><br>");
      }

    $("#option_field").html(choices);

    });

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


});
