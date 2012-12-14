# coding: utf-8
module ErasHelper
  def eras
    YAML.load_file 'data/eras_list.yml'
  end
end
