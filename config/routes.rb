Rails.application.routes.draw do
  post '/resume/:id' => 'pdf-renderer#show'
end
