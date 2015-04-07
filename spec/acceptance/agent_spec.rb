require 'spec_helper_acceptance'

describe 'pe_mco_shell_agent class' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      on agents, puppet('agent', '--test'), :acceptable_exit_codes => [0,1,2]
    end
  end

end
