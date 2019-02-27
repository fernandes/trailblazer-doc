class Trailblazer::Doc::Description
  def initialize
    @properties = {}
  end

  def properties
    @properties.keys
  end

  def validations
    validation_items = {}
    @properties.each { |k, v| validation_items[k] = v[:validations] }
    validation_items
  end

  def add_property(name, options = {})
    @properties[name.to_sym] = {options: options}
  end

  def add_validation(name, *validations)
    @properties[name.to_sym] = {validations: validations[0]}
  end
end
