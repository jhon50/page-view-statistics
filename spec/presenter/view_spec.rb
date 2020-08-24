require 'base'

RSpec.describe Presenter::View do

  before do
    @presenter = Presenter::View
  end

  subject { @presenter.new(collection).perform }

  let(:invalid_collection) { {} }

  let(:collection) {
    {
      '126.318.035.038' =>
        %w(
          /help_page/1
          /about
          /about/2
          /about
          /contact
          /index
          /help_page/1
          /index
          /index
          /about
        )
    }
  }

  let(:result) {
    <<~RESULT
      Views
      /about               3 visits
      /index               3 visits
      /help_page/1         2 visits
      /about/2             1 visits
      /contact             1 visits

    RESULT
  }

  context 'with valid collection' do
    it 'calculates the result correctly for page views' do
      expect{ subject }.to output(result).to_stdout
    end
  end

end