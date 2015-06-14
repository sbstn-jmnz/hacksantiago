class HomeapisController < ApplicationController
  #before_action :set_homeapi, only: [:show, :edit, :update, :destroy]
  include ApiConection
  # GET /homeapis
  # GET /homeapis.json
  def index
    @homeapi = Homeapi.new
  end

  # GET /homeapis/1
  # GET /homeapis/1.json
  def search
    search_posts( params[:homeapi][:tag],params[:time] )
  end
 
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeapi_params
      params.require(:homeapi).permit(:tag, :time)
    end
end
