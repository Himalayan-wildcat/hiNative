 App.chat = App.cable.subscriptions.create "ChatChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      $(".chat-table").append(data['message'])
      alert data['message']

    speak: (message) ->
      @perform 'speak', message: message


    # $(document).on "submit", "#new_chat", (e) ->
    #   console.log("bb");
    #   App.chat.speak e.target.value
    #   e.target.value = ''
    #   e.preventDefault()

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
