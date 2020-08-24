require 'base'

RSpec.describe Display do

  before do
    @display = Display

    Base.configuration.presenters = [Presenter::UniqueView, Presenter::View]
  end

  subject { @display.new(collection).perform }

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

    let(:result) {
      <<~RESULT
        Unique views
        /help_page/1         1 unique views
        /about               1 unique views
        /about/2             1 unique views
        /contact             1 unique views
        /index               1 unique views

        Views
        /about               3 visits
        /index               3 visits
        /help_page/1         2 visits
        /about/2             1 visits
        /contact             1 visits

      RESULT
    }

    it 'displays all configured presenters correctly' do
      expect{ subject }.to output(result).to_stdout
    end
  end

  context 'with invalid collection' do
    let(:collection) { {} }

    it 'raises Counter::UnexpectedEntryError' do
      expect{ subject }.to raise_error(UnexpectedEntryError)
    end
  end

end