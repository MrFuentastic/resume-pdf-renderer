class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

  def dope
    @response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                headers:{"Accept" => "application/json"},
                ).body

    pdf = Prawn::Document.new

    pdf.font "Helvetica", style: :bold
    pdf.text_rendering_mode(:fill_stroke) do
      pdf.fill_color "00ff00"
      pdf.stroke_color "0000ff"
      pdf.text "#{ @response[0]['first_name'] } #{ @response[0]['last_name'] }", :align => :center, :size => 40
      pdf.text "#{ @response[0]['email'] }", :align => :center, :size => 20
      pdf.text "#{ @response[0]['phone_number'] }", :align => :center, :size => 20
    end

    pdf.text_rendering_mode(:fill) do
      pdf.fill_color "ff0000"
      pdf.text "linkedin: #{ @response[0]['linkedin'] }", :align => :center, :size => 8
      pdf.text "twitter: #{ @response[0]['twitter'] }", :align => :center, :size => 8
      pdf.text "personal blog: #{ @response[0]['personal_blog'] }", :align => :center, :size => 8
      pdf.text "github: #{ @response[0]['github'] }", :align => :center, :size => 8
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

  def wacky

  end

  def show
    
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

  end
end
