TaskManager::Application.routes.draw do

  resource :user, only: :create do
    post 'login'
    get 'logout'
  end
  resources :projects, only: [:create, :update, :destroy, :index]
  resource :task, only: [:create, :update, :destroy] do
    get 'set_deadline'
    get 'set_priority'
    get 'mark_as_done'
  end
  
  root :to => 'manager#index'

end
