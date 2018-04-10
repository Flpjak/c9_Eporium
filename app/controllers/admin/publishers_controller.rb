class Admin::PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = Publisher.all
  end

  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @publisher = Publisher.find(params[:id])
    @page_title = @publisher.name
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publisher }
    end
  end


  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers
  # POST /publishers.json
  def create
   @publisher = Publisher.new(params[:publisher])
    respond_to do |format|
      if @publisher.save
        format.html { redirect_to([:admin, @publisher],
        :notice => 'Publisher was successfully created.') }
        format.json { render json: @publisher, status: :created,
        location: @publisher }
      else
        format.html { render :action => "new" }
        format.json { render json: @publisher.errors,
        status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1
  # PATCH/PUT /publishers/1.json
  def update
    @publisher = Publisher.find(params[:id])
    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])
        format.html { redirect_to([:admin, @publisher],
        :notice => 'Publisher was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render json: @publisher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_publishers_url) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
