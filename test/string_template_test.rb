# frozen_string_literal: true

require 'test_helper'

class StringTemplateTest < Minitest::Test
  def setup
    @view = Class.new(ActionView::Base).new(ActionView::LookupContext.new(__dir__))
    super
  end

  def assert_render(expected, template, options = {})
    result = @view.render(options.merge(inline: template, type: 'string'))
    assert_equal expected, result
  end

  def test_no_interpolation
    assert_render 'hello', 'hello'
  end

  def test_basic_interpolation
    assert_render 'hello', '#{"hello"}'
  end

  def test_ivar
    @view.instance_variable_set :@foo, 'hello'
    assert_render 'hello', '#{@foo}'
  end

  def test_if
    assert_render 'hello', '#{if true;"hello";end}'
    assert_render 'hello', '#{"hello" if true}'
  end

  def test_each_as_map_and_join
    assert_render "hello\nhello\nhello",
      '#{[*1..3].map do
        "hello"
       end.join("\n")}'
  end

  def test_each_with_object
    assert_render "hello\nhello\nhello\n",
      '#{[*1..3].each_with_object("".dup) do |i, s|
        s << "hello\n"
       end}'
  end

  def test_locals
    assert_render 'hello', '#{foo}', locals: {foo: 'hello'}
  end

  def test_render_partial
    result = @view.render(template: 'main', handlers: 'string')
    assert_equal 'hello, world!', result.strip
  end
end
