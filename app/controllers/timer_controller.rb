class TimerController < ApplicationController
  
  def show
    show_layout = request.xhr?
    
    @task = Task.find(params[:task_id])
    @task_time = @task.task_times.create(user_id: current_user.id, started_at: Time.now)
    
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
  
  def start
    
  end
  
  def stop
    @task = Task.find(params[:task_id])
    @task_timer = @task.task_times.find(params[:id])
    @task_timer.update_time_from_string(params[:time_string])
    
    render :nothing=>true
  end
end
