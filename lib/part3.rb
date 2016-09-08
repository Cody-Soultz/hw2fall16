class Dessert

  attr_accessor :name
  attr_accessor :calories

  def initialize(name, calories)
    # YOUR CODE HERE
    self.name=name
    self.calories=calories
  end
  
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
  
  attr_accessor :flavor
  
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    super(name,calories)
    self.flavor=flavor
  end
  
  def delicious?
    # YOUR CODE HERE
    if flavor=="black licorice"
      return false
    else
      super
    end
  end
end
