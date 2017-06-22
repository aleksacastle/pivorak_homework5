class Event < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
end
