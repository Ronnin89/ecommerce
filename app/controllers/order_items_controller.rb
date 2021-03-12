class OrderItemsController <ApplicationController
    before_action :authenticate_user!

    def index
        @order = Order.find_by(user_id: current_user.id, state: false)
    end
    
    def create
        @order = Order.find_or_create_by(user_id: current_user.id, state: false)
        @product = Product.find(params[:product_id])
        @order_item = OrderItem.find_or_create_by(order_id: @order.id, product_id: @product.id)

        if @order_item.quantity.nil?
            @order_item.update(quantity: 1) 
        else
            @order_item.update(quantity: @order_item.quantity + 1)
        end
        @order_item.update(price: @order_item.product.price * @order_item.quantity)

        @order.update(total: @order.order_items.pluck(:price).sum)

        redirect_to root_path, notice: 'adding to basket'
    end

    def destroy
        @item = OrderItem.find(params[:item_id])
        @item.destroy
        @item.order.update(total: @item.order.total - @item.price)

        redirect_to cart_path, notice: "#{@item.product.name} quitado del carrito"
    end
    
    
end