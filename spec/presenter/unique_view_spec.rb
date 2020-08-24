require 'base'

RSpec.describe Presenter::UniqueView do

  before do
    @presenter = Presenter::UniqueView
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
      Unique views
      /help_page/1         1 unique views
      /about               1 unique views
      /about/2             1 unique views
      /contact             1 unique views
      /index               1 unique views

    RESULT
  }

  context 'with valid collection' do
    it 'calculates the result correctly for page views' do
      expect{ subject }.to output(result).to_stdout
    end
  end

end