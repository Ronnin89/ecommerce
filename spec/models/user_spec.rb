require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(email: 'test@mail.com', encrypted_password: '123456') } 
  
  it "can have many orders" do
    expect(subject.orders).to_not be nil
  end
  
end
