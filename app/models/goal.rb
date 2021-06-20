class Goal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :category, presence: true
  validates :name, presence: true

  has_many :events
  belongs_to :user
  belongs_to :category
end
