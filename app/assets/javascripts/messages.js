$(function(){
   function buildHTML(message){
     var html = '<div class="chat-main-message__header">' +
     '<p class="chat-main-message__header__name">' + message.name + '</p>' +
     '<p class="chat-main-message__header__time">' + message.created_at + '</p>' +
     '</div>' +
     '<p class="chat-main-message__header__body">' + message.body  + '</p>';
     return html;
   }

  $('.new_message').on('submit', function(e){
     e.preventDefault();
     var textField = $("#message_body");
       $.ajax({
         type: 'POST',
         url: './messages.json',
         dataType: 'json',
         data: {
          message: {
            body: textField.val()
          }
         },
       })
       .done(function(data) {
         var html = buildHTML(data);
         $('.chat-main-messages').append(html);
         textField.val("");
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
   });
});
