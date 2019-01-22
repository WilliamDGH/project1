class UsersController < ApplicationController
  before_action :check_for_login, :only => [:join, :cancel]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to root_path, :notice => 'Account created sucessfully'
    else
      render :new, :alert => 'Signed in sucessfully'
    end
  end

  def show
    @user = User.find params[:id]
  end

  def join
    @route = Route.find params[:id]
    @route.passengers.push(@current_user.id)
    @route.decrement(:vacancy)
    @route.save
    user = User.find @current_user.id
    user.joined_routes.push(@route.id)
    user.save
    redirect_to @route
  end

  def cancel
    @route = Route.find params[:id]
    @route.passengers.delete(@current_user.id.to_s)
    @route.increment(:vacancy)
    @route.save
    user = User.find @current_user.id
    user.joined_routes.delete(@route.id.to_s)
    user.save
    redirect_to @route
  end

  def bookings
    @bookings = Booking.where( user_id: @current_user.id)

  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :fullname)
  end
end
