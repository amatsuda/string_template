# frozen_string_literal: true

require 'rails'
require 'action_view'
require_relative 'lib/string_template'
StringTemplate::Railtie.run_initializers
require 'action_view/base'
require 'benchmark_driver'

Benchmark.driver do |x|
  x.prelude %{ (view = Class.new(ActionView::Base).new('.')).instance_variable_set(:@world, 'world!') }
  x.report 'erb', %{ view.render(template: 'hello', handlers: 'erb') }
  x.report 'string', %{ view.render(template: 'hello', handlers: 'string') }
  x.compare!
end
