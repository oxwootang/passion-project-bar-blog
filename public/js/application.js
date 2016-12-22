$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  bindEventHandlers();
});

var bindEventHandlers = function(){
  showUserRegistrationForm();
  submitUserRegistrationForm();
  showSignInForm();
};

var showUserRegistrationForm = function(){
  $(".links").on("click", "a", function(e){
    e.preventDefault();
    // console.log("The register new user link has been clicked!");
    // console.log($(this));
    var register = $(this);
    var url = register.attr("href");
    // console.log(url);
    var method = "GET";
    var request = $.ajax({
      url: url,
      method: method
    });
    request.done(function(response){
      console.log("Response received");
      // console.log(response);
      $(register).replaceWith(response);
    });
    request.fail(function(response){
      console.log("Response failed");
    });
  });
};

var submitUserRegistrationForm = function(){
  $(".link").on('submit', '#submit-new-user', function(e){
    e.preventDefault();
    console.log("trying to submit new user registration form");
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var formData = $(this).serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: formData
    });
    request.done(function(response){
      console.log("request successful");
      $("form").replaceWith(response);
    });
    request.fail(function(response){
      console.log("request failed");
    });
  });
};

var showSignInForm = function(){
  $(".links").on("click", "a", function(e){
    e.preventDefault();
    var signIn = $(this);
    var url = signIn.attr("href");
    // console.log(url);
    var method = "GET";
    var request = $.ajax({
      url: url,
      method: method
    });
    request.done(function(response){
      console.log("Response received");
      // console.log(response);
      $(signIn).replaceWith(response);
    });
    request.fail(function(response){
      console.log("Response failed");
    });
  });
};