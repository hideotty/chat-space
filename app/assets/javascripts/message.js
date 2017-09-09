$(function(){

  function buildMESSAGE(message){
    var html = `<div class = 'message__detail' data-id = '${ message.id }'>
                  <div class='message__user'>
                    ${ message.user_name }
                    <span class='message__date'>
                      ${ message.created_at }
                    </span>
                  </div>`
    if (message.content){
        html += `<div class='message__text'>
                    ${ message.content }
                  </div>`
    }
    if(message.img){
       html += `<div class='message__text'>
                  <img src= ${ message.img }
                </div>`
    }
       html += `</div>`

    return html;

  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var url = $(this).attr('action')

  $('.postform__send').removeAttr('data-disable-with');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
   })
    .done(function(data){
        var html = buildMESSAGE(data);
        $('.message').append(html);
        $('#message_content').val('');
        $('#message_img').val('');
        $('.message').animate({scrollTop:$(".message").prop("scrollHeight")}, 10);
    })
    .fail(function(){
      alert('error');
    })
  })

  $(function(){
    setInterval(update, 5000);
  });
  function update(){
    var message_id = $('.message__detail').last().data('id');
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        message: { id: message_id }
      },
      dataType:'json'
      })
    .done(function(messages){
      var insertMESSAGE = '';
       messages.forEach(function(message) {
        if(message.id > message_id){
          insertMESSAGE += buildMESSAGE(message);
         $('.message').append(insertMESSAGE);
        }
       $('.message').animate({
        'scrollTop': $('.message')[0].scrollHeight}, 'fast');
       })
      })
    .fail(function(message){
      console.log('自動更新に失敗しました');
     });
  }
});
