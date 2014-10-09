class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes
  has_many :groupings
  has_many :image_tags
  has_many :tags, through: :image_tags
  has_many :groups, through: :groupings
  validates :name, presence: true
  validates :url, presence: true

  def pass_gallery
    gallery
  end

  def tag_words
    tags.pluck(:tag_name).join(', ')
  end
end
