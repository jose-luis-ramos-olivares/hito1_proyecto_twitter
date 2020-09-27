class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  acts_as_votable
end
