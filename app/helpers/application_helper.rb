module ApplicationHelper

  def login_helper
     if current_user.is_a?(GuestUser)
       (link_to 'Register', new_user_registration_path) + "<br>".html_safe +
       (link_to 'Login', new_user_session_path) +
       ("<p>There's no reason to log in, just wanted to show off my authentication.</p>".html_safe)
     else
       link_to 'Logout', destroy_user_session_path, method: :delete
     end
  end


  def sample_helper(class_name)
    content_tag :div, "my awesome content", class: class_name
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting from #{session[:source]} and you are on the #{layout_name} layout!"
      content_tag(:div, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AkioViewTool::Renderer.copyright "Eric Uyemura", "All rights reserved"
  end

end
