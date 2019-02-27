module Reform
  module Doc
    module ClassMethods
      @@doc = Trailblazer::Doc::Description.new

      def doc
        @@doc
      end

      def property(name, options={}, &block)
        @@doc.add_property(name, options)
        super(name, options, &block)
      end

      def validates(*args, &block)
        @@doc.add_validation(args[0], args[1..-1])
        super(*args, &block)
      end
  
      def validate(*args, &block)
        super(*args, &block)
      end
  
      def validates_with(*args, &block)
        super(*args, &block)
      end
  
      def validates_each(*args, &block)
        super(*args, &block)
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
