set :application, "myapp"
set :deploy_to, "/home/rails/myapp"

set :repository,  "git@github.com:a1114tk/myapp"
set :scm, :git

set :use_sudo, false

role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
