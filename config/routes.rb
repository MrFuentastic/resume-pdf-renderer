Rails.application.routes.draw do
  get '/resume/:id' => 'pdf_renderers#show'
end
