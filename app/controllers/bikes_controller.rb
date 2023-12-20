class BikesController < ApplicationController
  # before_action :set_bike, only: [:show, :edit, :update, :destroy]

  # def index
  #   @bikes = Bike.all
  # end

  # def new
  #   @bike = Bike.new
  # end

  # def create
  #   @bike = Bike.new(bike_params)
  #   if @bike.save
  #     redirect_to bikes_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def show
  # end

  # def edit
  # end

  # def update
  #   if @bike.update(bike_params)
  #     redirect_to bike_path(@bike)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @bike.destroy
  #   redirect_to bikes_path, status: :see_other
  # end

  # private

  # def set_bike
  #   @bike = Bike.find(params[:id])
  # end

  # def bike_params
  #   params.require(:bike).permit(:name, :place, :description, :price_per_day, :bike_type, :photo)
  # end
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @bikes = Bike.where(user: current_user)

    @all_bikes = Bike.all # Attention aux requêtes N+1
    if params[:query].present?
      sql_subquery = <<~SQL
        bikes.style @@ :query
        OR bikes.LONG_description @@ :query
      SQL
      @all_bikes = @all_bikes.where(sql_subquery, query: params[:query])
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_path, status: :see_other
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:style, :description, :price_per_day, photos: [])
  end


end
