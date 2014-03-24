class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: 'User'
  belongs_to :post
  # belongs_to :user, foreign_key: 'commenter_id'

  validates :post, presence: true
  validates :commenter, presence: true
end
