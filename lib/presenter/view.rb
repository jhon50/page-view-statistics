module Presenter
  class View < Base

    private

    def title
      'Views'
    end

    def info
      'visits'
    end

    def result
      Counter::PageView.new(collection).perform
    end

  end
end