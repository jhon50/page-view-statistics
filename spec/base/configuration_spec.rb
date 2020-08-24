require 'base'

RSpec.describe Base::Configuration do

  before do
    @configuration = Base::Configuration
  end

  context 'configuration is set' do
    it 'retrieves config values when requested' do
      Base.configuration.file_path = 'randompath'
      expect(Base.configuration.file_path).to eq('randompath')
    end
  end

  context 'configuration is reset' do
    it 'retrieves empty config value' do
      Base.configuration_reset
      expect(Base.configuration.file_path).to eq(nil)
    end
  end

end