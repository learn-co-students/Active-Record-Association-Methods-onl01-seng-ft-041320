class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  
  def get_first_song
    self.songs.first
  end

  def get_genre_of_first_song
   first_song = self.get_first_song
   first_song.genre 
  end

  def song_count
    self.songs.all.size 
  end

  def genre_count
    new_array = []
    self.songs.all.each do |song|
      new_array << song.genre
    end
    new_array.uniq.size
  end
end
