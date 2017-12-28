# frozen_string_literal: true

module StringTemplate
  class Handler
    def self.call(template)
      "%Q[#{template.source}]"
    end

    def self.handles_encoding?
      true
    end
  end
end
