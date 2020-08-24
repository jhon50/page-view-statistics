require_relative 'base'

class Display
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def perform
    Base.configuration.presenters.each do |presenter|
      presenter.new(collection).perform
    end
  end
end