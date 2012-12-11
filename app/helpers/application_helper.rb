# coding: utf-8
module ApplicationHelper
  def alert_message message, type = 'alert-error'
    return '' if message.blank?

    html = <<-HTML
      <div class="alert alert-block #{type}">
        <a href="#" class="close" data-dismiss="alert">x</a>
        #{message}
      </div>
    HTML

    html.html_safe
  end

  def dynasty_menu
    dynasties = YAML.load_file 'config/dynasty_menu.yml'

    dynasties.map do |dynasty|
      style_class = ''
      if dynasty['controller'] != 'home' and
        controller_name == dynasty['controller'] and
        action_name == dynasty['action']
        style_class = 'active'
      end

      content_tag :li, link_to(dynasty['title'],
          :controller => dynasty['controller'],
          :action => dynasty['action']
        ),:class => style_class
    end.join.html_safe
  end

  def user_menu
    user_info = link_to '个人资料', edit_user_registration_path
    sign_out = link_to '退出', destroy_user_session_path

    html = <<-HTML
      <li class="dropdown" id="user_menu">
        <a href="#user_menu" class="dropdown-toggle" data-toggle= "dropdown">
          #{current_user.user_name}
          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li class="first">#{user_info}</li>
          <li class="last">#{sign_out}</li>
        </ul>
      <li>
    HTML

    html.html_safe
  end
end
