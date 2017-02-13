class Pokemon

	attr_reader :id, :name, :type, :db, :hp
	@@all = []

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = 60
		@@all << self
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.all
		@@all
	end

	def self.find(id, db)
		pokemon = db.execute("SELECT name, type FROM pokemon WHERE pokemon.id = ?;", id)[0]
		self.new(id: id, name: pokemon[0], type: pokemon[1], db: db )
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, @name)
	end
end
