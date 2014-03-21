class InterestGroup < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :user_interest_groups
  has_many :users, through: :user_interest_groups
end
