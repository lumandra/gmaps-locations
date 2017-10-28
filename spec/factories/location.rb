FactoryGirl.define do
  factory :location do
    sequence(:name) { |i| "name#{ i}" }
    area "[[33.46496,-112.04003],[33.46382,-112.1008],[33.4293,-112.10063]]"
  end
end