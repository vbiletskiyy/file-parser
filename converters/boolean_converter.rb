class BooleanConverter
  def self.convert(value)
    case value
    when /true/i
      true
    when /false/i
      false
    else
      'NULL'
    end
  end
end
