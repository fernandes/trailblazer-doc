require "reform"
require "reform/form"
require "trailblazer/doc/reform"

class AlbumForm < Reform::Form
  include Reform::Doc

  property :title
  validates :title, presence: true

  property :year
  validates :year, presence: true, numericality: true
end
