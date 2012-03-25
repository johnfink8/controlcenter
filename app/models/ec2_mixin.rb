module Ec2Mixin
  

  def method_missing(method_name, *args, &block)
    begin
      super
    rescue
      #raise NoMethodError unless @obj.respond_to?(method_name)
      @obj.send(method_name, *args, &block)
    end
  end
      
end
