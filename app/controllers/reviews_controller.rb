class ReviewsController < ApplicationController
  before_action :set_flat
  #

  def new
    @review = Review.new
  end

  def create
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
    # :flat_id, cannot use :id here, this references review.
  end
end
