class ProjectsController < ApplicationController
  
  include AssociationLoaderConcern
  
  before_filter :load_customer
  
  # GET /projects
  # GET /projects.json
  def index
    if @customer
      @projects = @customer.projects
    else
      @projects = Project.order("name asc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = @customer.projects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = @customer.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = @customer.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @customer.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to [@customer,@project], notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = @customer.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to [@customer,@project], notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = @customer.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to customer_projects_url(@customer) }
      format.json { head :no_content }
    end
  end
end
