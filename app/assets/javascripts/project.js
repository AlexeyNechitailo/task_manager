$(function(){

	$("#add_todo").click(function(){
    $(".new_proj").show();
	});

	$("#create_proj").on("click", function(){
		
		if($("#proj_name").val().length < 1){
      $("#message").html("Can't be blank");
      return false;
    }
    
    $.ajax({
      type  : "POST",
      url   : "/projects",
      data  : { name: $("#proj_name").val() },
      success: function(data) {
        if(data.length > 0){
          $(".wrapper").prepend(data);
          $(".new_proj").hide();
        }
        else{
          $("#message").html("Error. Project wasn't created");  
        }
      }
    });
    return false;
	
	});

	$("#create_task").on("click", function(){
		
		if($("#task_name").val().length < 1){
      $("#message").html("Can't be blank");
      return false;
    }
    
    $.ajax({
      type  : "POST",
      url   : "/tasks",
      data  : { name: $("#task_name").val(), project_id: $(this).data("project_id") },
      success: function(data) {
        if(data.length > 0){
          $(".task-wrapper").prepend(data);
          // $(".new_proj").hide();
        }
        else{
          // window.location = "/projects";  
        }
      }
    });
    return false;
	
	});


});