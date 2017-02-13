$(function(){
   function buildHTML(message){
     var html = '<li class = "chat-message">'+
     '<div class="chat-main-message__header">' +
     '<p class="chat-main-message__header__name">' + message.name + '</p>' +
     '<p class="chat-main-message__header__time">' + message.created_at + '</p>' +
     '</div>' +
     '<p class="chat-main-message__header__body">' + message.body  + '</p>' + '</li>';
     return html;
   }

  $('.new_message').on('submit', function(e){
     e.preventDefault();
     var textField = $('#message_body');
     var message = textField.val();
       $.ajax({
         type: 'POST',
         url: './messages.json',
         data: {
          message: {
            body: message
          }
         },
        dataType: 'json'
       })

       .done(function(data) {
        console.log("success");
         var html = buildHTML(data);
         $('.chat-main-messages').append(html);
         textField.val("");
       })
       .fail(function() {
        console.log("error")
         alert('メッセージを入力してください。');
       });
   });
});
