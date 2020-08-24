require 'base'

RSpec.describe Base::Parser do

  before do
    @parser = Base::Parser
  end

  subject { @parser.new(entry).perform }

  context 'line is not correctly formatted' do
    let(:entry) { '/help_page/1 3 126.318.035.038' }

    it 'raises LineFormatError' do
      expect{ subject }.to raise_error(LineFormatError)
    end

    let(:entry) { '' }

    it 'raises LineFormatError' do
      expect{ subject }.to raise_error(LineFormatError)
    end
  end

  context 'line is correctly formatted' do
    let(:entry) { '/help_page/1 126.318.035.038' }
    let(:parsed_entry) {
      {
        url: '/help_page/1',
        ip: '126.318.035.038'
      }
    }

    it 'parses a line entry' do
      expect(subject).to eq parsed_entry
    end
  end

end