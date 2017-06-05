Rails.application.routes.draw do
  root :to => "projects#index"

	#User functions
  get "/login", :to => "user#login"
  get "/signup", :to => "user#signup"
	post "user/create"
  get "/forgot_password", :to => "user#forgot_password"
  get "/logout", :to => "sessions#logout"
	post 'sessions/login'

	#Dashboard functions
  get "/projects", :to => "projects#projects_list"
  get "/projects/new"
	get "/projects/edit/:id", :to => "projects#edit"
  get "/projects/:id", :to => "projects#show"
  get "/projects/delete/:id", :to => "projects#delete"

  # Error Handling route
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects
end
