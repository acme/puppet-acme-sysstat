require_relative 'spec_helper'

describe package('sysstat') do
  it { should be_installed }
end

describe service('sysstat') do
  it { should be_enabled }
end
