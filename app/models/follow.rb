class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_person, class_name: 'User'
end
