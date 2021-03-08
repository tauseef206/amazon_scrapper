require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Customer Review/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Shipping Message/)
    expect(rendered).to match(/Asin/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Coupon Info/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
