module ApplicationHelper
  def flash_message(key, message)
    capture do
      Array(message).each { |element| concat content_tag(:li, element) }
    end
  end
end
