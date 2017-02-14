$(function(){
   function buildHTML(message){
     var html = '<li class="chat-main-message">'+
     '<div class="chat-main-message__header">' +
     '<p class="chat-main-message__header__name">' + message.name + '</p>' +
     '<p class="chat-main-message__header__time">' + message.created_at + '</p>' +
     '</div>' +
     '<p class="chat-main-message__header__body">' + message.body  + '</p>' + '</li>' +
     '<li class="chat-main-message">' + '</li>';
     return html;
   }

  $(document).on('submit','#new_message', function(e){
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
         var html = buildHTML(data);
         $('.chat-main-messages').append(html);
         textField.val("");
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
   });
});

