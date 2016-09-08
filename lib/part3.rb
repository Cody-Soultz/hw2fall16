class Dessert

  def initialize(name, calories)
    # YOUR CODE HERE
    @name=name
    @calories=calories
  end
  
  attr_accessor :name
  attr_accessor :calories
  
  def healthy?
    # YOUR CODE HERE
    return true if calories < 200
  end
  
  def delicious?
    # YOUR CODE HERE
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    super(name, calories)
    @flavor=flavor
  end
  
  attr_accessor :flavor
  
  def delicious?
    # YOUR CODE HERE
    if flavor=="black licorice"
      return false
    else
      super
    end
  end
end
