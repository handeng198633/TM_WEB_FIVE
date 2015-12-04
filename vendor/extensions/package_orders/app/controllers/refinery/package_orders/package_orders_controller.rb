module Refinery
  module PackageOrders
    class PackageOrdersController < ::ApplicationController

      before_action :find_all_package_orders
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @package_order in the line below:
        present(@page)
      end

      def show
        @package_order = PackageOrder.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @package_order in the line below:
        present(@page)
      end

    protected

      def find_all_package_orders
        @package_orders = PackageOrder.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/package_orders").first
      end

    end
  end
end
