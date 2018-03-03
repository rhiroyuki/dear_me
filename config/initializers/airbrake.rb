require 'airbrake-ruby'

Airbrake.configure do |c|
  c.project_id = ENV.fetch('AIRBRAKE_PROJECT_ID', '')
  c.project_key = ENV.fetch('AIRBRAKE_API_KEY', '')
  c.environment = Rails.env
  c.ignore_environments = %w(development test)
  c.root_directory = Rails.root
end
