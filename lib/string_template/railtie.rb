# frozen_string_literal: true

module StringTemplate
  class Railtie < ::Rails::Railtie
    initializer 'string_template' do
      ActiveSupport.on_load :action_view do
        require_relative 'template'
        ActionView::Template.prepend StringTemplate::Template

        ActionView::Template.register_template_handler :string, StringTemplate::Handler
      end
    end
  end
end
