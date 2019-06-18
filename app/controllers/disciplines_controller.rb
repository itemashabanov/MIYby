class DisciplinesController < ApplicationController
  skip_before_action :authorize, only: [:show, :index, :dsearch, :ddsearch, :dddsearch, :find_semester]
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_discipline

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # link from client.html by group name
  #def dsearch
  #  @d = params[:group_id]
   # if Discipline.where(group_id: @d).count > 0
    #  @disciplines = Discipline.where(group_id: @d)
    #else
     # redirect_to client_index_path, notice: 'Дисциплины группы ' + @d + ' не найдены.'
    #end
  #end

  # link from groups.html by group name
  def dddsearch
    @g = params[:group_id]
    @ddd = params[:specialty_id]
    if Discipline.where(specialty_id: @ddd).count > 0
      @disciplines = Discipline.where(specialty_id: @ddd)
    end
  end

  # search in disciplines by discipline name
  def ddsearch
    @dd = params[:discipline]
    if Discipline.where(discipline: @dd).count > 0
      @disciplines = Discipline.where(discipline: @dd)
    else
      redirect_to disciplines_path, notice: 'Дисциплина: ' + @dd + ' не найдена.'
    end
  end

  def find_semester
    @semester = params[:semester]
    @gr = params[:group_id]
    @disciplines = Discipline.where(semester: @semester, group_id: @gr)
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Дисциплина: ' + @discipline.discipline + ' успешно создана.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Дисциплина: ' + @discipline.discipline + ' успешно обновлена.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Дисциплина: ' + @discipline.discipline + ' успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    def invalid_discipline
      logger.error "Attempt to access invalid discipline #{params[:id]}"
      redirect_to client_index_url, notice: 'Неверная дисциплина.'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:discipline, :teacher, :course, :specialty_id)
    end
end
