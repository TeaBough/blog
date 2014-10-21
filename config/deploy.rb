require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/whenever'

set :rbenv_path, '/usr/local/rbenv/'
set :domain, '127.0.0.1'
set :port, '2200'
set :user, 'blog'
set :deploy_to, '/var/www/blog'
set :repository, 'git@github.com:TeaBough/blog.git'
set :branch, 'master'

task :environment do
  invoke :'rbenv:load'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  queue 'export PATH=/usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH'
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
    queue "#{bundle_prefix} jekyll build"
  end
end