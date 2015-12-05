module Refinery
  module FitOrders
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::FitOrders

      engine_name :refinery_fit_orders

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "fit_orders"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.fit_orders_admin_fit_orders_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FitOrders)
      end
    end
  end
end
