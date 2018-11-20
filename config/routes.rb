Rails.application.routes.draw do
  get 'index' => 'pages#index'
  post 'incoming_sms' => 'pages#incoming_sms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
