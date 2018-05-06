class QuotesController < ApplicationController
  def index
    @quotes = {"quotation": "The secret of getting ahead is getting started."}
    json_response(@quotes)
  end

  private
  def json_response(object)
    p 'got here'
    render json: object, status: :ok
  end
end
