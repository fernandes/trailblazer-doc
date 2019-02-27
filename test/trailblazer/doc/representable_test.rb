require "test_helper"

Album = Struct.new(:id, :title, :year)

class Representable::DocTest < Minitest::Test
  def setup
    @album = Album.new(1, "Black Album", 1991)
    @album_representer = AlbumRepresenter.new(@album)
  end

  def test_representable_keep_working
    expected_hash = { "id" => 1,"title" => "Black Album", "year" => 1991 }.to_json
    assert_equal expected_hash, @album_representer.to_json
  end

  def test_gives_the_properties_ready_to_doc
    doc = AlbumRepresenter.doc
    expected_properties = [:id, :title, :year]
    assert_equal expected_properties, doc.properties
  end
end
