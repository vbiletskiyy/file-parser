require './file_parsers/csv_parser.rb'

file_path = '_sample.csv'
parser = CsvParser.new(file_path)
parser.parse
