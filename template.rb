RAILS_VERSION = '4.2.5.1'
RUBY_VERSION = '2.3'

def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

remove_file "Gemfile"
template "Gemfile.erb", "Gemfile"

# config the app to use postgres
remove_file 'config/database.yml'
template 'database.erb', 'config/database.yml', app_name

copy_file 'puma.rb', 'config/puma.rb'

if yes?("Would you like to install Devise? Y/N")
  gem "devise"
  install_devise = true
end

after_bundle do
  remove_dir "test"

	generate "rspec:install"
	generate "simple_form:install"

  if install_devise
    generate "devise:install"
  end
end
