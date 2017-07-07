require 'spec_helper'
describe 'logconf' do

  context 'with defaults for all parameters' do
    it { should contain_class('logconf') }
  end
end
