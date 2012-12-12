# coding: utf-8

module ErasHelper
  def eras_tbody
    eras = YAML.load_file 'data/eras_list.yml'

    eras.map do |era|
      style_class = 'center'
      if era['belongs'].blank?
        style_class = ''
      end

      html =<<-HTML
        <tr>
          <td class="#{style_class}">#{era['title']}</td>
          <td>#{era['range']}</td>
          <td>#{era['extra']}</td>
        </tr>
      HTML
    end.join.html_safe
  end
end
