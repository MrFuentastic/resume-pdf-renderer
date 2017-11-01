class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'
HEADERS = {'X-User-Email' => ENV['api_email'], 'Authorization' => "Token token=#{ENV['api_token']}", "Accept" => "application/json" }

  def dope
    response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                headers:{"Accept" => "application/json"},
                parameters: {
                  first_name: params[:first_name]
                }
                ).body



    pdf = Prawn::Document.new
    pdf.text @response.first_name
    send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end


  def wacky

    
    response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                          headers: HEADERS
                          ).body
    name = "#{response[0]["first_name"]} #{response[0]["last_name"]}"
    email = "#{response[0]["email"]}"
    phone_number = "#{response[0]['phone_number']}"
    linkedin = "#{response[0]["linkedin"]}"
    github = "#{response[0]["github"]}"
    educations = response[0]["educations"]
    skills = response[0]["skills"]
    experiences = response[0]["experiences"]
    text_color = [rand(100), rand(100), rand(100), rand(100)]
    background_color = [rand(100), rand(100), rand(100), rand(100)]
    

    pdf = Prawn::Document.new

      pdf.text name, :color => text_color
      pdf.text linkedin, 
      pdf.text email, :color => text_color
      pdf.text phone_number, :color => text_color

      experiences.each do |job|
        pdf.text job["company_name"], :color => text_color
        pdf.text job["job_title"], :color => text_color
        pdf.text job["details"], :color => text_color
      end

      educations.each do |school|
        pdf.text school["university"], :color => text_color
        pdf.text school["degree"], :color => text_color
        pdf.text school["details"], :color => text_color
      end

      skills.each do |skill|
        pdf.text skill["skill_name"], :color => text_color
      end
    
    send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end

  def prof

    # pdf = Prawn::Document.new
    # pdf.text "#{response.}"
    # pdf.render_file "assignment.pdf"
  end

end
