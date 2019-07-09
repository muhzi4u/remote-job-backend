Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
  path: "",
  path_names: {
       registration: "signup"
  },
  controllers: {
      sessions: 'sessions',
      registrations: 'registrations' 
  },
  defaults: { format: :json }
end
