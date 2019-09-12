# frozen_string_literal: true

require 'benchmark_driver'

Benchmark.driver do |x|
  x.prelude %{
    require 'rails'
    require 'action_view'
    require 'string_template'
    StringTemplate::Railtie.run_initializers
    require 'action_view/base'

    (view = Class.new(ActionView::Base).new(ActionView::LookupContext.new(''))).instance_variable_set(:@world, 'world!')
  }
  x.report 'erb', %{ view.render(template: 'hello', handlers: 'erb') }
  x.report 'string', %{ view.render(template: 'hello', handlers: 'string') }
end
