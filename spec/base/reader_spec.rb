require 'base'

RSpec.describe Base::Reader do

  before do
    @reader = Base::Reader
  end

  context 'wrong directoy or file does not exist' do
    it 'raises FileNotFound error' do
      expect{ @reader.new('emptydirectory').perform }.to raise_error(FileNotFound)
    end
  end

  context 'a valid file is present' do
    it 'reads the file and yields n times' do
      #usar um fixture??
      expect{ |b| @reader.new('webserver.log').perform(&b) }.to yield_control.at_least(500).times
    end
  end

end