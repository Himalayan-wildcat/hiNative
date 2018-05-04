$(function() {

  var dispatcher = new WebSocketRails('localhost:3000/websocket');

  $("#new_chat").on("submit", function(e) {
    e.preventDefault();
    new_message = { message: "this is a test" }
    dispatcher.trigger('send_message', new_message);

    dispatcher.bind('event_name', function(data) {
    console.log(data.message); // would output 'this is a message'
  });
});
});
