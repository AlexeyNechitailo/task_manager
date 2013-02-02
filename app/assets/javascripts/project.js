$(function(){

  $(".proj_wrap, .wrapper").on("click", ".project > .task-wrap > table > tbody > tr > td > #picker", function() {
    task_id = $(this).data("task_id");
    $("#datepicker"+task_id).datetimepicker({
      onClose: function(dateText, inst) {
        if(dateText.length<1){
          alert("Date wasn't set");
        }
        else{
          month = dateText[0] + dateText[1] + "-";
          day = dateText[3] + dateText[4] + "-";
          date = day + month + dateText.substr(6);
          $.ajax({
            type  : "get",
            url   : "/task/set_deadline",
            data  : { task_id: task_id, 'task[deadline]': date },
            success: function(data) {
              if(data.length > 0){
                alert("suxx");
              }
              else{
                // $("#ct_message").html("Error. Project wasn't created");  
              }
            }
          });
          return false;
        }
      }
    }).focus(); //make the datepicker appear!
  });

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
          $(".proj_wrap").prepend(data);
          $(".new_proj").hide();
        }
        else{
          $("#ct_message").html("Error. Project wasn't created");  
        }
      }
    });
    return false;
	
	});

  $(".proj_wrap, .wrapper").on("click", "li > .input-append > button", function(){
    // alert("fired");
    var project_id = $(this).data("project_id");
    var name = $("li[data-project_id=" + project_id +"] > .input-append > .span2").val()
    
    if(name.length < 1){
      $("#message").html("Can't be blank");
      return false;
    }
    
    $.ajax({
      type  : "POST",
      url   : "/task",
      data  : { name: name, project_id: project_id },
      success: function(data) {
        if(data.length > 0){
          $("li[data-project_id=" + project_id +"] > .task-wrap > table").prepend(data); 
        }
        else{
          $("#message").html("Error. Task wasn't created");   
        }
      }
    });
    return false;
  
  });

  $(".proj_wrap, .wrapper").on("click", ".project > .task-wrap > table > tbody > tr > td > .is_done", function (){
    var check;
    if($(this).is(':checked')){
      check = "true";
    }
    else{
      check = "false";
    }
    var task_id = $(this).data("task_id");
    var elem = $(this);
    $.ajax({
      type  : "get",
      url   : "/task/mark_as_done",
      data  : { task_id: elem.data("task_id"), 'task[is_done]': check },
      success: function(data) {
        if(data.length > 0){
          $("#message").html("Error.");
        }
        else{
          if (elem.is(':checked')){
            $(".is_done[data-task_id=" + task_id + "]").prop('checked', false);
          }
          else{  
            $(".is_done[data-task_id=" + task_id + "]").prop('checked', true);
          }
        }
      }
    });
    return false;

  });


});