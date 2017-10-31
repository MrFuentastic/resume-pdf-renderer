class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

<<<<<<< HEAD
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
=======
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
    
    @response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                headers:{"Accept" => "application/json"},
                ).body
    # pdf = Prawn::Document.new
    # pdf.text "Monkeys IQ > Victor IQ"
    # send_data pdf.render, :type => "application/pdf", disposition: "inline"
    
    # @student = Student.find(params[:id])
    
    # pdf = Prawn::Document.new
    # pdf.text "Hello World"
    # pdf.render_file "assignment.pdf"
    # @resume = Resume.find(params[:id])
>>>>>>> 06fbf4409b9c2ef31b243e66b91f1a71ea901ab8

  def prof

<<<<<<< HEAD
=======
    # pdf = Prawn::Document.new
    # pdf.text "#{response.}"
    # pdf.render_file "assignment.pdf"
>>>>>>> 06fbf4409b9c2ef31b243e66b91f1a71ea901ab8
  end

end
