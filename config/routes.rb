ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.set_admin '/set_admin/:id' , :controller => 'admin/users' ,  :action => 'set_admin'
  map.offset_admin '/offset_admin/:id' , :controller => 'admin/users' , :action => 'offset_admin'
  map.resources :users

  map.resource :session

  map.namespace(:admin) do |admin|
    admin.resources :forums do |forum|
      forum.resources :posts 
    end
    admin.resources :users
  end
   map.resources :forums do |forum|
     forum.resources :posts
   end 

   map.root :controller => 'forums'

end
