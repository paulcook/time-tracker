require "minitest_helper"

describe TaskTimesController do

  before do
    @user = FactoryGirl.create(:user)
    @task_time = FactoryGirl.create(:task_time)
    @task = @task_time.task
    
    sign_in @user
  end

  it "must get index" do
    get :index, task_id: @task
    assert_response :success
    assert_not_nil assigns(:task_times)
  end

  it "must get new" do
    get :new, task_id: @task
    assert_response :success
  end

  it "must create task_time" do
    assert_difference('TaskTime.count') do
      post :create, task_id: @task, task_time: { user_id: @user.id, hours: 1, minutes: 1, seconds: 1 }
    end

    assert_redirected_to task_time_path(@task,assigns(:task_time))
  end

  it "must show task_time" do
    get :show, task_id: @task, id: @task_time
    assert_response :success
  end

  it "must get edit" do
    get :edit, task_id: @task, id: @task_time
    assert_response :success
  end

  it "must update task_time" do
    put :update, task_id: @task, id: @task_time, task_time: { hours: 2 }
    assert_redirected_to task_time_path(@task,assigns(:task_time))
  end

  it "must destroy task_time" do
    assert_difference('TaskTime.count', -1) do
      delete :destroy, task_id: @task, id: @task_time
    end

    assert_redirected_to task_times_path(@task)
  end

end
