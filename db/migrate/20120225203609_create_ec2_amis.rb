class CreateEc2Amis < ActiveRecord::Migration
  def change
    create_table :ec2_amis do |t|
      t.string :name
      t.string :amiID

      t.timestamps
    end
  end
end
