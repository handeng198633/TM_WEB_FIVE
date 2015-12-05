module Refinery
  module LineLists
    module Admin
      class LineListsController < ::Refinery::AdminController

        crudify :'refinery/line_lists/line_list',
                :title_attribute => 'group_number'

        private

        # Only allow a trusted parameter "white list" through.
        def line_list_params
          params.require(:line_list).permit(:line_id, :group_number, :last_day, :line_name, :line_info, :travel_content, :picture_id, :document_id, :price, :record_person, :sales_ornot)
        end
      end
    end
  end
end
