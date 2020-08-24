module Counter
  class Base
    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def perform
      counter
    end

    private

    def counter
      if collection.nil? || collection.empty?
        raise UnexpectedEntryError
      end

      mapped_collection
        .flatten
        .group_by(&:itself)
        .transform_values(&:count)
        .sort_by {|url, count| -count }
    end
  end
end