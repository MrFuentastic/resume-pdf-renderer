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

    # @student = Student.find(params[:id])

    pdf = Prawn::Document.new
    pdf.text "Hello World"
    pdf.render_file "assignment.pdf"
>>>>>>> 56e95a1453e1d7f1399b58bb9c1a0f2d62cef3b4
  end

end
