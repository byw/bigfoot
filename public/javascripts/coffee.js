/* DO NOT MODIFY. This file was compiled Tue, 15 Feb 2011 08:18:33 GMT from
 * /Users/bob/dropbox/projects/rails/forum/app/coffeescripts/coffee.coffee
 */

(function() {
  var showLoginForm, showReplyForm;
  jQuery.fn.exists = function() {
    return jQuery(this).length > 0;
  };
  showLoginForm = function(callback) {
    return alert("show login");
  };
  showReplyForm = function(el, event) {
    return alert("show reply");
  };
  window.Forum = {
    bindVoting: function() {
      return $(".vote").bind("ajax:success", function() {
        return $(this).addClass("voted").removeAttr("href").unbind();
      });
    },
    bindReplyButtons: function() {
      var btns;
      btns = $(".actions .reply");
      btns.bind("ajax:success", showReplyForm);
      return btns.bind("ajax:error", function(event, xhr, status) {
        if (xhr.status === 401) {
          return showLoginForm(showReplyForm);
        }
      });
    },
    bindLoginForm: function() {},
    prepareCommentActions: function() {
      window.Forum.bindReplyButtons();
      return window.Forum.bindLoginForm();
    }
  };
}).call(this);
