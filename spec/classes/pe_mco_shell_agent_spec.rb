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

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/shell.rb').with({
        'ensure'  => 'absent',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/agent/shell.rb',
      })
    end

  end

  describe "On Linux with all defaults and PE version > 2015.x.x with application selected" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '4.3.2'
    }}
    let(:params) {{
      :install_app => true,
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/application/shell.rb',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/agent/shell.rb',
      })
    end

  end

  describe "On Linux with all defaults and PE version > 2015.x.x with application selected and agent not selected" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '4.3.2'
    }}
    let(:params) {{
      :install_app    => true,
      :install_agent  => false,
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/application/shell.rb',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/shell.rb').with({
        'ensure'  => 'absent',
      })
    end

  end

  describe "On Linux with all defaults and PE version < 2015.x.x" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '3.8.2'
    }}
    let(:params) {{
      :install_app    => true,
      :install_agent  => false,
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/application/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/application/shell.rb',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell.rb').with({
        'ensure'  => 'absent',
      })
    end

  end

  describe "On Linux with all defaults and PE version < 2015.x.x with application selected" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '3.8.2'
    }}
    let(:params) {{
      :install_app    => true,
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/agent/shell.rb',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/application/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/application/shell.rb',
      })
    end

  end

  describe "On Linux with all defaults and PE version < 2015.x.x with application selected and agent not selected" do
    let(:facts) {{
      :kernel        => 'Linux',
      :puppetversion => '3.8.2'
    }}
    let(:params) {{
      :install_app    => true,
      :install_agent  => false,
    }}

    it { should contain_class('pe_mco_shell_agent') }

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell').with({
        'ensure' => 'directory',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/shell.rb').with({
        'ensure'  => 'absent',
      })
    end

    it do
      is_expected.to contain_file('/opt/puppet/libexec/mcollective/mcollective/application/shell.rb').with({
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'source'  => 'puppet:///modules/pe_mco_shell_agent/application/shell.rb',
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
