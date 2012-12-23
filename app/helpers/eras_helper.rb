# coding: utf-8
module ErasHelper
  def eras
    YAML.load_file 'data/eras_list.yml'
  end

  def eras_kings
    YAML.load_file 'data/eras_kings.yml'
  end

  def eras_dynasty_kings dynasty, options
    html = <<-HTML
      <section id="#{options[:key]}">
        <div class="page-header">
          <h3>#{options[:main_title]}</h3>
          <h4>#{options[:slave_title]}</h4>
        </div>
        <h5>#{dynasty['extra']}</h5>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>帝号（姓名）</th>
              <th>年号</th>
              <th>使用时间（年）</th>
              <th>开始时间（干支）</th>
              <th>起止时间（公元）</th>
              <th>说明</th>
            </tr>
          </thead>
          <tbody>#{eras_kings_tbody dynasty['kings']}</tbody>
        </table>
      </section>
    HTML
  end

  def eras_kings_tbody kings
    kings.map do |king|
      if king.has_key? 'reign_titles'
        king['reign_titles'].map do |reign_title|
          puts reign_title
          html = <<-HTML
            <tr>
              <td>
                #{king['reign_titles'].index(reign_title) == 0 ? king['name'] : ''}
              </td>
              <td>#{reign_title['title']}</td>
              <td>#{reign_title['years']}</td>
              <td>#{reign_title['ganzhi_start']}</td>
              <td>#{reign_title['range']}</td>
              <td>#{reign_title['extra']}</td>
            </tr>
          HTML
        end.join
      else
        html = <<-HTML
          <tr>
            <td>#{king['name']}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        HTML
      end
    end.join
  end
end
