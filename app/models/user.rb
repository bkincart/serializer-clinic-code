class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def full_name
     "#{first_name} #{last_name}"
   end

  # as a user, i want to find my followers (the people who follow me)
  has_many :follows_as_followed_person, class_name: 'Follow', foreign_key: 'followed_person_id'
  has_many :followers, through: :follows_as_followed_person, source: :follower

  # as a user, i want to find the accounts that i follow
  has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followed_people, through: :follows_as_follower, source: :followed_person

end
