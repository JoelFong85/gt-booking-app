Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to:"main#landing_page"

  post 'main/select_room'
  post 'main/select_room_slots'
  post 'main/make_booking'
  
end
