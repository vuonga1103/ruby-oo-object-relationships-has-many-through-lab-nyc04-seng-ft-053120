class Genre
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song_instance| song_instance.genre == self }
  end

  def artists
    self.songs.map { |song_instance| song_instance.artist }
  end

end