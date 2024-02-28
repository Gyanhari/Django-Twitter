$(document).ready(function(){

    $('#popover-trigger-for-follower').click(function(){
      $('#user-that-follow-you').toggle();
      $('#overlay-for-backround').toggle();
    });

    $('#popover-trigger-for-following').click(function(){
        $('#user-that-you-follow').toggle();
        $('#overlay-for-backround').toggle();
      });
    
      $(document).mouseup(function(e) {
        var container = $("#user-that-follow-you");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
          container.hide();
          $('#overlay-for-backround').hide();
        }
      });

      $(document).mouseup(function(e) {
        var container = $("#user-that-you-follow");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
          container.hide();
          $('#overlay-for-backround').hide();
        }
      });

  });