module MarkdownViews
  class Engine < ::Rails::Engine
    config.autoload_once_paths = %W(
      #{root}/app/helpers
    )

    initializer "markdown_views.helpers", before: :load_config_initializers do
      ActiveSupport.on_load(:action_controller_base) do
        helper MarkdownViews::Engine.helpers
      end
    end

  end
end
