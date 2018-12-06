class ReviewsController < ApplicationController
  def index
    reviews = policy_scope(Review).order(created_at: :desc)
    @user_reviews = current_user.reviews
    authorize reviews
  end

  def new
    @review = Review.new
    authorize @review
  end

  def save
    @review = Review.new(review_params)
    authorize @review

    @review.booking = @booking

    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def show
    # @review = Review.all
    # authorize @review
  end

  private

  def find_review
    @review = Review.find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
