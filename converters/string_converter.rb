class StringConverter
  def self.convert(value)
    value.to_s.empty? ? 'NULL' : value
  end
end
