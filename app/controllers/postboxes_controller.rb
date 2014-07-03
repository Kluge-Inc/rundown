class PostboxesController < ApplicationController
  before_action :set_postbox, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /postboxes
  # GET /postboxes.json
  def index
    @postboxes = Postbox.all
  end

  # GET /postboxes/1
  # GET /postboxes/1.json
  def show
  end

  # GET /postboxes/new
  def new
    @postbox = Postbox.new
  end

  # GET /postboxes/1/edit
  def edit
  end

  # POST /postboxes
  # POST /postboxes.json
  def create
    @postbox = current_user.postboxes.new(postbox_params)

    respond_to do |format|
      if @postbox.save
        format.html { redirect_to @postbox, notice: 'Postbox was successfully created.' }
        format.json { render :show, status: :created, location: @postbox }
      else
        format.html { render :new }
        format.json { render json: @postbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postboxes/1
  # PATCH/PUT /postboxes/1.json
  def update
    respond_to do |format|
      if @postbox.update(postbox_params)
        format.html { redirect_to @postbox, notice: 'Postbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @postbox }
      else
        format.html { render :edit }
        format.json { render json: @postbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postboxes/1
  # DELETE /postboxes/1.json
  def destroy
    @postbox.destroy
    respond_to do |format|
      format.html { redirect_to postboxes_url, notice: 'Postbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postbox
      @postbox = Postbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postbox_params
      params.require(:postbox).permit(:email, :periodity)
    end
end
