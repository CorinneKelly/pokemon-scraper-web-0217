require 'pry'

class Pokemon

	attr_reader :id, :name, :type, :db
	attr_accessor :hp
	@@all = []

	def initialize(id:, name:, type:, db:, hp: 60)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
		@@all << self
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.all
		@@all
	end

	def self.find(id, db)
		pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)[0]

		self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)

	end

	def alter_hp(new_hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, @name)
	end
end
