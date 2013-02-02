$(function(){

  $("#log_in").click(function(){
    
    if($("#log_email").val().length < 1){
      $("#login_error_message").html("Email can't be blank");
      return false;
    }

    if($("#log_pass").val().length < 1){
      $("#login_error_message").html("Pass can't be blank");
      return false;
    }

    var log_data = $("#login_form").serialize();
    $.ajax({
      type  : "POST",
      url   : "/user/login",
      data  : log_data,
      success: function(data) {
        if(data.length > 0){
          $("#login_error_message").html(data);
        }
        else{
          window.location = "/projects";  
        }
      }
    });
    return false;
  
  });

  $("#register").click(function(){
    
    if($("#reg_name").val().length < 1){
      $("#reg_error_message").html("Неправильное имя пользователя");
      return false;
    }

    if($("#reg_email").val().length < 1){
      $("#reg_error_message").html("Wrong email");
      return false;
    }

    if($("#reg_pass").val().length < 1){
      $("#reg_error_message").html("Wrong pass");
      return false;
    }

    if ($("#reg_pass").val() != $("#reg_conf").val()){
      $("#reg_error_message").html("Wrong confirmation");
      return false;
    }

    var reg_data = $("#reg_form").serialize();
    $.ajax({
      type  : "POST",
      url   : "/user",
      data  : reg_data,
      success: function(data) {
        if(data.length > 0){
          $("#reg_error_message").html(data);
        }
        else{
          window.location = "/projects";  
        }
      }
    });
    return false;
  
  });

});
