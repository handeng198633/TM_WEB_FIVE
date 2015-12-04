require 'spec_helper'

module Refinery
  module PackageOrders
    describe PackageOrder do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:package_order,
          :number => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:number) { should == "Refinery CMS" }
      end
    end
  end
end
