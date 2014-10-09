class Tag < ActiveRecord::Base
  validates :tag_name, presence: true, uniqueness: true
  has_many :image_tags
  has_many :images, through: :image_tags
end
