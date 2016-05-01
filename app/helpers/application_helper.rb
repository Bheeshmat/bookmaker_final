module ApplicationHelper
  def is_home_page
    true if controller_name == "home" && action_name == "land"
  end

  def flash_messages_tag
    str = ""
    flash.each do |fl|
      str += content_tag(:div, class: "alert alert-#{ fl[0] } alert-dismissible", role: "alert") do
        content_tag(:button, class: "close", data: { dismiss: "alert" }) do
          content_tag(:span, raw("&times;"))
        end + fl[1]
      end
    end
    return raw(str)
  end

end
