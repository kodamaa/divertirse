# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

# Log rotation
config.logger = Logger.new(config.log_path, 3, 10.megabytes)

