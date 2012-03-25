class AwsAccount < ActiveRecord::Base
  after_initialize :initialize_ec2
  def initialize_ec2
  
    @ec2=AWS::EC2.new(
    :access_key_id => access_key_id,
    :secret_access_key => secret_access_key)
  end
  def method_missing(method_name, *args, &block)
    begin
      super
    rescue
      #raise NoMethodError unless @obj.respond_to?(method_name)
      @ec2.send(method_name, *args, &block)
    end
  end

end
