module Refinery
  module PackageOrders
    class PackageOrder < Refinery::Core::BaseModel
      self.table_name = 'refinery_package_orders'


      validates :number, :presence => true, :uniqueness => true

      belongs_to :travel_content, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
