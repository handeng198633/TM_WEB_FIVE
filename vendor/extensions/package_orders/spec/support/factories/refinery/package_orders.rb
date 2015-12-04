
FactoryGirl.define do
  factory :package_order, :class => Refinery::PackageOrders::PackageOrder do
    sequence(:number) { |n| "refinery#{n}" }
  end
end

