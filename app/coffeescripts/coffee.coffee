jQuery.fn.exists = () -> jQuery(this).length > 0

showLoginForm = (callback) ->
  # show form
  alert "show login"
  # bind form
  
showReplyForm = (el, event) ->
  # show reply form
  alert "show reply"

window.Forum =
  bindVoting: ->
    $(".vote").bind "ajax:success", ->
      $(this).addClass("voted").removeAttr("href").unbind()
  bindReplyButtons: ->
    btns = $(".actions .reply")
    btns.bind "ajax:success", showReplyForm
    btns.bind "ajax:error", (event, xhr, status) ->
      if xhr.status == 401
        showLoginForm(showReplyForm)
  bindLoginForm: ->
    #stuff
  prepareCommentActions: ->
    window.Forum.bindReplyButtons()
    window.Forum.bindLoginForm()
