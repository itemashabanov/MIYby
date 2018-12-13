class TeachingMaterialsController < ApplicationController
  skip_before_action :authorize, only: [:show, :index, :tsearch, :ttsearch]
  before_action :set_teaching_material, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_material

  # GET /teaching_materials
  # GET /teaching_materials.json
  def index
    @teaching_materials = TeachingMaterial.all
  end

  # link from disciplines
  def tsearch
    @t = params[:discipline_id]
    if TeachingMaterial.where(discipline_id: @t).count > 0
      @teaching_materials = TeachingMaterial.where(discipline_id: @t)
    end
  end

  # search by name of teaching material
  def ttsearch
    @tt = params[:name]
    if TeachingMaterial.where(name: @tt).count > 0
      @teaching_materials = TeachingMaterial.where(name: @tt)
    else
      redirect_to teaching_materials_path, notice: 'Методический материал не найден.'
    end
  end

  # GET /teaching_materials/1
  # GET /teaching_materials/1.json
  def show
  end

  # GET /teaching_materials/new
  def new
    @teaching_material = TeachingMaterial.new
  end

  # GET /teaching_materials/1/edit
  def edit
  end

  # POST /teaching_materials
  # POST /teaching_materials.json
  def create
    @teaching_material = TeachingMaterial.new(teaching_material_params)

    respond_to do |format|
      if @teaching_material.save
        format.html { redirect_to @teaching_material, notice: 'Методический материал: ' + @teaching_material.name + ' был успешно создан.' }
        format.json { render :show, status: :created, location: @teaching_material }
      else
        format.html { render :new }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teaching_materials/1
  # PATCH/PUT /teaching_materials/1.json
  def update
    respond_to do |format|
      if @teaching_material.update(teaching_material_params)
        format.html { redirect_to @teaching_material, notice: 'Методический материал: ' + @teaching_material.name + ' был успешно изменен.' }
        format.json { render :show, status: :ok, location: @teaching_material }
      else
        format.html { render :edit }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_materials/1
  # DELETE /teaching_materials/1.json
  def destroy
    @teaching_material.destroy
    respond_to do |format|
      format.html { redirect_to teaching_materials_url, notice: 'Методический материал: ' + @teaching_material.name + ' был успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    def invalid_material
      logger.error "Attempt to access invalid material #{params[:id]}"
      redirect_to client_index_url, notice: 'Неверный методический материал!'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_teaching_material
      @teaching_material = TeachingMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teaching_material_params
      params.require(:teaching_material).permit(:name, :url, :discipline_id, :group_id)
    end
end
