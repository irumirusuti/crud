class Admin::UsersController < ApplicationController
  
  before_filter :require_is_admin
  before_filter :find_user , :only => [:show , :edit , :update , :destroy]
  def index
    @users = User.all 
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(params[:user])
    if @user.save && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end 

  def edit
  end

  def show
  end

  def update
	  if @user.update_attributes(params[:forum])
      redirect_to [:admin , @user]
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.delete
    redirect_to admin_users_path
  end

  protected
  def find_user
    @user = User.find(params[:id]) 
  end

  def set_admin
    @user.is_admin = true 
    redirect_to admin_users_path 
  end

  def offset_admin
    @user.is_admin = false 
    redirect_to admin_users_path 
  end
  
end
