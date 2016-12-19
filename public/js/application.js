$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".links").on("click", "#register", function(e){
    e.preventDefault();
    console.log("The register new user link has been clicked!");
    console.log($(this));
    var register = $(this);
    var url = register.attr("href");
    console.log(url);
    var method = "GET";
    var request = $.ajax({
      url: url,
      method: method
    });
    request.done(function(response){
      console.log("Response received");
      console.log(response);
    });
  });
});
