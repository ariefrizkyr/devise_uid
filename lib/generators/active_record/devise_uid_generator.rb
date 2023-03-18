require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class DeviseUidGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_devise_migration
        migration_template "migration.rb", "db/migrate/devise_uid_add_to_#{table_name}.rb", migration_version: migration_version
      end

      def rails5_and_up?
        Rails::VERSION::MAJOR >= 5
      end

      def rails61_and_up?
        Rails::VERSION::MAJOR > 6 || (Rails::VERSION::MAJOR == 6 && Rails::VERSION::MINOR >= 1)
      end

      def migration_version
        if rails5_and_up?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end
