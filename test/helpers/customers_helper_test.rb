require "minitest_helper"

describe CustomersHelper do

  it "must be able to get array of states" do
    us_subregions.must_be_kind_of Array
    us_subregions.wont_be :empty?
  end

end
