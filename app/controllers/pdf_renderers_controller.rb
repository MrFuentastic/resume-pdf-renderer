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



    pdf = Prawn::Document.new
    pdf.text @response.first_name
    send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end


  def wacky
    HEADERS = {'X-User-Email' => ENV['API_EMAIL'], 'Authorization' => "Token token=#{ENV['API_KEY']}", "Accept" => "application/json" }
    
    response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                          headers: HEADERS,
                          ).body

    name = "#{response[0]["first_name"]} #{response[0]["last_name"]}"
    email = "#{response[0]["email"]}"
    phone_number = "#{response[0]['phone_number']}"
    linkedin = "#{response[0]["linkedin"]}"
    github = "#{response[0]["github"]}"
    educations = response[0]["educations"]
    skills = response[0]["skills"]
    experiences = response[0]["experiences"]
    text_color = rand(256)
    background_color = rand(256)
    

    pdf = Prawn::Document.new
    pdf.text name, :color => "D4D4D4"
    pdf.text email
    pdf.text phone_number

    experiences.each do |job|
      pdf.text job["company_name"]
      pdf.text job["job_title"]
      pdf.text job["details"]
    end

    educations.each do |school|
      pdf.text school["university"]
      pdf.text school["degree"]
      pdf.text school["details"]
    end

    skills.each do |skill|
      pdf.text skill["skill_name"]
    end
    
    send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end

  def prof

    # pdf = Prawn::Document.new
    # pdf.text "#{response.}"
    # pdf.render_file "assignment.pdf"
  end

end
