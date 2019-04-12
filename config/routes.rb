Rails.application.routes.draw do
  resources :responses
  resources :comments
  root 'static_pages#home'
  get '/about_me/', to: 'static_pages#about_me'
  get '/yoyo_maintenance/', to: 'static_pages#yoyo_maintenance'
  get '/tricks/', to: 'static_pages#tricks'
  get '/trick_list/', to: 'static_pages#trick_list'
  get '/resources/', to: 'static_pages#resources'
  post 'add_image_home', to: 'responses#add_image_home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
