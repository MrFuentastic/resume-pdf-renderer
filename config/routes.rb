Rails.application.routes.draw do
<<<<<<< HEAD
  get '/resume'
=======
  get '/resume' => 'pdf-renderer#show'
>>>>>>> 18ef47a886676d3d7bffd5321f872425fbc1b1e5
end
