class InterestGroup < ActiveRecord::Base
  validates :name, presence: true
  validates :creator_id, presence: true, numericality: {
    greaten_than: 0
  }
  belongs_to :creator, class_name: "User"
  has_many :posts
  has_many :participants
end
