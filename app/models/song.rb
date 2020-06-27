class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content) if content != ""
    end
  end

  def note_contents
    self.notes.map { |note| note.content }
  end

end
