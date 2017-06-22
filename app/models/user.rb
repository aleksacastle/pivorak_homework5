class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :admin
  has_many :attendees
  has_many :events, through: :attendees

  def is_admin?
    User.joins(:admin).where(id: self.id).present?
  end
end
