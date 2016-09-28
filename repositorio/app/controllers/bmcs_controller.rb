class BmcsController < ApplicationController
  before_action :set_bmc, only: [:show, :edit, :update, :destroy]
  before_action :set_proyect

  # GET /bmcs
  # GET /bmcs.json
  def index
    @bmcs = Bmc.where(proyect:@proyect).order(created_at: :desc)
  end

  # GET /bmcs/1
  # GET /bmcs/1.json
  def show
  end

  # GET /bmcs/new
  def new
    @bmc = Bmc.new
  end

  # GET /bmcs/1/edit
  def edit
  end

  # POST /bmcs
  # POST /bmcs.json
  def create
    @bmc = Bmc.new(bmc_params)
    @bmc.proyect = @proyect

    respond_to do |format|
      if @bmc.save
        format.html { redirect_to proyect_bmc_path(@proyect,@bmc), notice: 'Bmc ha sido creado.' }
        format.json { render :show, status: :created, location: @bmc }
      else
        format.html { render :new }
        format.json { render json: @bmc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bmcs/1
  # PATCH/PUT /bmcs/1.json
  def update
    @bmc = Bmc.new(bmc_params)
    @bmc.proyect = @proyect

    respond_to do |format|
      if @bmc.update(bmc_params)
        format.html { redirect_to proyect_bmc_path(@proyect,@bmc), notice: 'Bmc ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @bmc }
      else
        format.html { render :edit }
        format.json { render json: @bmc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bmcs/1
  # DELETE /bmcs/1.json
  def destroy
    @bmc.destroy
    respond_to do |format|
      format.html { redirect_to proyect_bmcs_path(@proyect), notice: 'Bmc ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_bmc
      @bmc = Bmc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bmc_params
      params.require(:bmc).permit(:problema, :propuesta, :cliente, :proyect_id)
    end
end
