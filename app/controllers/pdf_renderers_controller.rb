class PdfRenderersController < ApplicationController
require "prawn"
require 'unirest'

  def dope
    # pdf = Prawn::Document.new(
    # pdf.text "test"
    # send_data pdf.render, :type => "application/pdf", disposition: "inline"
  end

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
    
    @response = Unirest.get("https://crypto-currents-squidshack.herokuapp.com/api/v1/students.json",
                headers:{"Accept" => "application/json"},
                ).body



    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ResumePdf.new(@response,view_context)
    #     send_data pdf.render, filename:
    #     "#{full_name}_Resume.pdf",
    #     type: "application/pdf",
    #     disposition: "inline"
    #   end
    # end


  end


  def prof

  end

end
