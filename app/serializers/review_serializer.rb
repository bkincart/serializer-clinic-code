class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id
  attribute :rating, key: :score

  belongs_to :user, if: :is_current_user?

  def is_current_user?
    current_user == object.user
  end
end
