require 'spec_helper'

describe 'pe_mco_shell_agent' do

  describe "On Linux with all defaults and PE version > 2015.x.x" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '4.3.2'
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

  end

  describe "On Linux with all defaults and PE version < 2015.x.x" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '3.8.2'
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

  end

  describe "On Windows with all defaults" do
    let(:facts) {{
      :kernel => 'Windows',
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('C:/ProgramData/PuppetLabs/mcollective/plugins/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

  end

  describe "On a non-supported Kernel" do
    let(:facts) {{
      :kernel => 'fake',
    }}

    it 'should fail' do
      expect {is_expected.to raise_error(Puppet::Error, /^The fake kernel is not supported/)}
    end

  end

end
