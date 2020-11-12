class ChannelsController < ApplicationController
  before_action :current_channel, only: [:show, :edit, :update, :destroy]
  before_action :message, only: [:show, :edit, :update]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
  end

  # GET /channels/new
  def new
    @current_channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    @current_channel = Channel.new(channel_params)

    respond_to do |format|
      if @current_channel.save
        format.html { redirect_to @current_channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @current_channel }
      else
        format.html { render :new }
        format.json { render json: @current_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @current_channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_channel }
      else
        format.html { render :edit }
        format.json { render json: @current_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def current_channel
      @current_channel ||= Channel.find(params[:id])
    end

    def message
      @message ||= Message.new(channel: current_channel, user: User.first)
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:name)
    end
end
