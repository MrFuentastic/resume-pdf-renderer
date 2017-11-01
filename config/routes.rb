Rails.application.routes.draw do
<<<<<<< HEAD
  get '/resume/dope' => 'pdf_renderers#dope'
=======
  get '/' => 'pdf_renderers#wacky'
  get '/resume/:id/dope' => 'pdf_renderers#dope'
>>>>>>> 1ad9821440b17cd2adb9efab2648a81be1cd7c1e
  get '/resume/:id/wacky' => 'pdf_renderers#wacky'
  get '/resume/:id/prof' => 'pdf_renderers#prof'
end
