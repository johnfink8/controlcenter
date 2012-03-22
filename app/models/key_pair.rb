class KeyPair < ActiveRecord::Base
  include Ec2Mixin
    after_initialize :initialize_ec2
  
    def initialize_ec2
      super
      @obj=@ec2.key_pairs[self.name]
    end
  
  def self.create!(name=nil)
    uuid=UUID.new
    name=uuid.generate :compact unless name
    ec2=AWS::EC2.new
    key=ec2.key_pairs.create(name)
    super(:name => name, :private_key => key.private_key)
  end
  
  def save_file(path)
    File.open(path,'wb').write(private_key)
  end
  
end
