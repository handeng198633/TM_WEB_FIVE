require 'spec_helper'

module Refinery
  module LineLists
    describe LineList do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:line_list,
          :group_number => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:group_number) { should == "Refinery CMS" }
      end
    end
  end
end
