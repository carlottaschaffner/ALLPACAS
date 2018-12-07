class ReviewsController < ApplicationController
  def index
    reviews = policy_scope(Review).order(created_at: :desc)
    @review = Review.new
    @user_reviews = current_user.reviews
    @user_bookings = current_user.bookings
    authorize reviews
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    @review.booking = @booking

    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  private

  def find_review
    @review = Review.find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
