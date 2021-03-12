require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject { 
      @user = User.create!(email: 'test2@mail.com', password: 'asd123', password_confirmation: 'asd123')
      @order = Order.create!(user_id: @user.id, number: 'ads231321', total: 200000, state: 'en camino')
      @product = Product.create!(name: 'lavadora', price: 200000, quant: 10)

      described_class.new(
         order_id: @order.id,
         product_id: @product.id,
         quantity: 1,
         price: 10000
      )
   }

   it "quantity is not null" do
      subject.quantity = nil
      expect(subject).to_not be_valid  
   end
   
   it "price is not null" do
      subject.price = nil
      expect(subject).to_not be_valid  
   end

   it 'price cant be less than 10' do
      subject.price = 9
      expect(subject).to_not be_valid 
   end
   
   it 'quantity cant be less than 1' do
      subject.quantity = 0
      expect(subject).to_not be_valid 
   end

end
