require 'spec_helper'

describe 'pe_mco_shell_agent' do
  it { should contain_class('pe_mco_shell_agent') }
end
