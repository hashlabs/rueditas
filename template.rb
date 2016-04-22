RAILS_VERSION = '4.2.5.1'
RUBY_VERSION = '2.3.0'

if __FILE__ =~ %r{\Ahttps?://}
  source_paths.unshift(tempdir = Dir.mktmpdir("rueditas-"))
  at_exit { FileUtils.remove_entry(tempdir) }
  git :clone => [
    "--quiet",
    "https://github.com/hashlabs/rueditas.git",
    tempdir
    ].join(" ")
else
  source_paths.unshift(File.dirname(__FILE__))
end

remove_file "Gemfile"
template "Gemfile.erb", "Gemfile"
template 'ruby-version.tt', '.ruby-version'
template 'ruby-gemset.tt', '.ruby-gemset', app_name
copy_file 'README.md'

inside 'config' do
  remove_file 'database.yml'
  template 'database.erb', 'database.yml', app_name
  copy_file 'puma.rb'
end

inside 'app' do
  inside 'assets' do
    inside 'stylesheets' do
      run "mv application.css application.scss"
    end
  end
end

if yes?("Would you like to install Devise? Y/N")
  gem "devise"
  install_devise = true
end

after_bundle do
  remove_dir "test"

	generate "rspec:install"
	generate "simple_form:install"
  generate "react:install"

  if install_devise
    generate "devise:install"
  end

  inside 'spec' do
    insert_into_file 'spec_helper.rb', "require 'simplecov'\nSimpleCov.start 'rails'\n", before: "RSpec.configure do |config|"
  end
end
