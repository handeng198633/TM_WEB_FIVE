module Refinery
  module FitOrders
    class FitOrdersController < ::ApplicationController

      before_action :find_all_fit_orders
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @fit_order in the line below:
        present(@page)
        respond_to do |format|
        format.html
        format.json { render json: FitOrdersDatatable.new(view_context) }
      end
      end

      def show
        @fit_order = FitOrder.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @fit_order in the line below:
        present(@page)
      end

    protected

      def find_all_fit_orders
        @fit_orders = FitOrder.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/fit_orders").first
      end

    end
  end
end
