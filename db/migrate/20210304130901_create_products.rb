class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :customer_review
      t.integer :customer_review_count
      t.string :shipping_message
      t.string :asin
      t.string :image
      t.string :url
      t.boolean :is_prime
      t.boolean :sponsored_ad
      t.string :coupon_info
      t.text :badges_info, array: true, default: []
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
