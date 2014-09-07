class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @entities = Entity.all
  end

  def show
  end

  def new
    @entity = Entity.new
  end

  def edit
    # Populate the selected types for amends
    #@entity_types = ['Startup', 'Investor', 'Accelerator', 'Co-worker', 'R&D Center', 'Service']
  
    @selected_types = Entity.find(params[:id]).type.squish.split(/ - /)
  end

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

  def update
    respond_to do |format|

      if @entity.update(entity_params)
          p "********************************************** "+@entity.type.to_s
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
        params.require(:entity).permit(:name, {:type => []}, :lat, :lon, :description, :url, :address, :year_estab)
      end
    end
end



# [\"\"]" 
# [\"\", \"Startup\"]"
# [\"\", \"Startup\", \"Accelerator\", \"Co-worker\", \"R&D Center\"]"
