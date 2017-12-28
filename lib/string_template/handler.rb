# frozen_string_literal: true

module StringTemplate
  class Handler
    def self.call(template)
      "%Q\0#{template.source}\0"
    end

    def self.handles_encoding?
      true
    end
  end
end
