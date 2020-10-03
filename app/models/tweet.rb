class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :content, presence: true
  # acts_as_votable

  delegate :profile_photo, to: :user, prefix: :true

  def add_like(user)
    Like.create(user: user, tweet: self)
  end

  def remove_like(user)
    Like.where(user: user, tweet: self).first.destroy
  end

  def original_tweet
    Tweet.find(self.origin_tweet)
  end
end
