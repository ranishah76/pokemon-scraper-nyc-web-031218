require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id, :hp

  def initialize(pokemonHash)
    @name = pokemonHash[:name]
    @type = pokemonHash[:type]
    @db = pokemonHash[:db]
    @id = pokemonHash[:id]
    @hp = 60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    p = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: p[0], name:p[1], type:p[2], db:db)
     end

    def self.create_hp_column
      db.execute("ALTER TABLE pokemon ADD hp DEFAULT = 60")
        end

end
