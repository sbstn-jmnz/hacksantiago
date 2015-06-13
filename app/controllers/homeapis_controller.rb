class HomeapisController < ApplicationController
  before_action :set_homeapi, only: [:show, :edit, :update, :destroy]

  # GET /homeapis
  # GET /homeapis.json
  def index
    @homeapis = HTTParty.get('http://api.recursos.datos.gob.cl/datastreams/invoke/OPERA-DEL-EN-MILLO-DE?auth_key=64228b2103ee57fe4bfa79d8bcd22d6d36260939')
  end

  # GET /homeapis/1
  # GET /homeapis/1.json
  def show
  end

  # GET /homeapis/new
  def new
    @homeapi = Homeapi.new
  end

  # GET /homeapis/1/edit
  def edit
  end

  # POST /homeapis
  # POST /homeapis.json
  def create
    @homeapi = Homeapi.new(homeapi_params)

    respond_to do |format|
      if @homeapi.save
        format.html { redirect_to @homeapi, notice: 'Homeapi was successfully created.' }
        format.json { render :show, status: :created, location: @homeapi }
      else
        format.html { render :new }
        format.json { render json: @homeapi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeapis/1
  # PATCH/PUT /homeapis/1.json
  def update
    respond_to do |format|
      if @homeapi.update(homeapi_params)
        format.html { redirect_to @homeapi, notice: 'Homeapi was successfully updated.' }
        format.json { render :show, status: :ok, location: @homeapi }
      else
        format.html { render :edit }
        format.json { render json: @homeapi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeapis/1
  # DELETE /homeapis/1.json
  def destroy
    @homeapi.destroy
    respond_to do |format|
      format.html { redirect_to homeapis_url, notice: 'Homeapi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homeapi
      @homeapi = Homeapi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeapi_params
      params[:homeapi]
    end
end
