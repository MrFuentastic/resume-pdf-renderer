Rails.application.routes.draw do
<<<<<<< HEAD
  post '/resume/:id' => 'pdf-renderer#show'
=======
  get '/resume'
  get '/resume' => 'pdf-renderer#show'
>>>>>>> 71eb785ad29389d9bcb5b26e7c3d576b6a59fe44
end
