require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @product = Product.new(
      name: 'limpiaparabrisas',
      price: 5000,
      quant: 10
    )  
  end
  
  test 'product should be valid' do
    assert @product.valid?
  end

  test 'product name cant be nil' do
    @product.name = nil
    refute @product.valid?, 'no puedes crear un producto sin nombre'
  end

end
