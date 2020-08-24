module Counter
  class UniquePageView < Base

    private

    def mapped_collection
      @collection
        .map { |ip, url| url.uniq }
    end
  end
end