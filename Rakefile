# Load gems
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

# RDOc
require 'rdoc/task'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Grape::ForgeryProtection'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Engine
APP_RAKEFILE = File.expand_path('spec/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'

# Bundler
Bundler::GemHelper.install_tasks

# Rubocop
require 'rubocop/rake_task'
RuboCop::RakeTask.new

# Specs
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc "Commit, create tag v#{Grape::ForgeryProtection::VERSION}, " \
     'build and push (make sure you update version.rb and CHANGELOG.md ' \
     'beforehand)'
task grape_forgery_protection_release: :build do
  sh 'git add lib/grape/forgery_protection/version.rb CHANGELOG.md'
  sh "git commit -m v#{Grape::ForgeryProtection::VERSION}"
  sh "git tag v#{Grape::ForgeryProtection::VERSION}"
  sh 'git push'
  sh 'git push --tags'
  puts
  puts 'Done! You can now upload ' \
       "pkg/grape-forgery_protection-#{Grape::ForgeryProtection::VERSION}.gem "\
       'to rubygems'
end

task default: %i[spec rubocop]
