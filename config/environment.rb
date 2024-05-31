# Environment configuration file

# Load the Rails environment
require 'rails/all'

# Set the Rails environment
Rails.env = ENV['RAILS_ENV'] || 'development'

# Load the database configuration
require 'database'

# Set the timezone
Time.zone = 'UTC'

# Set the locale
I18n.locale = :en

# Configure the asset pipeline
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets')

# Configure the logger
Rails.application.config.log_level = :debug
Rails.application.config.logger = Logger.new(STDOUT)

# Configure the cache store
Rails.application.config.cache_store = :memory_store

# Configure the session store
Rails.application.config.session_store = :cookie_store

# Configure the mailer
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address: 'mtp.gmail.com',
  port: 587,
  domain: 'greenfitriestate.com',
  authentication: 'plain',
  user_name: 'greenfitriestate@gmail.com',
  password: 'password'
}

# Configure the authentication
Rails.application.config.authentication = {
  strategy: :jwt,
  secret_key: 'ecret_key',
  expiration_time: 1.hour
}

# Load the application configuration
require 'application'
