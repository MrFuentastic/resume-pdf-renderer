Rails.application.routes.draw do
  get '/resume' => 'pdf-renderer#index'
  post '/resume' => 'pdf-renderer#show'
end
