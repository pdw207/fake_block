class InterestGroup < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :user_interest_groups
  has_many :members, through: :user_interest_groups, source: :user

  def owner

      user_interest_groups.where(user_type: "owner").first.user
  end
end
