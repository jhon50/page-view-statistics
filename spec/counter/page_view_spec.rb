require 'base'

RSpec.describe Counter::PageView do

  before do
    @counter = Counter::PageView
  end

  subject { @counter.new(collection).perform }

  let(:result) {
    [['/about', 3], ['/index', 3], ['/help_page/1', 2], ['/about/2', 1], ['/contact', 1]]
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
    let(:collection) { {} }

    it 'raises UnexpectedEntryError' do
      expect{ subject }.to raise_error(UnexpectedEntryError)
    end
  end

end