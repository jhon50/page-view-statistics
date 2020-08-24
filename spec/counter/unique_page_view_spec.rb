require 'base'

RSpec.describe Counter::UniquePageView do

  before do
    @counter = Counter::UniquePageView
  end

  subject { @counter.new(collection).perform }

  let(:result) {
    [['/help_page/1', 1], ['/about', 1], ['/about/2', 1], ['/contact', 1], ['/index', 1]]
  }

  context 'with valid collection' do
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

    it 'calculates the result correctly for page views' do
      expect(subject).to eq(result)
    end
  end

  context 'with invalid collection' do
    let(:invalid_collection) { {} }

    it 'raises UnexpectedEntryError' do
      expect{@counter.new(invalid_collection).perform}.to raise_error(UnexpectedEntryError)
    end
  end

end