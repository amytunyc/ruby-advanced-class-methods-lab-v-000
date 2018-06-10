class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song 
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    found = self.find_by_name(song_name)
    if found
      found
    else
      self.create_by_name(song_name)
    end
  end
    
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = self.new 
    song.name = array[1]
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(filename)
  end
end
