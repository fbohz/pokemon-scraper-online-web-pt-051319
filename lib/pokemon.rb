class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db) 
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db) 
    result = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).flatten
    self.new(id: id, name: result[1], type: result[2], db: db)
  end 
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
  
end
