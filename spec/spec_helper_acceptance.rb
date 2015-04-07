require 'beaker-rspec'
require 'pry'

# Install Puppet
install_pe

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  module_name = 'pe_mco_shell_agent'

  c.formatter = :documentation

  # Install module on master
  c.before :suite do
    puppet_module_install_on master, :module_name => module_name, :source => module_root
  end
end
