Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about_me/', to: 'static_pages#about_me'
  get '/yoyo_maintenance/', to: 'static_pages#yoyo_maintenance'
  get '/tricks/', to: 'static_pages#tricks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
