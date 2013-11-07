require 'rails/generators/base'

module Zenvia
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def zenvia_initializer
        copy_file 'zenvia.rb', 'config/initializers/zenvia.rb'
      end
    end
  end
end