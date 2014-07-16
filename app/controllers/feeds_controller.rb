class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy, :fetch, :subscribe, :unsubscribe]
  before_action :set_postbox, only: [:subscribe, :unsubscribe]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ##
  # Update feed with new entries
  #
  def fetch

  end

  ##
  # Update all personal feeds
  #
  def fetch_all
    
  end

  ##
  # Subscribe to the feed with one of the postboxes
  #
  # == Routes:
  #  PUT /feeds/:id/subscribe
  #
  def subscribe
    respond_to do |format|
      if @postbox.feeds.include?(@feed)
        format.html { redirect_to feeds_url, notice: "Selected postbox is already subscribed to the feed." }
      else
        @postbox.feeds << @feed
        format.html { redirect_to feeds_url, notice: "Successfully subscribed to feed with #{@postbox.email}." }
      end
    end
  end

  ##
  # Unsubscribe selected postbox from the feed 
  #
  # == Routes:
  #  PUT /feeds/:id/unsubscribe
  #
  def unsubscribe
    respond_to do |format|
      if @postbox.feeds.delete(@feed)
        format.html { redirect_to @postbox, notice: "Successfully unsubscribed from the feed." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:url)
    end

    def set_postbox
      @postbox = Postbox.find(params[:postbox_id])
    end
end
