PROJECT_ROOT ||= File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
LIB_LOCATION = File.join(PROJECT_ROOT, 'lib')
$LOAD_PATH << LIB_LOCATION
# This is a file that contains all the commonly used test methods
require 'dotenv/load' # to load native .env file
require 'pry'
require 'pry-nav' # allows next, step, keywords when debugging
