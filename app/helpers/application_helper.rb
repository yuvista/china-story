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
    dynasties = [
      '夏商周', '春秋战国', '秦汉', '三国', '魏晋南北朝',
      '隋唐', '五代十国', '宋元明清', '历代纪元表'
    ]

    dynasties.map do |dynasty|
      content_tag :li, link_to(dynasty, :controller => '/home')
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
