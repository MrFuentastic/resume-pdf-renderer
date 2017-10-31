Rails.application.routes.draw do
  get '/resume' => 'pdf_renderers#show'
end
