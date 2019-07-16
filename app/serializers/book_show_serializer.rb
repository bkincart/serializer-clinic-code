class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author_name

  attribute :user_reviews do
    object.reviews.where(user: current_user)
  end

  has_many :reviews
end
