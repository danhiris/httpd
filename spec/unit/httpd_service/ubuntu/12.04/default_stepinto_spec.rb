require 'spec_helper'

describe 'httpd_test_default::service on ubuntu-12.04' do
  let(:ubuntu_12_04_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'httpd_service',
      :platform => 'ubuntu',
      :version => '12.04'
      ) do |node|
      node.set['httpd']['service']['resource_name'] = 'ubuntu_12_04_default_stepinto'
    end.converge('httpd_test_default::service')
  end

  context 'when using default parameters' do
    it 'creates httpd_service[ubuntu_12_04_default]' do
      expect(ubuntu_12_04_default_stepinto_run).to create_httpd_service('ubuntu_12_04_default_stepinto').with(
        :version => '2.2',
        :listen_addresses => nil,
        :listen_ports => %w(80 443),
        :contact => 'webmaster@localhost',
        :timeout => '400',
        :keepalive => true,
        :keepaliverequests => '100',
        :keepalivetimeout => '5'
        )
    end
  end
end
