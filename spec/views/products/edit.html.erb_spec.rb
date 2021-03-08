require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      price: 1.5,
      customer_review: "MyString",
      customer_review_count: 1,
      shipping_message: "MyString",
      asin: "MyString",
      image: "MyString",
      url: "MyString",
      is_prime: false,
      sponsored_ad: false,
      coupon_info: "MyString",
      badges_info: "",
      url: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[customer_review]"

      assert_select "input[name=?]", "product[customer_review_count]"

      assert_select "input[name=?]", "product[shipping_message]"

      assert_select "input[name=?]", "product[asin]"

      assert_select "input[name=?]", "product[image]"

      assert_select "input[name=?]", "product[url]"

      assert_select "input[name=?]", "product[is_prime]"

      assert_select "input[name=?]", "product[sponsored_ad]"

      assert_select "input[name=?]", "product[coupon_info]"

      assert_select "input[name=?]", "product[badges_info]"

      assert_select "input[name=?]", "product[url_id]"
    end
  end
end
