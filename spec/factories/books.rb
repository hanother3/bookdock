FactoryBot.define do
  factory :book do
    isbn              {9784123456789}
    title             {"THE SAMPLE"} 
    author            {"著者"}
    publisher         {"テスト社"}
    image_url         {"https://thumbnail.image.rakuten.co.jp"}
    item_url          {"https://books.rakuten.co.jp"}
    read_status_id    { 2 }
    book_review       {"test"}
    association :user
  end
end
