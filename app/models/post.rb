class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
  belongs_to :author, class_name: 'User'
  belongs_to :interest_group
  has_many :comments
end
