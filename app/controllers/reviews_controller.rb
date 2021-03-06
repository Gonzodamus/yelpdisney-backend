class ReviewsController < ApplicationController
  skip_before_action :authorized


  def index
    reviews = Review.all
    render json: reviews
  end

  def create
   review = Review.new(review_params)
   restaurant = Restaurant.find(params[:restaurant_id])
   if review.save
     render json: restaurant
   end
  end

  def show
    review = Review.find(params[:id])
     if stale?(review)
       render json: review
     end
  end


  private

  def review_params
    params.require(:review).permit(:quality, :cleanliness, :service, :value, :content, :restaurant_id, :user_id)
  end

end
