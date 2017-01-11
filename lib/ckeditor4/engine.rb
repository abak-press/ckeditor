require 'rails'
require 'ckeditor4'

module Ckeditor4
  class Engine < ::Rails::Engine
    isolate_namespace Ckeditor4

    initializer "ckeditor.assets_precompile", :group => :all do |app|
      app.config.assets.precompile += Ckeditor4.assets
    end

    initializer "ckeditor.helpers" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send :include, Ckeditor4::Helpers::Controllers
      end

      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, Ckeditor4::Helpers::ViewHelper
        ActionView::Base.send :include, Ckeditor4::Helpers::FormHelper
        ActionView::Helpers::FormBuilder.send :include, Ckeditor4::Helpers::FormBuilder
      end
    end

    initializer "ckeditor.hooks" do
      if Object.const_defined?("Formtastic")
        require "ckeditor4/hooks/formtastic"
      end

      if Object.const_defined?("SimpleForm")
        require "ckeditor4/hooks/simple_form"
      end

      if Object.const_defined?("CanCan")
        require "ckeditor4/hooks/cancan"
      end

      if Object.const_defined?("Pundit")
        require "ckeditor4/hooks/pundit"
      end
    end

    rake_tasks do
      load Ckeditor4.root_path.join("lib/tasks/ckeditor.rake")
    end
  end
end
