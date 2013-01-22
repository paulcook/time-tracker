require "minitest_helper"

describe Task do
  before do
    @task = Task.new(name: "Task Name A")
  end

  it "must be valid" do
    @task.valid?.must_equal true
  end
end
