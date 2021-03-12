require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject { 
    described_class.new(
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
