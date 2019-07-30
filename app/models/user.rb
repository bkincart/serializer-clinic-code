class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def full_name
     "#{first_name} #{last_name}"
   end

  has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followings, through: :follows_as_follower, source: 'followed'

  has_many :follows_as_followed_person, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :followers, through: :follows_as_followed_person, source: 'follower'
end
