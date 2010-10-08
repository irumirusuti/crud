set :application, "crud"

set :repository,  "git://github.com/irumirusuti/crud.git"
set :branch, "master"
set :deploy_to, "/home/apps/crud"

set :user, "apps"
set :use_sudo, false

set :scm, "git"
set :deploy_via, :remote_cache

role :app, "175.41.141.229"
role :web, "175.41.141.229"
role :db,  "175.41.141.229", :primary => true

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
       run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :my_tasks do
  desc "Create database.yml and asset packages for staging"
  task :symlink, :roles => [:app] do
    symlink_hash = {
      "#{shared_path}/config/database.yml"  => "#{release_path}/config/database.yml",
      "#{shared_path}/system"  => "#{release_path}/public/system"
    }
    
    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
    
  end
end

after "deploy:update_code", "my_tasks:symlink"
