# Set constant for determining if DelayedJob ActiveRecord backend must use
# separate connection pool
USE_SEPARATE_DJ_DATABASE = ENV['USE_SEPARATE_DJ_DATABASE'] == 'true'
