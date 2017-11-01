Rails.application.routes.draw do
  get '/' => 'pdf_renderers#show'
  get '/resume/:id/dope' => 'pdf_renderers#dope'
  get '/resume/:id/wacky' => 'pdf_renderers#wacky'
  get '/resume/:id/prof' => 'pdf_renderers#prof'
end
