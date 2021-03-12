require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { 
    described_class.new(
                number: 'A342344', 
                total: 10000,
                state: 'en preparacion'
    )  
} 
  it "number cant be blank" do
    subject.number = nil    
    expect(subject).to_not be_valid 
  end

  it "total cant be blank" do
    subject.total = nil    
    expect(subject).to_not be_valid 
  end

  it "state cant be blank" do
    subject.state = nil    
    expect(subject).to_not be_valid 
  end

  it 'total cant be less than 10' do
    subject.total = 9
    expect(subject).to_not be_valid 
  end

  it "can have many orderItem" do
    expect(subject.order_items).to_not be_nil
  end

  it "can have many products" do
    expect(subject.products).to_not be_nil
  end
  
end
