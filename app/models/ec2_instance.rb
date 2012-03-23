class Ec2Instance < ActiveRecord::Base
  belongs_to :ec2_ami
  belongs_to :key_pair
  
  after_initialize :initialize_ec2
  
  include Ec2Mixin
      
  def initialize_ec2
    super
    @obj=@ec2.instances[self.instanceid]
  end
  
  
  def ssh_command(cmd_text)
    raise "Instance not running" unless self.status == :running
    #can still throw "Errno::ECONNREFUSED: Connection refused - connect(2)" if server is booting
    ssh=Net::SSH.start(self.dns_name,self.username,{:keys_only => true, :key_data => [self.key_pair.private_key]})
    puts cmd_text
    ssh.exec! cmd_text do |ch, stream, data|
      if stream == :stderr
        print "\033[31m#{data}\033[0m"
      else
        print "\033[32m#{data}\033[0m"
      end
    end      
  end
  
  def fix_username!
    return nil unless username == 'ubuntu'
    ssh_command "sudo cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys"
    self.username = "root"
    self.save!
  end
end
