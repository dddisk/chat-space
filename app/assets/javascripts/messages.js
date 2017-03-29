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
  function autoScroll(){
    $('.chat-main-body').animate({
      scrollTop: $('.chat-main-messages').height() + $('.chat-main-message').height()
    })
  };

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
         autoScroll();
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
   });
  if (document.location.href.match(/\/groups\/\d+\/messages/)) {
    setInterval(function(){
        var messagelength = $('.chat-main-message').length;
        $.ajax(document.location.href + '.json',{
         type: 'GET',
         dataType: 'json'
       })
      .done(function(data) {
        var datalength = data.message.length;
        for (var i = messagelength; i < datalength; i++) {
          var html = buildHTML(data.message[i]);
          $('.chat-main-messages').append(html);
       }
      })
      .fail(function(){
        console.log('エラーが発生しました。');
      });
    },3000);
   };
});

