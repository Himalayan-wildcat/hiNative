$(function() {
  if ($("input[type='hidden']")[0]) {
    bottom();
      var targetId = $('input[type="hidden"]').data("roomid");
      App.chat = App.cable.subscriptions.create({
        channel: "ChatChannel",
        userId: targetId
      }, {
        connected: function() {
          console.log("connected");
        },
        disconnected: function() {
          console.log("disconnected");
        },
        received: function(data) {
          if (data['message']) {
            var user_id, user_name, rest;
            [user_id, user_name] = $('input[type="hidden"]').val() == data['user_id'] ? ["__right", "自分"] : ["__left", data['user_name']]
                var html = `
                <div class="message-box${user_id}">
                    <li class="messages__list">
                      <span class="messages__name">
                        ${user_name}
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
          bottom();
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
        $(".message").animate({
          scrollTop: $(".message")[0].scrollHeight
        }, 500);
      }

      $(document).on('keypress', '[data-behavior~=chat_room]', function(event) {
        if ($(".error_message").text()) {
          $(".error_message").text("");
          $(".error_message").css("display", "none");
        }
        if (event.keyCode == 13) {
          var userId = $('input[type="hidden"]').data("userid");
          App.chat.speak(event.target.value, userId);
          event.target.value = "";
          event.preventDefault();
          bottom();
        }
      });

      $(".submitBtn").on("click", function() {
        var content = $('[data-behavior=chat_room]').val();
        var userId = $('input[type="hidden"]').data("userid");
        App.chat.speak(content, userId);
        $('[data-behavior=chat_room]').val("");
        bottom();
      });
    }
});
