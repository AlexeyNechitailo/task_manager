$ ->
  FB.init
    appId: "470354323130456" 
    status: true 
    cookie: true 
    xfbml: true
    oauth: true

  $('.js-send-message').click ->
    console.log 'inside'

    FB.ui
      link: 'https://apps.facebook.com/xxxxxxxaxsa'
      method: "send"
      to: 'alex_nech@rambler.ru'
      

  $(".proj_wrap, .wrapper").on "click", ".project > .task-wrap > table > tbody > tr > td > #picker", ->
    task_id = $(this).data("task_id")
    
    # $("#ct_message").html("Error. Project wasn't created");  
    $("#datepicker" + task_id).datetimepicker(onClose: (dateText, inst) -> #make the datepicker appear!
      if dateText.length < 1
        alert "Date wasn't set"
      else
        month = dateText[0] + dateText[1] + "-"
        day = dateText[3] + dateText[4] + "-"
        date = day + month + dateText.substr(6)
        $.ajax
          type: "get"
          url: "/task/set_deadline"
          data:
            task_id: task_id
            "task[deadline]": date

          success: (data) ->
            if data.length > 0
              alert "suxx"
            else

        false
    ).focus()

  $("#add_todo").click ->
    $(".new_proj").show()

  $("#create_proj").on "click", ->
    if $("#proj_name").val().length < 1
      $("#message").html "Can't be blank"
      return false
    $.ajax
      type: "POST"
      url: "/projects"
      data:
        name: $("#proj_name").val()

      success: (data) ->
        if data.length > 0
          $(".proj_wrap").prepend data
          $(".new_proj").hide()
        else
          $("#ct_message").html "Error. Project wasn't created"

    false

  $(".proj_wrap, .wrapper").on "click", "li > .input-append > button", ->
    
    # alert("fired");
    project_id = $(this).data("project_id")
    name = $("li[data-project_id=" + project_id + "] > .input-append > .span2").val()
    if name.length < 1
      $("#message").html "Can't be blank"
      return false
    $.ajax
      type: "POST"
      url: "/task"
      data:
        name: name
        project_id: project_id

      success: (data) ->
        if data.length > 0
          $("li[data-project_id=" + project_id + "] > .task-wrap > table").prepend data
        else
          $("#message").html "Error. Task wasn't created"

    false

  $(".proj_wrap, .wrapper").on "click", ".is_done", ->
    
    # $(".proj_wrap, .wrapper").on("click", ".project > .task-wrap > table > tbody > tr > td > .is_done", function (){
    check = undefined
    if $(this).is(":checked")
      check = "true"
    else
      check = "false"
    task_id = $(this).data("task_id")
    elem = $(this)
    $.ajax
      type: "get"
      url: "/task/mark_as_done"
      data:
        task_id: elem.data("task_id")
        "task[is_done]": check

      success: (data) ->
        if data.length > 0
          $("#message").html "Error."
        else
          if elem.is(":checked")
            $(".is_done[data-task_id=" + task_id + "]").prop "checked", false
          else
            $(".is_done[data-task_id=" + task_id + "]").prop "checked", true

    false

