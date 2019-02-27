require "representable"
require "representable/decorator"

class AlbumRepresenter < Representable::Decorator
  include Representable::JSON
  include Representable::Doc

  property :id
  property :title
  property :year
end
