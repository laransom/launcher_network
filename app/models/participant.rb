class Participant < ActiveRecord::Base
  validates :user_id, presence: true
  validates :interest_group_id, presence: true

  belongs_to :interest_group
  belongs_to :user
end
