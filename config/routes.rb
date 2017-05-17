Rails.application.routes.draw do
  get 'user/login'

  get 'user/forgot_password'

  get 'user/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
