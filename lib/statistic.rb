require_relative 'base'

class Statistic
  def initialize(file_path)
    Base.configure do |config|
      config.file_path  = file_path
      config.presenters = [Presenter::UniqueView, Presenter::View]
    end
  end

  def perform
    collection = Builder.new.perform
    Display.new(collection).perform
  rescue ParameterNotProvided
    print 'Please add a file path as a parameter'
  rescue LineFormatError
    print 'There is a line with incorrect format in the provided file'
  rescue FileNotFound
    print 'The file was not found in the given path'
  rescue UnexpectedEntryError
    print 'There was an error when performing the counter'
  end
end