require './config/sidekiq'
require './database_connector'

class CsvWorker
  include Sidekiq::Worker

  sidekiq_options(retry: 0)

  def perform(args)
    Order.insert(batch)
  end
end
