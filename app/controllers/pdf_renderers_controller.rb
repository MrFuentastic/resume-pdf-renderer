class PdfRenderersController < ApplicationController

  def show
    pdf = Prawn::Document.new
    pdf.text "Monkeys IQ > Victor IQ"
    send_data pdf.render, :filename => "Monkeys.pdf", :type => "application/pdf"
  end

end
