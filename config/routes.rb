Rails.application.routes.draw do
  get '/resume' => 'pdf-renderer#show'
end
