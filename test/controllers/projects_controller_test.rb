require "minitest_helper"

describe ProjectsController do

  before do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
    @customer = @project.customer
    
    sign_in @user
  end
  
  it "must get index without customer" do
    FactoryGirl.create_list(:project,10)
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  it "must get index" do
    get :index, customer_id: @customer.id
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  it "must get new" do
    get :new, customer_id: @customer.id
    assert_response :success
  end

  it "must create project" do
    assert_difference('Project.count') do
      post :create, customer_id: @customer.id, project: {  name: "New Project" }
    end

    assert_redirected_to customer_project_path(@customer,assigns(:project))
  end

  it "must show project" do
    get :show, customer_id:@customer.id, id: @project
    assert_response :success
  end

  it "must get edit" do
    get :edit, customer_id: @customer.id, id: @project
    assert_response :success
  end

  it "must update project" do
    put :update, customer_id: @customer.id, id: @project, project: { name: "Another New Project Name" }
    assert_redirected_to customer_project_path(@customer,assigns(:project))
  end

  it "must destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, customer_id:@customer.id, id: @project
    end

    assert_redirected_to customer_projects_path(@customer)
  end

end
