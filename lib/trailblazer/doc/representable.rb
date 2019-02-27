module Representable
  module Doc
    module ClassMethods
      @@doc = Trailblazer::Doc::Description.new

      def doc
        @@doc
      end

      def property(name, options={})
        @@doc.add_property(name, options)
        super(name, options)
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
