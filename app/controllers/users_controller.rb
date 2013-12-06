class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def index
   @users = User.paginate(page: params[:page])
  end 
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    @user.password=params['regpwd']
    if @user.save
      UserMailer.activate_acount(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Blog!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def cambiar
    @user=User.find(params[:id])
    @user.admin=true
    flash[:success] = "Usuario cambiado a administrador"
    redirect_to users_url
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :career, :birthday, :admin)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
