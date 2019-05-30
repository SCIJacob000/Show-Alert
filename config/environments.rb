configure :production, :development do 

	db = URI.parse(ENV['DTATBASE_URL'] || 'postgres://localhost/show_stopper')

	ActiveRecord::Base.establish_connection(
		:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
		:host => db.host,
		:username => db.user,
		:password => db.password,
		:database => db.path[1..-1],
		:encoding => 'utf8'
		)
end