class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def resource_not_found
    render json: {
      errors: [
        {
          status: '404',
          title: "Resource not found",
          code: '101'
        }
      ]
    }, status: 404
  end
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end
end
