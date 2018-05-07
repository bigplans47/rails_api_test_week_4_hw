class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
    json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: { message: "Your quote has been updated succesfully."}
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    # @quote.destroy
    if @quote.destroy
      render status: 200, json: {message: 'Your quote has been destroyed'}
    end
  end

  private
  # code below moved to module contollers/quotes_controller.rb
  # def json_response(object, status = :ok)
  #   p 'got here json_response'
  #   render json: object, status: status
  # end

  def quote_params
    params.permit(:author, :content)
  end
end
