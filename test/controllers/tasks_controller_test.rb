require "minitest_helper"

describe TasksController do

  before do
    @user = FactoryGirl.create(:user)
    
    @task = FactoryGirl.create(:task)
    @project = @task.project
    
    sign_in @user
  end

  it "must get index" do
    get :index, project_id: @project.id
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  it "must get new" do
    get :new, project_id: @project.id
    assert_response :success
  end

  it "must create task" do
    assert_difference('Task.count') do
      post :create, project_id: @project.id, task: { name: "New Task Name" }
    end

    assert_redirected_to project_task_path(@project,assigns(:task))
  end

  it "must show task" do
    get :show, project_id: @project.id, id: @task
    assert_response :success
  end

  it "must get edit" do
    get :edit, project_id: @project.id, id: @task
    assert_response :success
  end

  it "must update task" do
    put :update, project_id: @project.id, id: @task, task: { name: "This is a new name" }
    assert_redirected_to project_task_path(@project,assigns(:task))
  end

  it "must destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, project_id: @project.id, id: @task
    end

    assert_redirected_to project_tasks_path(@project)
  end

end
