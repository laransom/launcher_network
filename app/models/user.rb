class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :launcher_or_ee, presence: true, inclusion: { in: ["EE", "Launcher"]}
  has_many :interest_groups
  has_many :participants
  has_many :comments
  has_many :posts, foreign_key: 'poster_id'
  has_many :created_interest_groups, class_name: "InterestGroup", foreign_key: "creator_id"
  has_many :participants
  has_many :interest_groups, through: :participants

end
