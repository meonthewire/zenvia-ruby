require 'rails/generators/base'

class InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def zenvia_initializer
    copy_file 'zenvia.rb', 'config/initializers/zenvia.rb'
  end
end