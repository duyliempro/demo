class UsersController < ApplicationController


  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      #redirect_to root_url
      redirect_to @user
    else
      flash[:error] = "Failed to create User!"
      render :new
    end
    #render :new
  end


  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash[:error] = "Failed: User not found!"
      render "users/1"
    end
  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
