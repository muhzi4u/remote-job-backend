class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    def render_resource(resource)
        if resource.errors.empty?
          render json: resource
        else
          validation_error(resource)
        end
    end
end
