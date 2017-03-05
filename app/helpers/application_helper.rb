module ApplicationHelper
  def flash_class(type)
    {notice: 'success', alert: 'info', error: 'warning'}[type]
  end
end
