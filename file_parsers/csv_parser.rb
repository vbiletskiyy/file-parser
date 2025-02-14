require './workers/csv_worker'
require './converters/boolean_converter'
require './converters/string_converter'


require_relative 'file_parser'

class CsvParser < FileParser
  BATCH_SIZE = 10_000

  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    options = {
      chunk_size: ENV.fetch('CHUNK_SIZE', 1000).to_i,
      key_mapping: {
        user_id: 'user_id',
        description: 'description',
        accept: 'accept'
      },
      value_converters: {
        'description' => StringConverter,
        'accept' => BooleanConverter
      }
    }
    SmarterCSV.process(@file_path, options) do |batch|
      CsvWorker.perform_bulk(batch.zip)
    end
  end
end
