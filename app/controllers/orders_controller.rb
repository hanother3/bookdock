class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay, only: [:index, :create]

  def index
    redirect_to root_path if current_user == @old_book.user || @old_book.order.present?
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :house_number, :phone_number, :building_name, :price).merge(
      old_book_id: @old_book.id, user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @old_book.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_pay
    @old_book = OldBook.find(params[:old_book_id])
  end
end
