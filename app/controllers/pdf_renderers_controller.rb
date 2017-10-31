class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

<<<<<<< HEAD
=======
  def show
    # response = Unirest.patch("#{ ENV['HOST_NAME']}.json",
    #             headers:{"Accept" => "application/json"},
    #             parameters: {}
    #             ).body

    # @student = Student.find(params[:id])
    pdf = Prawn::Document.new
    pdf.text "Monkeys IQ > Victor IQ"
    send_data pdf.render, :type => "application/pdf", disposition: "inline"

    # @student = Student.find(params[:id])

    # pdf = Prawn::Document.new
    # pdf.text "Hello World"
    # pdf.render_file "assignment.pdf"
    # @resume = Resume.find(params[:id])

    # @student = Student.find(params[:id])

    pdf = Prawn::Document.new
    pdf.text "Hello World"
    pdf.render_file "assignment.pdf"
  end

>>>>>>> 69a89133fc748c9419c13b8a39c4b0513e4ddfdd
end
