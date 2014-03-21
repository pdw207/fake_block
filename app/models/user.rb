class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_many :user_interest_groups
  has_many :interest_groups, through: :user_interest_groups
end


