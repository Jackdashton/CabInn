class FlatsController < ApplicationController

  def index
    @flats = policy_scope(Flat).all
    # Limits flats we can see to those inside method: Resolve in flat_policy
  end

  def show
    @flat = Flat.find(params[:id])
    authorize(@flat) # must find flat first
    @markers = [{ lat: @flat.latitude, lng: @flat.longitude }]
    # @calc_nights
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

  # def calc_nights
  #   raise
  #   @nights = (@booking.arrival-@booking.departure).to_i
  # end


  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :guest_num, :price_per_night, photos: [])
    # Need photos (plural) as an empty array to allow multiple photo uploads.
  end
end
