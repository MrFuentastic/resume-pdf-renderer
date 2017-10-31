class PdfRenderersController < ApplicationController
require "prawn"

  def show
    @student = Student.find(params[:id])

    pdf = Prawn::Document.new
    pdf.text "Hello World"
    pdf.render_file "assignment.pdf"
  end

end
