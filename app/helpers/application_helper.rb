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
    dynasties = YAML.load_file 'data/dynasty_menu.yml'

    dynasties.map do |dynasty|
      style_class = ''
      if dynasty['controller'] != 'home' and
        controller_name == dynasty['controller'] and
        action_name == dynasty['action']
        style_class = 'active'
      end

      content_tag :li, link_to(dynasty['title'],
          :controller => "/#{dynasty['controller']}",
          :action => dynasty['action']
        ),:class => style_class
    end.join.html_safe
  end

  def user_menu
    user_info = link_to '个人资料', edit_user_registration_path
    sign_out = link_to '退出', destroy_user_session_path
    menu current_user.user_name, 'user_menu', [user_info, sign_out]
  end

  def menu menu_name, menu_id, menu_items
    menu_size = menu_items.size
    menu_items = menu_items.map do |menu_item|
      style_class = ''
      index = menu_items.index menu_item
      if index == 0
        style_class = 'first'
      elsif index == menu_size -1
        style_class = 'last'
      end
      content_tag :li, menu_item, :class => style_class
    end.join

    html = <<-HTML
      <li class="dropdown" id="#{menu_id}">
        <a href="#{'#' + menu_id}" class="dropdown-toggle" data-toggle="dropdown">
          #{menu_name}
          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">#{menu_items}</ul>
      </li>
    HTML

    html.html_safe
  end
end
