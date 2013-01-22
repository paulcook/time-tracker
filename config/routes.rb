Tracker::Application.routes.draw do
  
  resources :customers do
    resources :projects
  end
  
  resources :projects, only: [:index] do
    resources :tasks
  end
  
  resources :tasks, only: [:index] do
    resources :times, controller: "task_times"
  end
  
  devise_for :users

  root to: "dashboard#index"

end
