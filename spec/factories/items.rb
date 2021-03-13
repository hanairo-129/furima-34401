FactoryBot.define do
  factory :item do
    
    item_name     {"テスト"}
    details       {"test"}
    category_id   {2}
    status_id     {2}
    delivery_id   {2}
    area_id       {2}
    post_time_id  {2}
    price         {"500"}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.png'), filename: 'test_image.png')
    end

    association :user

  end 
end
