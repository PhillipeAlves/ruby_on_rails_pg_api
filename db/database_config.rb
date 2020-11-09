require 'pg'
require 'active_record'

settings = {
    adapter: 'postgresql',
    database: 'my_database'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || settings)