class Post < ActiveRecord::Base
  validates :poster_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :posted_at, presence: true
  validates :interest_group_id, presence: true
  belongs_to :poster, class_name: "User"
  belongs_to :interest_group
  has_many :comments
end
