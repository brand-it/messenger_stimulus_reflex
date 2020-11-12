# Do it Yourself

Below is the list of commands I ran to create the basics. This will install the gems you need along with removing the things you don't need. I would

Check out https://docs.stimulusreflex.com/ to see some of the awesome that is going on

```shell
gem install rails
rails new messenger --skip-action-mailer --skip-action-mailbox --skip-active-storage
cd messenger
echo -e "ruby 2.7.2\nnodejs 14.15.0" > .tool-versions
asdf install
bundle add cable_ready stimulus_reflex
bin/rails webpacker:install:stimulus
bin/rails stimulus_reflex:install
echo -e "gem 'view_component', require: 'view_component/engine'" >> Gemfile
bundle install
bin/rails dev:cache
bin/rails g scaffold channel name --no-stylesheets --no-assets --no-scaffold-stylesheet
bin/rails g scaffold user name --no-stylesheets --no-assets --no-scaffold-stylesheet
bin/rails g scaffold message body:string user:references channel:references --no-stylesheets --no-assets --no-scaffold-stylesheet
bin/rails db:migrate
bin/rails g component Message message
echo -e "<div><%= @body %></div>" > app/components/message_component.html.erb
echo -e "Rails.application.routes.draw do\n  resources :channels\n  resources :users\n  resources :messages\n  root to: 'channels#index'\nend\n" > config/routes.rb
bin/rails generate stimulus_reflex message
bin/rails s
```
