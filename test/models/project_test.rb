require "minitest_helper"

describe Project do
  before do
    @project = Project.new(name: "This is a new Project")
  end

  it "must be valid" do
    @project.valid?.must_equal true
  end
end
