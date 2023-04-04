class ReviewsController < ApplicationController
  before_action :set_flat

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.flat = @flat
    # @flat refers to the flat set in the set_flat method which runs before action
    @review.save
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
    # :flat_id, cannot use :id here, this references review.
  end

  def review_params
    params.require(:review).permit(:content, :location, :cleanliness, :value)
  end
end
