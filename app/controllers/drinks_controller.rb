class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    drink
  end

  def new
    @drink = Drink.new
    @features = Feature.all
  end

  def edit
    drink
    @features = Feature.all
  end

  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        @features = Feature.all
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        @features = Feature.all
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def drink
      @drink ||= Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name, :feature_ids)
    end
end
