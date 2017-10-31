Rails.application.routes.draw do
  get '/resume'
  get '/resume' => 'pdf-renderer#show'
end
