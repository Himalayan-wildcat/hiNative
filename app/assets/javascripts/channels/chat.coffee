 App.chat = App.cable.subscriptions.create "ChatChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      html = """ <div class="message-box">
          <li class="messages__list">
            <span class="messages__name">
              名前
            </span>
            <span class="messages__date">

            </span>
          </li>
          <li class="messages__list">
              <span class="messages__list__message">
                #{data['message']}
              </span>
          </li>
        </div>"""

      $(".messages").append(html);

    speak: (message) ->
      @perform 'speak', message: message


    # $(document).on "submit", "#new_chat", (e) ->
    #   console.log("bb");
    #   App.chat.speak e.target.value
    #   e.target.value = ''
    #   e.preventDefault()
    #
    # $("#new_chat").on 'submit', (e) ->
    #     console.log("bb");
    #     App.chat.speak e.target.value
    #     e.target.value = ''
    #     e.preventDefault()


    $(document).on 'keypress', '[data-behavior~=chat_room]', (e) ->
      if e.keyCode is 13 # return = send
        App.chat.speak e.target.value
        e.target.value = ''
        e.preventDefault()
