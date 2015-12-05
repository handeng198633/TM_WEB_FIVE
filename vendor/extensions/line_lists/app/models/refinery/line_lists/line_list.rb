module Refinery
  module LineLists
    class LineList < Refinery::Core::BaseModel
      self.table_name = 'refinery_line_lists'


      validates :group_number, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Resource'

      belongs_to :document, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
