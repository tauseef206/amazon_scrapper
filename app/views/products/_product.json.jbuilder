json.extract! product, :id, :name, :price, :customer_review, :customer_review_count, :shipping_message, :asin, :image, :url, :is_prime, :sponsored_ad, :coupon_info, :badges_info, :url_id, :created_at, :updated_at
json.url product_url(product, format: :json)
