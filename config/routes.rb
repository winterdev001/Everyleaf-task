Rails.application.routes.draw do
  get 'deadlines/new'
  # get 'deadlines/new'
  # get 'deadlines/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'tasks#index'
     match 'sorted' => 'tasks#sorted', via: :get
    #  match '/deadline' => 'tasks#deadline', via: :get
    resources :tasks 
  # end
  resources :users
  resources :sessions
  get '/new', to: 'users#new'
end
