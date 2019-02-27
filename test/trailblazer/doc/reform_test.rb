require "test_helper"

class Reform::DocTest < Minitest::Test
  def test_that_it_keep_working_as_reform
    contract = AlbumForm.new(OpenStruct.new)
    valid = contract.validate({title: ""})
    expected_errors = {:title=>["can't be blank"], :year=>["can't be blank", "is not a number"]}
    refute valid
    assert_equal expected_errors, contract.errors.messages
  end

  def test_gives_the_properties_ready_to_doc
    doc = AlbumForm.doc
    expected_properties = [:title, :year]
    expected_validations = {
      :title=>[ {:presence=>true} ],
      :year=>[ {:presence=>true, :numericality=>true} ]
    }
    assert_equal expected_properties, doc.properties
    assert_equal expected_validations, doc.validations
  end
end
