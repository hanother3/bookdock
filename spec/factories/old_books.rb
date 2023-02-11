FactoryBot.define do
  factory :old_book do
    old_title              { "old_test" }
    old_book_description   { Faker::Company.catch_phrase }
    price                  { Faker::Number.within(range: 300..9_999_999) }
    category_id            { 2 }
    book_condition_id      { 2 }
    delivery_charge_id     { 2 }
    area_id                { 2 }
    delivery_time_id       { 2 }
    association :user

    after(:build) do |old_book|
      old_book.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end    
  end
end
