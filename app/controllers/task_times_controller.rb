class TaskTimesController < ApplicationController
  
  include AssociationLoaderConcern
  
  before_filter :load_task
  
  # GET /task_times
  # GET /task_times.json
  def index
    
    @task_times = @task.task_times.order("stopped_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_times }
    end
  end

  # GET /task_times/1
  # GET /task_times/1.json
  def show
    @task_time = @task.task_times.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_time }
    end
  end

  # GET /task_times/new
  # GET /task_times/new.json
  def new
    @user = current_user
    @task_time = @task.task_times.build(user_id: @user.id)
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_time }
    end
  end

  # GET /task_times/1/edit
  def edit
    @task_time = @task.task_times.find(params[:id])
  end

  # POST /task_times
  # POST /task_times.json
  def create
    @task_time = @task.task_times.build(params[:task_time])

    respond_to do |format|
      if @task_time.save
        format.html { redirect_to task_time_path(@task,@task_time), notice: 'Task time was successfully created.' }
        format.json { render json: @task_time, status: :created, location: @task_time }
      else
        format.html { render action: "new" }
        format.json { render json: @task_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_times/1
  # PUT /task_times/1.json
  def update
    @task_time = @task.task_times.find(params[:id])

    respond_to do |format|
      if @task_time.update_attributes(params[:task_time])
        format.html { redirect_to task_time_path(@task,@task_time), notice: 'Task time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_times/1
  # DELETE /task_times/1.json
  def destroy
    @task_time = @task.task_times.find(params[:id])
    @task_time.destroy

    respond_to do |format|
      format.html { redirect_to task_times_url(@task) }
      format.json { head :no_content }
    end
  end
end
