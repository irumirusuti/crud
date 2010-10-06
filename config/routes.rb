ActionController::Routing::Routes.draw do |map|

   map.resources :forums do |forum|
     forum.resources :posts
   end 

   map.root :controller => 'forums'

end
