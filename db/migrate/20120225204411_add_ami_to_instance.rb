class AddAmiToInstance < ActiveRecord::Migration
  def change
    add_column :ec2_amis, :ec2instance_id, :integer
    add_index :ec2_amis, :ec2instance_id

  end
end
