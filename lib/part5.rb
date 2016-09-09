class CartesianProduct
  include Enumerable

  # YOUR CODE HERE
  attr_accessor :collection1
  attr_accessor :collection2
  
  def initialize(collection1,collection2)
    @collection1=collection1
    @collection2=collection2
  end
  
  def each
    @collection1.each do |item1|
      @collection2.each do |item2|
        yield [item1, item2]
      end
    end
  end
end
