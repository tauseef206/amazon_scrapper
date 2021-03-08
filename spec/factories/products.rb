FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { 1.5 }
    customer_review { "MyString" }
    customer_review_count { 1 }
    shipping_message { "MyString" }
    asin { "MyString" }
    image { "MyString" }
    url { "MyString" }
    is_prime { false }
    sponsored_ad { false }
    coupon_info { "MyString" }
    badges_info { "" }
    url { nil }
  end
end
