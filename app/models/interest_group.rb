class InterestGroup < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :user_interest_groups
  has_many :members, through: :user_interest_groups, source: :user
  has_many :posts
  def owner
      user_interest_groups.where(user_type: "owner").first.user
  end

  def top_posts
    posts.sort {|post1, post2| post2.comments.count <=> post1.comments.count}
  end
end
