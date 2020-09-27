class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  acts_as_votable

  delegate :profile_photo, to: :user, prefix: :true
end
