Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :todos, only: [ :create, :update, :destroy ]
  root "todos#index"
end
