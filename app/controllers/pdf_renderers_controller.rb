class PdfRenderersController < ApplicationController
require "prawn"

  def show
    pdf = Prawn::Document.new
    pdf.text "Monkeys IQ > Victor IQ"
    send_data pdf.render, :filename => "Monkeys.pdf", :type => "application/pdf"

    # @student = Student.find(params[:id])

    # pdf = Prawn::Document.new
    # pdf.text "Hello World"
    # pdf.render_file "assignment.pdf"
    # @resume = Resume.find(params[:id])
  end

end
