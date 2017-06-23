class Event < ApplicationRecord
  validates :title, :date_time, :address, presence: true

  has_many :comments
  has_many :attendees
  has_many :users, through: :attendees

  belongs_to :user
end
