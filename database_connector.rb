require 'singleton'
require 'pg'

class DatabaseConnector
  include Singleton

  def initialize
    @connection = PG.connect(
      dbname: ENV.fetch('DB_NAME', 'file_parser'),
      user: ENV.fetch('DB_USER', 'postgres'),
      password: ENV.fetch('DB_PASSWORD', 'postgres')
    )
  end

  def connection
    @connection
  end
end
