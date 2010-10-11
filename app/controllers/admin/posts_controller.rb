class Admin::PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post , :only => [ :show , :edit , :update , :destroy ]
  before_filter :login_required , :only => [ :new , :create , :edit , :update , :destroy ] 
  before_filter :require_is_admin

  def index
    @posts = @forum.posts.paginate :page => params[:page]
  end
 

  def new
	  @post = @forum.posts.build
  end
  def create
	
	@post = @forum.posts.build(params[:post])
  @post.user = current_user 

  if @post.save
	  redirect_to admin_forum_post_path(@forum, @post)
	else
	  render :action => "new"
	end
  end

  def show
  end

  def edit
  end

  def update
	  if @post.update_attributes(params[:post])
      redirect_to admin_forum_post_path(@forum , @post)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post.delete
    redirect_to forum_posts_path(@forum)
  end


  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
  
  def find_post
    @post = Post.find(params[:id]) 
  end 

end
