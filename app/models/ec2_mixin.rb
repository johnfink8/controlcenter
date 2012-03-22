module Ec2Mixin
    def initialize_ec2
      @ec2=AWS::EC2.new
    end
    
    def method_missing(method_name, *args, &block)
      begin
        super
      rescue
        #raise NoMethodError unless @obj.respond_to?(method_name)
        @obj.send(method_name, *args, &block)
      end
    end
      
end
