# coding: utf-8
module ErasHelper
  def eras_list_table
    eras = YAML.load_file 'data/eras_list.yml'

    table_body =  eras.map do |era|
      html =<<-HTML
        <tr>
          <td class="#{era['belongs'].blank? ? '' : 'sub'}">
            #{era['title']}
          </td>
          <td>#{era['range']}</td>
          <td>#{era['extra']}</td>
        </tr>
      HTML
    end.join

    html = <<-HTML
      <table class="eras_list table table-bordered">
        <thead>
          <tr>
            <th>朝代</th>
            <th>起止时间（公元）</th>
            <th>说明</th>
          </tr>
        </thead>
        <tbody>#{table_body}</tbody>
    HTML

    html.html_safe
  end
end
