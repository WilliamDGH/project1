class RoutesController < ApplicationController
  before_action :check_for_login, :except => [:index, :show]

  def new
    @route = Route.new
  end

  def create
    route = Route.new strong_params
    route.user_id = @current_user.id
    route.save
    redirect_to route
  end

  def index
    if @current_user.present?
      @routes = Route.where.not :user_id => @current_user.id
    else
      @routes = Route.all
    end
  end

  def my_index
    @routes = Route.where :user_id => @current_user.id
  end

  def show
    @route = Route.find params[:id]
  end

  def edit
    @route = Route.find params[:id]
  end

  def update
    route = Route.find params[:id]
    route.update strong_params
    redirect_to route
  end

  def joined
    @routes = []
    @current_user.joined_routes.each do |r|
      @routes.push(Route.find r.to_s)
    end
  end

  def destroy
    route = Route.find params[:id]
    route.destroy
    redirect_to routes_my_path
  end

# ---for bookings
  def preload
    @route = Route.find params[:id]
    today = Date.today
    bookings = @route.bookings.where("start_date >= ? OR end_date >= ?", today, today)

    render json: bookings
  end

  def preview
    route = Route.find params[:id]
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    @days = end_date - start_date + 1
    output = {
      conflict: is_conflict(start_date, end_date, route)
    }

    render json: output
  end

  private
  def strong_params
    params.require(:route).permit(:start, :end, :capacity)
  end

  def is_conflict(start_date, end_date, route)
    check = route.bookings.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0? true : false
  end
end
