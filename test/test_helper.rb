# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

# require logger before requiring rails, or Rails 6 fails to boot
require 'logger'
require 'rails'
require 'action_view'
require "string_template"
StringTemplate::Railtie.run_initializers
require 'action_view/base'

require "minitest/autorun"
