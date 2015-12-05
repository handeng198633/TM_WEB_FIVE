module Refinery
  module FitOrders
    module Admin
      class FitOrdersController < ::Refinery::AdminController

        crudify :'refinery/fit_orders/fit_order',
                :title_attribute => 'group_number'

        private

        # Only allow a trusted parameter "white list" through.
        def fit_order_params
          params.require(:fit_order).permit(:order_id, :group_number, :out_date, :return_date, :book_id, :book_name, :person_list, :come_info, :go_info, :price1, :price2, :price3, :price4, :customer)
        end
      end
    end
  end
end
