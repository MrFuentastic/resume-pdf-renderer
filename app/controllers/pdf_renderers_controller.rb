class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'
HEADERS = {'X-User-Email' => ENV['api_email'], 'Authorization' => "Token token=#{ENV['api_token']}", "Accept" => "application/json" }

  def dope
    

    @response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json", headers: HEADERS).body

    pdf = Prawn::Document.new

    pdf.font "Helvetica", style: :bold
    pdf.text_rendering_mode(:fill_stroke) do
      pdf.fill_color "00ff00"
      pdf.stroke_color "0000ff"
      pdf.text "#{ @response[0]['first_name'] } #{ @response[0]['last_name'] }", :align => :center, :size => 40
      pdf.text "#{ @response[0]['email'] }", :align => :center, :size => 20
      pdf.text "#{ @response[0]['phone_number'] }", :align => :center, :size => 20
      pdf.text "   "
    end

    pdf.text_rendering_mode(:fill) do
      pdf.fill_color "ff0000"
      pdf.text "Contact Me", :align => :center, :size => 10
      pdf.text "linkedin: #{ @response[0]['linkedin'] }", :align => :center, :size => 8
      pdf.text "twitter: #{ @response[0]['twitter'] }", :align => :center, :size => 8
      pdf.text "   "
      pdf.text "personal blog: #{ @response[0]['personal_blog'] }", :align => :center, :size => 8
      pdf.text "github: #{ @response[0]['github'] }", :align => :center, :size => 8
      pdf.text "   "

      experiences = @response[0]['experiences']
      educations = @response[0]['educations']
      skills = @response[0]['skills']

      pdf.text "Education", :align => :center, :size => 10
          experiences.each do |job|
            pdf.text job["company_name"], :align => :center, :size => 8
            pdf.text job["job_title"], :align => :center, :size => 8
            pdf.text job["details"], :align => :center, :size => 8
          end
          pdf.text "School", :align => :center, :size => 10
          educations.each do |school|
            pdf.text school["university"], :align => :center, :size => 8
            pdf.text school["degree"], :align => :center, :size => 8
            pdf.text school["details"], :align => :center, :size => 8
          end
          pdf.text "Skills", :align => :center, :size => 10
          skills.each do |skill|
            pdf.text skill["skill_name"], :align => :center, :size => 8r
          end
    end

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

#     educations.each do |school|
#       pdf.text school["university"]
#       pdf.text school["degree"]
#       pdf.text school["details"]
#     end

#     skills.each do |skill|
#       pdf.text skill["skill_name"]
#     end
    
#     send_data pdf.render, :type => "application/pdf", disposition: "inline"
#   end

#   def prof

#     # pdf = Prawn::Document.new
#     # pdf.text "#{response.}"
#     # pdf.render_file "assignment.pdf"
#   end
end
