module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: style) +
        (link_to 'Register', new_user_registration_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, class: style, method: :delete
    end
  end

  def source_helper styles
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]},
                  please feel free to #{ link_to 'contact me', contact_path },
                  if you'd like to work together."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright
    Oraykurt::Renderer.copyright
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
        url: tech_news_path,
        title: 'Tech News'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      }
    ]
  end

  def nav_helper html_tag, style
    nav_links = ''
    nav_items.each do | item |
      nav_links << "<#{html_tag}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{html_tag}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:notice] || flash[:error] || flash[:alert])
    if alert
      alert_generator alert
    end
  end

  def alert_generator alert
    js add_gritter alert
  end

end
