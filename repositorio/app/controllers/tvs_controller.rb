class TvsController < ApplicationController
  before_action :set_tv, only: [:show, :edit, :update, :destroy]
  before_action :set_proyect

  # GET /tvs
  # GET /tvs.json
  def index
    @tvs = Tv.where(proyect:@proyect).order(created_at: :desc)
  end

  # GET /tvs/1
  # GET /tvs/1.json
  def show
  end

  # GET /tvs/new
  def new
    @tv = Tv.new
  end

  # GET /tvs/1/edit
  def edit
  end

  # POST /tvs
  # POST /tvs.json
  def create
    @tv = Tv.new(tv_params)
    @tv.proyect = @proyect

    respond_to do |format|
      if @tv.save
        format.html { redirect_to proyect_tv_path(@proyect,@tv), notice: 'Tabla de Valor ha sido creada.' }
        format.json { render :show, status: :created, location: @tv }
      else
        format.html { render :new }
        format.json { render json: @tv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvs/1
  # PATCH/PUT /tvs/1.json
  def update
    @tv = Tv.new(tv_params)
    @tv.proyect = @proyect

    respond_to do |format|
      if @tv.update(tv_params)
        format.html { redirect_to proyect_tv_path(@proyect,@tv), notice: 'Tabla de Valor ha sido actualizada.' }
        format.json { render :show, status: :ok, location: @tv }
      else
        format.html { render :edit }
        format.json { render json: @tv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvs/1
  # DELETE /tvs/1.json
  def destroy
    @tv.destroy
    respond_to do |format|
      format.html { redirect_to proyect_tvs_path(@proyect), notice: 'Tabla de Valor ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tv
      @tv = Tv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tv_params
      params.require(:tv).permit(:hipcli, :hipprob, :hipsol, :invalidamos, :validamos, :proyect_id)
    end
end
