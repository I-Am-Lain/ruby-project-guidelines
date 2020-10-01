require 'bundler'
require 'rainbow'
require "tty-prompt"

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil
#############
#DB = {:conn => SQLite3::Database.new("db/development.db")}