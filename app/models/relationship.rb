class Relationship < ApplicationRecord
  belongs_to :follower, User.name
  belongs_to :followed, User.name
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
