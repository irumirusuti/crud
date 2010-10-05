class ForumsController < ApplicationController
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
	  @forum = Forum.find(params[:id])
  end

  def edit
	  @forum = Forum.find(params[:id])
  end

  def update
	  @forum = Forum.find(params[:id])
	  if @forum.update_attributes(params[:forum])
      redirect_to @forum
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    @forum.delete
    redirect_to forums_path
  end
end
