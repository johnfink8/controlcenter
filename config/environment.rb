# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Controlcenter::Application.initialize!

APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

AWS.config(
  :access_key_id => APP_CONFIG['access_key_id'],
  :secret_access_key => APP_CONFIG['secret_access_key'])

require 'uuid'
require 'net/ssh'
