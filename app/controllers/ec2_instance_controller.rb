class Ec2InstanceController < ApplicationController
  def list
    @instances = Ec2Instance.all
    
    respond_to do |format|
        #format.html
        format.json { render :json => @instances }
    end
  end
  
  def index
    @instances = Ec2Instance.all
  end
  def show
  end
end
