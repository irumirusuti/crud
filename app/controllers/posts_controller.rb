class PostsController < ApplicationController

  before_filter :find_forum

  def index
	  @posts = Post.all
  end

  def new
	  @post = Post.new
  end

  def create
	
	@post = Post.new(params[:post])
	if @post.save
	  redirect_to forum_post_path(@forum, @post)
	else
	  render :action => "new"
	end
  end

  def show
	  @post = Post.find(params[:id])
  end

  def edit
	  @post = Post.find(params[:id])
  end

  def update
	  @post = Post.find(params[:id])
	  if @post.update_attributes(params[:post])
      redirect_to forum_post_path(@forum , @post)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to forum_posts_path(@forum)
  end
  
  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

end
