module PostHelper

  #overwrite authorized from lib/autheticated_system
  def edit_authorized?(post)
    
    if current_user
       current_user.id == post.user_id  
    end
  end

end
