Workflow::Application.routes.draw do
  resources :deployments
  resources :process_definitions do
    resources :instances, :controller => :process_instances
    member do
      get :properties
      get :diagram
    end
  end
  resources :process_instances do
    resources :tasks
  end
  resources :tasks do
    member do
      post :claim
      post :unclaim
      post :complete
    end
  end
end
