class Order
  class << self
    def insert(args)
      db = DatabaseConnector.instance.connection
      values = args.values

      query = <<~SQL
        INSERT INTO users (user_id, description, accept)
        VALUES #{values}
        ON CONFLICT (user_id) DO UPDATE 
        SET description = EXCLUDED.description, accept = EXCLUDED.accept;
      SQL

      db.exec(query)
    end
  end
end 
