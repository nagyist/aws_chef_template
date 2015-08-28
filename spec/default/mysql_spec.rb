require 'spec_helper'

%W(mysql-client-5.5 mysql-server-5.5).each do |pkg|
  describe package(pkg) do
    it { is_expected.to be_installed }
  end
end

describe service('mysql') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe port('3306') do
  it { is_expected.to be_listening }
end

describe command("mysql -uvagrant -pvagrant -e 'select user from mysql.user' | grep vagrant") do
  its(:exit_status) { is_expected.to eq 0}
end
