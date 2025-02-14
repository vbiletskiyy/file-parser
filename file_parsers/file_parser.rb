require 'smarter_csv'

class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
