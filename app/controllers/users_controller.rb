class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:succes] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user = User.update(user_params)
      flash[:succes] = " Your account was updated succesfully"
      redirect_to articles_path
    else
      render 'show'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end