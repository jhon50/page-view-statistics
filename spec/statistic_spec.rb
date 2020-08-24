require 'base'

RSpec.describe Statistic do

  before do
    @statistic = Statistic
  end

  subject { @statistic.new(file_path).perform }

  context 'with valid file path' do
    let(:file_path) { 'spec/fixtures/webserver.log' }
    let(:result) {
      <<~RESULT
        Unique views
        /help_page/1         5 unique views
        /home                3 unique views
        /about               2 unique views
        /contact             2 unique views
        /about/2             2 unique views
        /index               1 unique views

        Views
        /help_page/1         6 visits
        /home                4 visits
        /about/2             4 visits
        /contact             3 visits
        /about               2 visits
        /index               1 visits

      RESULT
    }

    it 'displays all configured presenters correctly' do
      expect{ subject }.to output(result).to_stdout
    end
  end

  context 'with invalid file line format' do
    let(:file_path) { 'spec/fixtures/webserver_error.log' }

    it 'outputs correct error message' do
      expect{ subject }.to output('There is a line with incorrect format in the provided file').to_stdout
    end
  end

  context 'file was not found in the specified path' do
    let(:file_path) { 'spec/fixtures/webserverr.log' }

    it 'outputs correct error message' do
      expect{ subject }.to output('The file was not found in the given path').to_stdout
    end
  end

  context 'file parameter was not provided' do
    let(:file_path) { nil }

    it 'outputs correct error message' do
      expect{ subject }.to output('Please add a file path as a parameter').to_stdout
    end
  end

end