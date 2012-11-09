require 'spec_helper'

describe Mobile do

  it 'has a data method' do
    Mobile.data.should be_instance_of(Hash)
  end


  it 'has data for country with ndc 1' do
    Mobile.data['1'].should be_instance_of(Array)
  end

end