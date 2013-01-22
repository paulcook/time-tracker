Tracker::Application.routes.draw do
  
  resources :customers do
    resources :projects
  end
  
  resources :projects, only: [:index] do
    resources :tasks
  end
  
  resources :tasks, only: [:index] do
    resources :times, controller: "task_times"
    match "timer/show"=>"timer#show", as: :timer
    match "timer/start"=>"timer#start", as: :start_timer, via: :post
    match "timer/stop"=>"timer#stop", as: :stop_timer, via: :post
  end
  
  devise_for :users

  root to: "dashboard#index"

end
