require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        price: 2.5,
        customer_review: "Customer Review",
        customer_review_count: 3,
        shipping_message: "Shipping Message",
        asin: "Asin",
        image: "Image",
        url: "Url",
        is_prime: false,
        sponsored_ad: false,
        coupon_info: "Coupon Info",
        badges_info: "",
        url: nil
      ),
      Product.create!(
        name: "Name",
        price: 2.5,
        customer_review: "Customer Review",
        customer_review_count: 3,
        shipping_message: "Shipping Message",
        asin: "Asin",
        image: "Image",
        url: "Url",
        is_prime: false,
        sponsored_ad: false,
        coupon_info: "Coupon Info",
        badges_info: "",
        url: nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "Customer Review".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Shipping Message".to_s, count: 2
    assert_select "tr>td", text: "Asin".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Coupon Info".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
