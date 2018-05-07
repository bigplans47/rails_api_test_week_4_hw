class ApplicationController < ActionController::API
  # used to access the module in the application
  include Response
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found )
    # json_response({ message: exception.message }, :unprocessable_entity )
  end



end
