# frozen_string_literal: true

module StringTemplate
  module Template
    def render(view, locals, buffer = nil, &block)
      if handler == StringTemplate::Handler
        instrument_render_template do
          view.instance_eval "%Q[#{source}]"
        end
      else
        super
      end
    end
  end
end
