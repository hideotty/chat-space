$(function(){

var search_list = $("#user-search-result");
var current_user = $(".js_incremental");

  function appendUsers(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">
                    ${ user.name }
                  </p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= ${ user.id} data-user-name=${ user.name }>
                    追加
                    </a>
                </div>`
    current_user.append(html);
  }

  function appendNoUsers(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">
                    一致するユーザーがいません。
                  </p>`
    current_user.append(html);
  }

  function addUsername(id, name){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value=${id}>
                  <p class='chat-group-user__name'>
                    ${name}
                  </p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>
                    削除
                  </a>
               </div>`
    search_list.append(html);
  }

  $("#search_").on("keyup", function(){
    var input = $("#search_").val();
    $.ajax({
      url: '/users',
      type: "GET",
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users){
      $(".chat-group-user").remove();
        if (users.length !== 0) {
          users.forEach(function(user){
          var html = appendUsers(user);
          });
        }
        else {
          appendNoUsers
          ("一致するUserはいません");
        }
    })
    .fail(function(){
      alert('ユーザーの追加に失敗しました')
    })
  })

  $(".form").on('click', ".user-search-add", function(){
     var id = $(this).data('user-id')
     var name = $(this).data('user-name')
    $(this).parent().remove();
    addUsername(id,name)
  })
  $(".form").on("click", ".user-search-remove", function () {
    $(this).parent().remove();

  })
});
