require 'spec_helper'

describe 'sendmail::aliases::file' do

  context 'On Debian' do
    let(:facts) do
      { :operatingsystem => 'Debian' }
    end

    it {
      should contain_file('/etc/aliases').with(
               'ensure' => 'file',
               'owner'  => 'root',
               'group'  => 'root',
               'mode'   => '0644',
             )
    }
  end
end
