module Refinery
  module LineLists
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::LineLists

      engine_name :refinery_line_lists

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "line_lists"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.line_lists_admin_line_lists_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::LineLists)
      end
    end
  end
end
