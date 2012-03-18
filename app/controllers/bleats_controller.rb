class BleatsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  # GET /bleats
  # GET /bleats.json
  def index
    @bleats = Bleat.desc(:created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bleats }
    end
  end

  # GET /bleats/1
  # GET /bleats/1.json
  def show
    @bleat = Bleat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bleat }
    end
  end

  # GET /bleats/new
  # GET /bleats/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bleat }
    end
  end


  # POST /bleats
  # POST /bleats.json
  def create
    @bleat = current_user.bleats.new(params[:bleat].merge(:author => current_user.name))

    respond_to do |format|
      if @bleat.save
        format.html { redirect_to bleats_url , notice: 'Bleat was successfully created.' }
        format.json { render json: @bleat, status: :created, location: @bleat }
      else
        format.html { render action: "new" }
        format.json { render json: @bleat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bleats/1
  # DELETE /bleats/1.json
  def destroy
    @bleat = current_user.bleats.find(params[:id])
    @bleat.destroy

    respond_to do |format|
      format.html { redirect_to bleats_url }
      format.json { head :no_content }
    end
  end
end
