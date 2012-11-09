require 'spec_helper'

describe Forbidden do

  it 'has a data method' do
    Forbidden.data.should be_instance_of(Hash)
  end


  it 'has data for country with ndc 1' do
    Forbidden.data['1'].should be_instance_of(Array)
  end

end