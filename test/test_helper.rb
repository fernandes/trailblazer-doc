$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "trailblazer/doc"

require "active_record"
require "active_support/core_ext/hash/indifferent_access"

require "reform"
require "representable"

require "reform/form/active_model/form_builder_methods"
require "reform/form/active_model"

require "reform/form/active_model/model_validations"
require "reform/form/active_model/validations"

require "reform/active_record" if defined?(ActiveRecord)
require "reform/mongoid" if defined?(Mongoid)

Reform::Form.class_eval do
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods
  include Reform::Form::ActiveRecord if defined?(ActiveRecord)
  include Reform::Form::ActiveModel::Validations
end

require "trailblazer/doc/reform"
require "trailblazer/doc/representable"

require_relative "./support/reform"
require_relative "./support/representable"

require "minitest/autorun"
require "reform"
