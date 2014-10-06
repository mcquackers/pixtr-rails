class Comment < ActiveRecord::Base

  belongs_to :image
  belongs_to :user
  validates :body, presence: true

  def user_email
    user.email
  end
end
