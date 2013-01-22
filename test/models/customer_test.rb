require "minitest_helper"

describe Customer do
  before do
    @customer = Customer.new(name: "Company A")
  end

  it "must be valid" do
    @customer.valid?.must_equal true
  end
end
