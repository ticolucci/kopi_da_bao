class FeaturesController < ApplicationController

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def edit
    feature
  end

  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        format.html { redirect_to features_path, notice: 'Feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if feature.update(feature_params)
        format.html { redirect_to features_path, notice: 'Feature was successfully updated.' }
        format.json { render :show, status: :ok, location: feature }
      else
        format.html { render :edit }
        format.json { render json: feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    feature.destroy
    respond_to do |format|
      format.html { redirect_to features_path, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def feature
      @feature ||= Feature.find(params[:id])
    end

    def feature_params
      params.require(:feature).permit(:name)
    end
end
