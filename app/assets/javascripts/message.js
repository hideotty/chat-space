$(function(){

  function buildHTML(message){
    var html = `<div class= "message__user">
                  ${message.user_name}
                  <span class="message__date">
                    ${message.created_at}
                  </span>
                </div>`
    if (message.content){
        html += `<div class="message__text">
                  ${message.content}
                </div>`
    }
    if (message.img){
        html += `<div class="message__text">
                   <img src=${message.img}>
                </div>`
    }
    html += '</div>'

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
        var html = buildHTML(data);
        $('.message').append(html);
        $('#message_content').val('');
        $('#message_img').val('');
        $('.message').animate({scrollTop:$(".message").prop("scrollHeight")}, 10);
    })
    .fail(function(){
      alert('error');
    })
  })
});
