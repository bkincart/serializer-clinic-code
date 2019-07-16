class Api::V1::BooksController < ApplicationController
  def index
    # render json: {
    #   books: serialized_books,
    #   reviews: serialized_reviews
    # }
    render json: {
      books: serialized_data(Book.all, BookSerializer),
      reviews: serialized_data(Review.all, ReviewSerializer)
    }
  end

  def show
    render json: Book.find(params[:id]), serializer: BookShowSerializer
  end

  # def serialized_books
  #   ActiveModel::Serializer::CollectionSerializer.new(Book.all, each_serializer: BookSerializer)
  # end
  #
  # def serialized_reviews
  #   ActiveModel::Serializer::CollectionSerializer.new(Review.all, each_serializer: ReviewSerializer)
  # end

  def serialized_data(data, serializer)
    ActiveModel::Serializer::CollectionSerializer.new(data, each_serializer: serializer)
  end
end
