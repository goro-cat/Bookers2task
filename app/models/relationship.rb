class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User"##@user.follower
  belongs_to :followed, class_name: "User"##@user.followedでレコードを取得できる
  
  validates :follower, presence: true
  validates :followed, presence: true
end
