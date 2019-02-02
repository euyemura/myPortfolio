module ApplicationHelper

  def login_helper
     if current_user.is_a?(User)
       link_to 'Logout', destroy_user_session_path, method: :delete
     else
       (link_to 'Register', new_user_registration_path) + "<br>".html_safe +
       (link_to 'Login', new_user_session_path) +
       ("<p>There's no reason to log in, just wanted to show off my authentication.</p>".html_safe)
     end
  end


end
