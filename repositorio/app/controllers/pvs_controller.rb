class PvsController < ApplicationController
  before_action :set_pv, only: [:show, :edit, :update, :destroy]
  before_action :set_proyect

  # GET /pvs
  # GET /pvs.json
  def index
    @pvs = Pv.where(proyect:@proyect).order(created_at: :desc)
  end

  # GET /pvs/1
  # GET /pvs/1.json
  def show
  end

  # GET /pvs/new
  def new
    @pv = Pv.new
  end

  # GET /pvs/1/edit
  def edit
  end

  # POST /pvs
  # POST /pvs.json
  def create
    @pv = Pv.new(pv_params)
    @pv.proyect = @proyect

    respond_to do |format|
      if @pv.save
        format.html { redirect_to proyect_pv_path(@proyect,@pv), notice: 'Propuesta de Valor ha sido creada.' }
        format.json { render :show, status: :created, location: @pv }
      else
        format.html { render :new }
        format.json { render json: @pv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvs/1
  # PATCH/PUT /pvs/1.json
  def update
    @pv = Pv.new(pv_params)
    @pv.proyect = @proyect

    respond_to do |format|
      if @pv.update(pv_params)
        format.html { redirect_to proyect_pv_path(@proyect,@pv), notice: 'Propuesta de Valor ha sido actualizada.' }
        format.json { render :show, status: :ok, location: @pv }
      else
        format.html { render :edit }
        format.json { render json: @pv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvs/1
  # DELETE /pvs/1.json
  def destroy
    @pv.destroy
    respond_to do |format|
      format.html { redirect_to proyect_pvs_path(@proyect), notice: 'Propuesta de Valor ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pv
      @pv = Pv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pv_params
      params.require(:pv).permit(:productos, :generadores, :eliminadores, :tareas, :ganancias, :frustaciones, :proyect_id)
    end
end
