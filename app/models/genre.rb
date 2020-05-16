class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.group_by{|song| song.artist_id}.keys.count
  end

  def all_artist_names
    self.songs.map{|song| song.artist.name}
  end
end
