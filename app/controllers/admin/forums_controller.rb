class Admin::ForumsController < ApplicationController
 
  before_filter :require_is_admin  
  before_filter :find_forum , :only => [ :show , :edit , :update , :destroy ]
  
  def index
	  @forums = Forum.all
  end

  def new
	  @forum = Forum.new
  end

  def create
	
	@forum = Forum.new(params[:forum])
	if @forum.save
	  redirect_to @forum
	else
	  render :action => "new"
	end
  end

  def show
  end

  def edit
  end

  def update
	  if @forum.update_attributes(params[:forum])
      redirect_to @forum
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @forum.delete
    redirect_to forums_path
  end

  def find_forum
	  @forum = Forum.find(params[:id])
  end

end
