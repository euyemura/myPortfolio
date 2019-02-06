module ApplicationHelper

  def login_helper(class_name = "")
     if current_user.is_a?(GuestUser)
       (link_to 'Register', new_user_registration_path, class: class_name) +
       (link_to 'Login', new_user_session_path, class: class_name)
     else
       link_to 'Logout', destroy_user_session_path, method: :delete, class: class_name
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

  def portfolio_footer_helper
    if params[:action] == "show"
      link_to 'Back to portfolios', portfolios_path
    else
      content_tag :a, "Back to top", href: "#"
    end
  end


  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end

  def nav_helper(class_name, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{class_name} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

end
