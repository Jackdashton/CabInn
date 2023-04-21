class FlatsController < ApplicationController
  before_action :set_user

  def index
    @flats = policy_scope(Flat).all
    # Limits flats we can see to those inside method: Resolve in flat_policy
  end

  def show
    @flat = Flat.find(params[:id])
    authorize(@flat) # must find flat first
    @markers = [{ lat: @flat.latitude, lng: @flat.longitude }]
  end

  def new
    @flat = Flat.new
    authorize(@flat)
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize(@flat) # must be after @flat is created
    # Always put authorize before save, as save makes changes to the database.
    # We check if allowed to do it, before we save it.
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize(@flat)
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.user = current_user
    authorize(@flat)
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize(@flat) # This must be before the .destroy!!
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  # def ratings
  #   total_location = []
  #   total_cleanliness = []
  #   total_value = []
  #   total_rating = 0

  #   @flat.reviews.map do |review|
  #     total_location << review.location
  #     total_cleanliness << review.cleanliness
  #     total_value << review.value
  #   end

  #   if total_location.count != 0
  #     avg_location = (total_location.sum / total_location.count).to_f
  #   else
  #     avg_location = "No Ratings Yet"
  #   end

  #   if total_cleanliness.count != 0
  #     avg_cleanliness = (total_cleanliness.sum / total_cleanliness.count).to_f
  #   else
  #     avg_cleanliness = "No Ratings Yet"
  #   end

  #   if total_value.count != 0
  #     avg_value = (total_value.sum / total_value.count).to_f
  #   else
  #     avg_value = "No Ratings Yet"
  #   end

  #   if total_value.count != 0
  #     avg_rating = ((avg_cleanliness + avg_location + avg_value) / 3)
  #   else
  #     avg_rating = "No Ratings Yet"
  #   end
  # end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :guest_num, :price_per_night, photos: [])
    # Need photos (plural) as an empty array to allow multiple photo uploads.
  end

  def set_user
    @user = current_user
  end

end
