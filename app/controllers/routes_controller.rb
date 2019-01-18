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



  private
  def strong_params
    params.require(:route).permit(:start, :end, :capacity)
  end
end
