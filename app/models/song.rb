class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by!(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by!(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
      notes.each do |note|
         if note.strip != ''
           self.notes.build(content: note)
         end
       end
  end

  def note_contents
    self.notes.map do |a|
      a.content
    end
  end
end
