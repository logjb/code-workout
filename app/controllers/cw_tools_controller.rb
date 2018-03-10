class CwToolsController < ApplicationController
  before_action :set_cw_tool, only: [:show, :edit, :update, :destroy]

	
  # GET cw_tools/upload_exercise
  def upload_exercise
    hash = YAML.load(File.read(params[:file]))
    
    if !hash.kind_of?(Array)
      hash = [hash]
    end
    
    exercises = ExerciseRepresenter.for_collection.new([]).from_hash(hash)
    exercises.each do |e|
      if !e.save
	puts "cannot save exercise"
        errors = []
        errors <<  "Cannot save exercise:<ul>" 
        e.errors.full_messages.each do |msg|
          errors << "<li>#{msg}</li>"
        end
        
        if e.current_version
	puts "current version works"
          e.current_version.errors.full_messages.each do |msg|
            errors << "<li>#{msg}</li>"
          end
          if e.current_version.prompts.any?
		puts "current version prompts any"
            e.current_version.prompts.first.errors.full_messages.each do |msg|
              errors << "<li>#{msg}</li>"
            end
          end
        end
        errors << "</ul>"
        redirect_to exercises_url, flash: { error: errors.join("").html_safe } and return
      end
    end
    #render layout: 'one_column'
	p "it works"
    @exs = Exercise.publicly_visible.shuffle
	render :json => @exs
#    respond_to do |format|
#	format.html
#	format.js
#	end
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
