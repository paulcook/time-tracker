require "minitest_helper"

describe TaskTime do
  before do
    @task_time = TaskTime.new
  end

  it "must be valid" do
    @task_time.valid?.must_equal true
  end
  
  it "calculate total minutes returns 0 if no inputs" do
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 0
  end
  
  it "calculate total minutes returns 1 if 1 minute" do
    @task_time.minutes = 1
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 1
  end
  
  it "calculate total minutes returns 60 if 1 hour" do
    @task_time.hours = 1
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 60
  end
  
  it "calculate total minutes returns 1 if 30 seconds" do
    @task_time.seconds = 30
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 1
  end
  
  it "calculate total minutes returns 1 if > 30 seconds" do
    @task_time.seconds = 31
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 1
  end
  
  it "calculate total minutes returns 0 if < 30 seconds" do
    @task_time.seconds = 29
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 0
  end
  
  it "calculate total minutes returns time in minutes" do
    @task_time.hours = 1
    @task_time.minutes = 30
    @task_time.seconds = 31
    @task_time.calculate_total_time
    @task_time.total_time.must_equal 91
  end
  
  it "total time will be set to 0 before being saved" do
    @task_time.save
    @task_time.persisted?.must_equal true
    @task_time.total_time.must_equal 0
  end
  
  it "total time will be set by time parts before being saved" do
    @task_time.hours = 2
    @task_time.save
    @task_time.persisted?.must_equal true
    @task_time.total_time.must_equal 120
  end
  
end
