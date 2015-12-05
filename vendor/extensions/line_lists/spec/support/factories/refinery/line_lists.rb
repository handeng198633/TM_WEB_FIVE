
FactoryGirl.define do
  factory :line_list, :class => Refinery::LineLists::LineList do
    sequence(:group_number) { |n| "refinery#{n}" }
  end
end

