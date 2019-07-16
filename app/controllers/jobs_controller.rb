class JobsController < ApplicationController
  def index
    render json: Job.all
  end
  
  def create 
    job = Job.new(job_params)
    job.save
    render_resource(job) 
  end  
     
  private
 
  def job_params
    params.permit(:title,:description,:url,:company,:company_logo)
  end

end
