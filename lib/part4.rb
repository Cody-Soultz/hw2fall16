class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    puts "I am running in #{self.to_s} for the attr: #{attr_name}"
    class_eval %Q"
      alias_method :org_initialize, :initialize
        def initialize(*args)
          @#{attr_name}_history||=Array.new(1)
          puts \"ran my init for #{attr_name}\"
          org_initialize(*args)
        end
      def #{attr_name}=(new_attr_value)
        @#{attr_name}_history ||=Array.new(1)
        @#{attr_name}_history << new_attr_value
        @#{attr_name} = new_attr_value
      end"
  end
end

class Foo
  def initialize
    @myVar=1
    puts "In Foo initialize"
  end
  attr_accessor :myVar
  attr_accessor_with_history :bar
  #attr_accessor_with_history :quz
end