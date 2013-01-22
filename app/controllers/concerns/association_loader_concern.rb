module AssociationLoaderConcern
  
  def load_customer
    if params[:customer_id]
      id = params[:customer_id]
      @customer = Customer.find(id)
    end
  end
  
  def load_project
    if params[:project_id]
      id = params[:project_id]
      @project = Project.find(id)
    end
  end
  
  def load_task
    if params[:task_id]
      id = params[:task_id]
      @task = Task.find(id)
    end
  end
end