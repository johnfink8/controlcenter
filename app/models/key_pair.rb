class KeyPair < ActiveRecord::Base
  include Ec2Mixin
  after_initialize :initialize_ec2
  belongs_to :aws_account
  
  def initialize_ec2
    @obj=aws_account.key_pairs[self.name]
  end
  
  def self.create!(aws_account,name=nil)
    uuid=UUID.new
    name=uuid.generate :compact unless name
    ec2=AWS::EC2.new
    key=ec2.key_pairs.create(name)
    super(:name => name, :private_key => key.private_key,:aws_account => aws_account)
  end
  
  def save_file(path)
    File.open(path,'wb') {|f| f.write(private_key)}
  end
  
end
