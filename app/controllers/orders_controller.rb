class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    order
  end

  def new
    @order = Order.new
    @order.order_items.build
    @drinks = Drink.all
  end

  def edit
    order
    @drinks = Drink.all
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        @drinks = Drink.all
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        @drinks = Drink.all
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def order
      @order ||= Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(order_items_attributes: [:drink_id, feature_ids: []])
    end
end
