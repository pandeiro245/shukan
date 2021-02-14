class Goal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :events
  belongs_to :user
  belongs_to :category
end
