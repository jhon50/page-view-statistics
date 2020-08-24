module Counter
  class PageView < Base

    private

    def mapped_collection
      @collection
        .map { |ip, url| url }
    end
  end
end