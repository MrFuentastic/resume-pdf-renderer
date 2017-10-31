class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

  def dope
    response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                headers:{"Accept" => "application/json"},
                parameters: {
                  first_name: params[:first_name]
                }
                ).body



    pdf = Prawn::Document.new(
    pdf.text @response.first_name
    send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end

  def wacky

  end

  def prof

  end

end
