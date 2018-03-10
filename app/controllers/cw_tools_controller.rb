class CwToolsController < ApplicationController
  before_action :set_cw_tool, only: [:show, :edit, :update, :destroy]

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
