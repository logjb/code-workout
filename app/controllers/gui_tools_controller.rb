class GuiToolsController < ApplicationController
  before_action :set_gui_tool, only: [:show, :edit, :update, :destroy]
  # GET gui_tools/exercises
  def exercises
    #render layout: 'one_column'
	p "it works"
    @exs = Exercise.publicly_visible.shuffle
	render :json => @exs
#    respond_to do |format|
#	format.html
#	format.js
#	end
  end

  # GET gui_tools/exercise_content
  #def exercise_content
    #render layout: 'one_column'
#	p "exercise content it works"
 #   @exercise = Exercise.find params[:id]
 #   render :json => @exercise
#    respond_to do |format|
#	format.html
#	format.js
#	end
#  end
	
  # POST /gui_tools/exercise_content
  def exercise_content
	p params[:id]
	p "all parameters"
	p params
	@exercise = Exercise.find params[:id]
  	@exercise_version = @exercise.current_version
	@text_representation = @exercise_version.text_representation || ExerciseRepresenter.new(@exercise).to_hash.to_yaml
  render :json => @text_representation
  end
	
  def index
    @gui_tools = GuiTool.all
  end

  # GET /gui_tools/1
  def show
  end

  # GET /gui_tools/new
  def new
    @gui_tool = GuiTool.new
  end

  # GET /gui_tools/1/edit
  def edit
  end

  # POST /gui_tools
  def create
    @gui_tool = GuiTool.new(gui_tool_params)

    if @gui_tool.save
      redirect_to @gui_tool, notice: 'Gui tool was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gui_tools/1
  def update
    if @gui_tool.update(gui_tool_params)
      redirect_to @gui_tool, notice: 'Gui tool was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gui_tools/1
  def destroy
    @gui_tool.destroy
    redirect_to gui_tools_url, notice: 'Gui tool was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gui_tool
      @gui_tool = GuiTool.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gui_tool_params
      params[:gui_tool]
    end
end
