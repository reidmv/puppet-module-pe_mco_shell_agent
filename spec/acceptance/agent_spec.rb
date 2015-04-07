require 'spec_helper_acceptance'

describe 'pe_mco_shell_agent class' do

  describe 'running puppet code' do
    # Using puppet apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        include pe_mco_shell_agent
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end
  end
end
