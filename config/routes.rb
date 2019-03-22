Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos

  get 'complete/:id', to: 'todos#complete', as: 'complete'

  get 'incomplete/:id', to: 'todos#incomplete', as: 'incomplete'

  root to: "todos#index"

end
