class PKFactory
  def create_pk(row)
    puts "creating #{row.inspect}"
    row['_id'] = row['name']
    row
  end
end

Mongoid.configure do |config|
  puts config.inspect
  config.master = Mongo::Connection.new.db(Mongoid.database.name, :pk => PKFactory.new)
end

