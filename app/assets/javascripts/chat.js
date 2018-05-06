$(function() {
  var userId = $('input[type="hidden"]').val();
  App.chat = App.cable.subscriptions.create({
    channel: "ChatChannel",
    userId: userId
  }, {
    connected: function() {
      console.log("connected");
    },
    disconnected: function() {
      console.log("disconnected");
    },
    received: function(data) {
      if (data['message']) {
        var user_type = data['user_type'] ? "__left" : "__right"
            var html = `
            <div class="message-box${user_type}">
                <li class="messages__list">
                  <span class="messages__name">
                    ${data['user_name']}
                  </span>
                  <span class="messages__date">
                    ${data['message']['created_at']}
                  </span>
                </li>
                <li class="messages__list">
                    <span class="messages__list__message">
                      ${data['message']['text']}
                    </span>
                </li>
              </div>
            `
            $(".messages").append(html);
      } else if (data['error']) {
        $(".error_message").css("display", "block");
        $(".error_message").text(data['error']);
      }
    },
    speak: function(message, userId) {
      return this.perform('speak', {
        message: message,
        userId: userId
      });
    }
  });

  function bottom() {
  var url = window.location.href;
  var message = new RegExp(".+chats");
  if (url.match(message)) {
    $(".message").animate({
      scrollTop: $(".message")[0].scrollHeight
    }, 500);
  }
}

  $(document).on('keypress', '[data-behavior~=chat_room]', function(event) {
    if ($(".error_message").text()) {
      $(".error_message").text("");
      $(".error_message").css("display", "none");
    }
    if (event.keyCode == 13) {
      App.chat.speak(event.target.value, $('input[type="hidden"]').val());
      event.target.value = "";
      event.preventDefault();
      bottom();
    }
  });

  $(".submitBtn").on("click", function() {
    var content = $('[data-behavior=chat_room]').val();
    App.chat.speak(content, $('input[type="hidden"]').val());
    $('[data-behavior=chat_room]').val("");
    bottom();
  });
});
