class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image, destroy: false
  validates :email, presence: true, length: {maximum: 10, minimum: 2}
  validates :introduction, length: {maximum: 50}

  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
end
