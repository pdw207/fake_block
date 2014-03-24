class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :user_interest_groups
  has_many :interest_groups, through: :user_interest_groups
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "commenter_id"
end


