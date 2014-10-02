class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :users
  validates :name, presence: true
  validates :description, presence: true
end
