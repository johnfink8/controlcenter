class BuildScript < ActiveRecord::Base
  def run(instance)
    script.gsub(/\\\n/,' ').lines.each {|cmd| instance.ssh_command cmd}
  end
end
