module ApplicationHelper
  def date(message)
    message.created_at.strftime('%Y/%m/%d/ %H:%M:%S')
  end
end
