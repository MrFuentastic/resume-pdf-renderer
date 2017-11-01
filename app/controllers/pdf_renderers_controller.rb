class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

HEADERS = {'X-User-Email' => ENV['API_EMAIL'], 'Authorization' => "Token token=#{ENV['API_TOKEN']}", "Accept" => "application/json" }
  
  def dope


    # def index
    #   @educations = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/educations.json", headers: HEADERS).body
    # end

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

  # def dope
  #   response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
  #               headers:{"Accept" => "application/json"},
  #               parameters: {
  #                 first_name: params[:first_name]
  #               }
  #               ).body



  #   pdf = Prawn::Document.new(
  #   pdf.text @response.first_name
  #   send_data pdf.render, :type => "application/pdf", disposition: "inline"
  # end

  # def wacky

  # end

  # def show
    
    # @student = Student.find(params[:id])
    # response_data = {
    #                 "first_name" => "Jesus",
    #                 "last_name" => "Buttmuncher",
    #                 "email" => "jesushbuttmuncher@gmail.com",
    #                 "phone_number" => "(237)892-3484",
    #                 "linkedin" => "linkedin.com/asdfasdfasdf",
    #                 "educations" => [{
    #                                 "start_date" => "",
    #                                 "end_date" => "",
    #                                 "degree" => "",
    #                                 "university" => "",
    #                                 "details" => ""
    #                               },
    #                               {
    #                                 "start_date" => "",
    #                                 "end_date" => "",
    #                                 "degree" => "",
    #                                 "university" => "",
    #                                 "details" => ""
    #                             }]
    #                 "skills" => [
    #                         {"skill_name" => "master baiter"},
    #                         {"skill_name" => "adobe flash"}
    #                         ],
    #                 "experiences" => [{
    #                                   "start_date" => "2017-11-21T01:51:49.347Z",
    #                                   "end_date" => "2018-03-31T01:51:49.347Z",
    #                                   "job_title" => "Apprentice",
    #                                   "company_name" => "Actualize Apprenticeship",
    #                                   "details" => "I got hired!",
    #                                   "student_id" => 1
    #                                 }]
    #                 }

#   def wacky
#     HEADERS = {'X-User-Email' => ENV['API_EMAIL'], 'Authorization' => "Token token=#{ENV['API_KEY']}", "Accept" => "application/json" }
    
#     response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
#                           headers: HEADERS,
#                           ).body

#     name = "#{response[0]["first_name"]} #{response[0]["last_name"]}"
#     email = "#{response[0]["email"]}"
#     phone_number = "#{response[0]['phone_number']}"
#     linkedin = "#{response[0]["linkedin"]}"
#     github = "#{response[0]["github"]}"
#     educations = response[0]["educations"]
#     skills = response[0]["skills"]
#     experiences = response[0]["experiences"]
#     text_color = rand(256)
#     background_color = rand(256)
    

#     pdf = Prawn::Document.new
#     pdf.text name, :color => "D4D4D4"
#     pdf.text email
#     pdf.text phone_number

#     experiences.each do |job|
#       pdf.text job["company_name"]
#       pdf.text job["job_title"]
#       pdf.text job["details"]
#     end

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
