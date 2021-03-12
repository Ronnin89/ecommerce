require 'rails_helper'

RSpec.describe "Products", type: :request do
  
  it 'access to products index' do
    get '/products'

    expect(response).to render_template(:index) 
  end

  it 'get almost one product' do
    Product.create(name: 'paraguas', price: 5000, quant: 5)
    @products = Product.all

    expect(@products.count).to_not equal(0)
  end

end
