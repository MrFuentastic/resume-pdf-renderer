class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

  def show
    response = Unirest.patch("#{ ENV['HOST_NAME']}.json",
                headers:{"Accept" => "application/json"},
                parameters: {}
                ).body

    @student = Student.find(params[:id])

    pdf = Prawn::Document.new
    pdf.text "Hello World"
    pdf.render_file "assignment.pdf"
    @resume = Resume.find(params[:id])
  end

end
