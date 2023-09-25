class ToolsController < ApplicationController
  before_action :set_tool, only: %i[ show edit update destroy set_beaten_tool ]


  # GET /tools or /tools.json
  def index
    @tools = Tool.all
  end

  # GET /tools/1 or /tools/1.json
  def show
  end

  # GET /tools/new
  def new
    @tool = Tool.new
  end

  # GET /tools/1/edit
  def edit
    @other_tools = Tool.all.includes(:tools_that_this_can_beat).excluding(@tool)
  end

  # PUT /tools/1/set_beaten_tool

  def set_beaten_tool
    selected_tool = Tool.find(params['selected_tool_id'])
    if params['selected']
      @tool.tools_that_this_can_beat.push(selected_tool)
    else
      @tool.tools_that_this_can_beat.delete(selected_tool)
    end

    render plain: 'ok',   status: :ok
  end

  # POST /tools or /tools.json
  def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to tools_url, notice: "Tool was successfully created." }
        format.json { render :index, status: :created, location: @tool }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tools/1 or /tools/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to tools_url, notice: "Tool was successfully updated." }
        format.json { render :index, status: :ok, location: @tool }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1 or /tools/1.json
  def destroy
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to tools_url, notice: "Tool was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tool
    @tool = Tool.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tool_params
    params.require(:tool).permit(:name, :image)
  end
end
