# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Enable the breakpoint server that script/breakpointer connects to
# config.breakpoint_server = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = false
#config.action_view.cache_template_extensions         = false
config.action_view.debug_rjs                         = true

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

config.action_mailer.delivery_method = :smtp
config.action_mailer.logger = Logger.new($stdout)
config.action_mailer.logger.level = Logger::DEBUG
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'bizreportstest@gmail.com',
  :password             => 'bHpzk67cgQ',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

require 'development_logger'
config.logger = DevelopmentLogger.new(File.dirname(__FILE__) + "/../../log/#{RAILS_ENV}.log", 0, 0)
