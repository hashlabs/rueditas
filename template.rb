gem 'autoprefixer-rails'
gem 'newrelic_rpm'
gem 'pg'
gem 'rack-canonical-host'
gem 'rack-timeout'
gem 'simple_form'
gem 'puma'

gem 'react-rails'
gem 'bootstrap-sass'
gem 'sassc-rails'


gem_group :development do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'byebug'
  gem 'bullet'
  gem 'bundler-audit'
  gem 'spring'
  gem 'web-console'
  gem 'quiet_assets'
end

gem_group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_girl'
  gem 'formulaic'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'
  gem 'timecop-console', :require => 'timecop_console'
  gem 'database_cleaner'
end

# remove sqlite, rails-sass and turbolinks
gsub_file("Gemfile", /^gem\s+["']sqlite3["'].*$/, '')
gsub_file("Gemfile", /^gem\s+["']turbolinks["'].*$/, '')
gsub_file("Gemfile", /^gem\s+["']sass-rails["'].*$/, '')
gsub_file("Gemfile", /^(\s+)?#\s+.*$/, '')
gsub_file("Gemfile", /^\s*$/, '')

if yes?('Would you like to install Devise? Y/N')
  gem 'devise'
  install_devise = true
end

after_bundle do
	generate 'rspec:install'
	generate 'simple_form:install'

	if install_devise
		generate 'devise:install'
	  model_name = ask('What would you like the user model to be called? [user]')
	  model_name ||= 'user'
	  generate 'devise', model_name
	end
end
