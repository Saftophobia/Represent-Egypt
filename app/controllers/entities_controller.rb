class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create
    if current_user.entity
      raise "You can't add more companies"
    else

      @entity = Entity.new(entity_params)
      @entity.user_id = current_user.id
      @entity.admin_verification = false

      respond_to do |format|
        if @entity.save
          format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
          format.json { render :show, status: :created, location: @entity }
        else
          format.html { render :new }
          format.json { render json: @entity.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)

        unless current_user.try(:admin)
          @entity.user_id = current_user.id
          @entity.admin_verification = false
          @entity.save
        end

        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      if current_user.try(:admin)
        params.require(:entity).permit(:name, :type, :lat, :lon, :description, :url, :address, :year_estab, :user_id, :admin_verification)
      else
        params.require(:entity).permit(:name, :type, :lat, :lon, :description, :url, :address, :year_estab)
      end
    end
end
