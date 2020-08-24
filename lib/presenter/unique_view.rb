module Presenter
  class UniqueView < Base

    private

    def title
      'Unique views'
    end

    def info
      'unique views'
    end

    def result
      Counter::UniquePageView.new(collection).perform
    end
  end
end