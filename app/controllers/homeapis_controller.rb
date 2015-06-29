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

 
    @time = params[:time]
 
    @tag = params[:tag] 

    search_posts( @tag,@time)


  end

  def show
    #puts params[:siteid]
    @tag = params[:tag]
    @time= params[:time]

    search_post(params[:siteid], params[:id]) 
  end

 
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeapi_params
      params.require(:homeapi).permit(:id, :tag, :time, :siteid)
    end
end
