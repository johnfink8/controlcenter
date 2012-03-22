class Ec2Ami < ActiveRecord::Base
    include Ec2Mixin
    after_initialize :initialize_ec2
    def initialize_ec2
        super
      @obj=@ec2.images[self.amiID]
    end
    
    def run_server(key=nil)
      return nil unless @image.exists?
      key=KeyPair.create! unless key and key.exists?
      instance=run_instance(:key_name=>key.name,:instance_type=>'t1.micro')
      username= location.match(/ubuntu/) ? 'ubuntu' : 'root'
      Ec2Instance.create!(
        :instanceid => instance.id, 
        :ec2_ami_id => self.id,
        :key_pair_id => key.id,
        :username => username)
    end
end
