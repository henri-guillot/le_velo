class BookingsController < ApplicationController
  before_action :set_bike, only: [:create]

  def index
    @bookings = Booking.where(user: current_user)
    @my_booked_bikes = Booking.where(bike: Bike.where(user: current_user))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    @booking.status = "Pending"
    @booking.total_price = (@booking.end_date - @booking.start_date) * @bike.price_per_day
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render partial: "form", locals: { bike: @bike, booking: @booking }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    redirect_to booking_path(@booking)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: "Rejected")
    redirect_to booking_path(@booking)
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
