module Refinery
  module PackageOrders
    module Admin
      class PackageOrdersController < ::Refinery::AdminController

        crudify :'refinery/package_orders/package_order',
                :title_attribute => 'number'

        private

        # Only allow a trusted parameter "white list" through.
        def package_order_params
          params.require(:package_order).permit(:id, :number, :out_date, :return_date, :people, :travel_content_id, :price1, :price2, :price3, :price4, :out_traffic, :return_traffic, :cost, :package_ornot, :sales_name, :sales_time, :operation)
        end
      end
    end
  end
end
