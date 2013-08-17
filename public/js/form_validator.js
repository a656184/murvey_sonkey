
var errors = [];

var email_verification = function(){
  var x=document.forms["sign_up"]["email"].value;
  var atpos=x.indexOf("@");
  var dotpos=x.lastIndexOf(".");

  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
    errors.push("Must be a valid e-mail address.");
  }
};

var password_verification = function(){
  var p = document.forms["sign_up"]['password'].value;
  var length = p.length;
  var capital_pattern = /^(?=.*[A-Z])/;
  var numeric_pattern = /^(?=.*\d)/;

  if (length < 8) {
    errors.push("Password must be at least 8 characters long.");
  }

  if (! p.match(capital_pattern)) {
    errors.push("Password must contain at least 1 capital letter.");
  }

  if (! p.match(numeric_pattern)) {
    errors.push("Password must contain at least 1 numeric character (0-9).");
  }
};

$(function(){
  $('form').on('click', function(e) {
    e.preventDefault();
    email_verification();
    password_verification();

    var newHTML = [];
    for (var i = 0; i < errors.length; i++){
      newHTML.push('<li>' + errors[i] + '</li>');
    }
    $('#errors').html(newHTML);
  });

});
