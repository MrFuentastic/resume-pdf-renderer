class PdfRenderersController < ApplicationController
require "prawn"

  def show
<<<<<<< HEAD
    pdf = Prawn::Document.new
    pdf.text "Monkeys IQ > Victor IQ"
    send_data pdf.render, :filename => "Monkeys.pdf", :type => "application/pdf"
=======
    @student = Student.find(params[:id])

    pdf = Prawn::Document.new
    pdf.text "Hello World"
    pdf.render_file "assignment.pdf"
    @resume = Resume.find(params[:id])
>>>>>>> 457deb7c17bb08ea866764ce3692d1ab4327846a
  end

end
