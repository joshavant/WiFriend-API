# Remember: Configure PostGIS-related globals in config/application.rb
=begin
namespace :db do
  desc "Create the database and prepare with PostGIS .SQL seed files"
  task :create do
    app_config = Rails.configuration
    database_config = app_config.database_configuration[Rails.env]

    app_config.postgis_sql_filenames.each do |filename|
      shell_command = "psql -d #{database_config["database"]} -U #{database_config["username"]} -f #{app_config.postgis_sql_basepath}/#{filename} > /dev/null"
      raise Exception, "Error executing shell command:\n`" + shell_command + "`\nDoes the database user require a password? " \
                       "This task currently doesn't support database user passwords and having one will break this." unless system(shell_command)
    end
  end
end
=end