module Music
  class Track < ActiveRecord::Base

    validates :artist, presence: true
    validates :title, presence: true
    validates :filepath, presence: true, uniqueness: true
    validates :track_number, numericality: { greater_than: 0, only_integer: true }

  end
end