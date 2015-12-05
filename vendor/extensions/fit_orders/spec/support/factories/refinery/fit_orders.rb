
FactoryGirl.define do
  factory :fit_order, :class => Refinery::FitOrders::FitOrder do
    sequence(:group_number) { |n| "refinery#{n}" }
  end
end

