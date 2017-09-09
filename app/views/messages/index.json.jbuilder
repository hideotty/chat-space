if @new_message.present?
  json.array! @new_message do |message|
  json.content message.content
  json.user_name message.user.name
  json.img message.img.url
  json.created_at message.created_at
  json.id message.id
 end
end
