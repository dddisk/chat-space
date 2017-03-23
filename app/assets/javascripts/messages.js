$(function(){
  function buildHTML(message){
    if (message.image) {
      var Image = '<br><img src="' + message.image +'">';
    } else {
      var Image='';
    }
     var html = '<li class="chat-main-message">'+
     '<div class="chat-main-message__header">' +
     '<p class="chat-main-message__header__name">' + message.name + '</p>' +
     '<p class="chat-main-message__header__time">' + message.created_at + '</p>' +
     '</div>' +
     '<p class="chat-main-message__header__body">' + message.body + Image  + '</p>' + '</li>' +
     '<li class="chat-main-message">' + '</li>';
     return html;
   }

  $(document).on('submit','#new_message', function(e){
    var $form = this;
     e.preventDefault();
     var textField = $('#message_body');
     var fd = new FormData($(this)[0]);

       $.ajax({
         type: 'POST',
         url: './messages.json',
         processData: false,
         contentType: false,
         data: fd,
        dataType: 'json'
       })

       .done(function(data) {
         var html = buildHTML(data);
         $('.chat-main-messages').append(html);
         textField.val("");
         $form.reset();
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
   });
});

