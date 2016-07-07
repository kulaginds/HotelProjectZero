class Comment < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  before_save {commenter.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :commenter, presence:true, format: {with: VALID_EMAIL_REGEX}
  validates :body, presence:true, length: {minimum: 5, maximum: 400}
end
