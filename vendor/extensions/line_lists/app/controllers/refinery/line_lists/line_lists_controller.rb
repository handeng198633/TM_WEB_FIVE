module Refinery
  module LineLists
    class LineListsController < ::ApplicationController

      before_action :find_all_line_lists
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @line_list in the line below:
        present(@page)
      end

      def show
        @line_list = LineList.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @line_list in the line below:
        present(@page)
      end

    protected

      def find_all_line_lists
        @line_lists = LineList.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/line_lists").first
      end

    end
  end
end
