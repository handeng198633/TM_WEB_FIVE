module Refinery
  module PackageOrders
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PackageOrders

      engine_name :refinery_package_orders

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "package_orders"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.package_orders_admin_package_orders_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PackageOrders)
      end
    end
  end
end
