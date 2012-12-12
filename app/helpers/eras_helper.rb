# coding: utf-8

module ErasHelper
  def eras_tbody
    eras = YAML.load_file 'data/eras_list.yml'

    eras.map do |era|
      html =<<-HTML
        <tr>
          <td class="#{era['belongs'].blank? ? '' : 'sub'}">
            #{era['title']}
          </td>
          <td>#{era['range']}</td>
          <td>#{era['extra']}</td>
        </tr>
      HTML
    end.join.html_safe
  end
end
