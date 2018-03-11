class CwToolsController < ApplicationController
  #require 'ims/lti'
  #require 'oauth/request_proxy/rack_request'
  before_action :set_cw_tool, only: [:show, :edit, :update, :destroy]

	
  # post cw_tools/upload_exercise
  def upload_exercise
 	p "ey oh"
  end

	
	
  # GET cw_tools/exercises
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

   # GET /cw_tools/exercise_content
  def exercise_content
	p params[:id]
	p "all parameters"
	p params
	@exercise = Exercise.find params[:id]
  	@exercise_version = @exercise.current_version
	@text_representation = @exercise_version.text_representation || ExerciseRepresenter.new(@exercise).to_hash.to_json
  render :json => @text_representation
  end

  # GET /cw_tools
  def index
    @cw_tools = CwTool.all
  end

  # GET /cw_tools/1
  def show
  end

  # GET /cw_tools/new
  def new
    @cw_tool = CwTool.new
  end

  # GET /cw_tools/1/edit
  def edit
  end

  # POST /cw_tools
  def create
    @cw_tool = CwTool.new(cw_tool_params)

    if @cw_tool.save
      redirect_to @cw_tool, notice: 'Cw tool was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cw_tools/1
  def update
    if @cw_tool.update(cw_tool_params)
      redirect_to @cw_tool, notice: 'Cw tool was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cw_tools/1
  def destroy
    @cw_tool.destroy
    redirect_to cw_tools_url, notice: 'Cw tool was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cw_tool
      @cw_tool = CwTool.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cw_tool_params
      params[:cw_tool]
    end
end
