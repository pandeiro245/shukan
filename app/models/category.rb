class Category < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path Rails.root.join('config/active_yaml')
  set_filename 'categories'

  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category'
end
