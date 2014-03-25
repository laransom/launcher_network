class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :post_id, presence: true
  belongs_to :post, counter_cache: true
  belongs_to :user
end
