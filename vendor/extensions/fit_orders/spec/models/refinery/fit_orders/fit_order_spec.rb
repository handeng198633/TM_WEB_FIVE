require 'spec_helper'

module Refinery
  module FitOrders
    describe FitOrder do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:fit_order,
          :group_number => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:group_number) { should == "Refinery CMS" }
      end
    end
  end
end
