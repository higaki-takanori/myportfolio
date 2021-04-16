class PlaysController < ApplicationController
  before_action :set_play, only: %i[ show edit update destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :index, :destroy]

  # GET /plays or /plays.json
  def index
    #@plays = Play.all
    @plays = Play.paginate(page: params[:page])
  end

  # GET /plays/1 or /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new
  end

  # GET /plays/1/edit
  def edit
  end

  # POST /plays or /plays.json
  def create
    @play = Play.new(play_params)
    @tool = Tool.new(tool_params[:tool])
    respond_to do |format|
      if @play.save
        @tool.play_id = @play.id
        @tool.save
        rule_params.each do |tmp, rule_hash|
          @rule = Rule.new(rule_content: rule_hash["content"], rule_image_path: rule_hash["image"])
          @rule.play_id = @play.id
          @rule.save
        end
        format.html { redirect_to @play, notice: "Play was successfully created." }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plays/1 or /plays/1.json
  def update
    @tool = Tool.find_by(play_id: params[:id])
    @rule = Rule.where(play_id: params[:id])
    respond_to do |format|
      if @play.update(play_params)
        # toolについて
        if @tool != nil
          @tool.update(tool_params[:tool]) 
        else
          @tool = Tool.new(tool_params[:tool])
          @tool.play_id = @play.id
          @tool.save
        end
        # ruleについて
        if @rule.length != rule_params.length
          @rule.each do |rule|
            rule.destroy
          end
          rule_params.each do |tmp, content_hash|
            @rule = Rule.new(rule_content: content_hash["content"], rule_image_path: content_hash["image"])
            @rule.play_id = @play.id
            @rule.save
          end
        else
          @rule.zip(rule_params).each do |rule, rule_hash|
            if rule_hash[1]["image"].present?
              rule.update(rule_content: rule_hash[1]["content"], rule_image_path: rule_hash[1]["image"])
            else
              rule.update(rule_content: rule_hash[1]["content"])
            end
          end          
        end
        format.html { redirect_to @play, notice: "Play was successfully updated." }
        format.json { render :show, status: :ok, location: @play }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1 or /plays/1.json
  def destroy
    @play.destroy
    respond_to do |format|
      format.html { redirect_to plays_url, notice: "Play was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @plays = Play.where(title: params[:title]).paginate(page: params[:page])
    .or(Play.where(place: params[:place]).paginate(page: params[:page]))
    .or(Play.where(min_player: params[:min_player]).paginate(page: params[:page]))
    .or(Play.where(max_player: params[:max_player]).paginate(page: params[:page]))
    if params[:title].eql?("") && params[:place].eql?("") && params[:min_player].eql?("") && params[:max_player].eql?("")
      @plays = Play.paginate(page: params[:page])
    end
    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok, location: @play}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play
      @play = Play.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_params
      params.require(:play).permit(:title, :place, :outline, :winnig_content, :min_player, :max_player, :user_id, :play_image_path, :deleted_at)
    end

    # Only allow a list of trusted parameters through.
    def tool_params
      params.require(:play).permit(tool:[:tool_content])
    end

    def rule_params
      params.require(:rule).permit!.to_hash
    end
end
