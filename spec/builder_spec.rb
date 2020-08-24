require 'base'

RSpec.describe Builder do

  before do
    @builder = Builder
    Base.configuration.file_path = file_path
  end

  subject { @builder.new.perform }

  context 'with valid file' do
    let(:file_path) { 'spec/fixtures/webserver.log' }

    let(:aggregated_hash) {
      {
        '126.318.035.038' => %w'/help_page/1 /about',
        '184.123.665.067' => %w'/contact /home /contact',
        '444.701.448.104' => %w'/about/2 /index /about/2',
        '929.398.951.889' => %w'/help_page/1 /help_page/1',
        '722.247.931.582' => %w'/help_page/1',
        '061.945.150.735' => %w'/about',
        '646.865.545.408' => %w'/help_page/1',
        '235.313.352.950' => %w'/home /home',
        '543.910.244.929' => %w'/help_page/1 /contact',
        '316.433.849.805' => %w'/home',
        '836.973.694.403' => %w'/about/2 /about/2'
      }
    }

    it 'builds aggregated hash correctly' do
      expect(subject).to eq(aggregated_hash)
    end
  end

  context 'with invalid file' do
    let(:file_path) { 'spec/fixtures/webserver_error.log' }

    it 'raises UnexpectedEntryError' do
      expect{ subject }.to raise_error(LineFormatError)
    end
  end

end