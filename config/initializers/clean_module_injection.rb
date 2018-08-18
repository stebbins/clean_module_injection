require 'connection_pool_patch'

# Set constant for determining if DelayedJob ActiveRecord backend must use
# separate connection pool
USE_SEPARATE_DJ_DATABASE = ENV['USE_SEPARATE_DJ_DATABASE'] == 'true'

if USE_SEPARATE_DJ_DATABASE
  DJ_DATABASE = YAML.load(File.open('./config/dj_database.yml'))[Rails.env]
  Delayed::Backend::ActiveRecord::Job.include(ConnectionPoolPatch)
end
