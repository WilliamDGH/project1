class BookingsController < ApplicationController
  before_action :check_for_login

  def create
    route = Route.find params[:route_id]
    if @current_user == route.user
      flash[:alert] = 'You cannot booking your own route.'
    else
      start_date = Date.parse bookings_params[:start_date]
      end_date = Date.parse bookings_params[:end_date]
      days = end_date - start_date + 1
      @booking = @current_user.bookings.build(bookings_params)
      @booking.route = route
      @booking.creater_id = route.user_id
      # @booking.price = route.price
      # @booking.total = route.price * days
      @booking.save

      flash[:notice] = 'Booked Successfully'
    end
    redirect_to route
  end


  private
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
