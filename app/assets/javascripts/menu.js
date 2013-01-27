$(function(){

  $("#login").click(function(){
    
    if($("#log_email").val().length < 1){
      $("#message").html("Wrong email");
      return false;
    }

    if($("#log_pass").val().length < 1){
      $("#message").html("Wrong pass");
      return false;
    }

    var log_data = $("#login_form").serialize();
    $.ajax({
      type  : "POST",
      url   : "/user/login",
      data  : log_data,
      success: function(data) {
        if(data.length > 0){
          $("#message").html(data);
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
      $("#message").html("Неправильное имя пользователя");
      return false;
    }

    if($("#reg_email").val().length < 1){
      $("#message").html("Wrong email");
      return false;
    }

    if($("#reg_pass").val().length < 1){
      $("#message").html("Wrong pass");
      return false;
    }

    if ($("#reg_pass").val() != $("#reg_conf").val()){
      $("#message").html("Wrong confirmation");
      return false;
    }

    var reg_data = $("#reg_form").serialize();
    $.ajax({
      type  : "POST",
      url   : "/user",
      data  : reg_data,
      success: function(data) {
        if(data.length > 0){
          $("#message").html(data);
        }
        else{
          window.location = "/projects";  
        }
      }
    });
    return false;
  
  });

});
