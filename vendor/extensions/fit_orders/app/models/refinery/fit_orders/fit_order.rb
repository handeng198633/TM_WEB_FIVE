module Refinery
  module FitOrders
    class FitOrder < Refinery::Core::BaseModel
      self.table_name = 'refinery_fit_orders'


      validates :group_number, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
