module Presenter
  class Base
    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def perform
      entries = result

      if entries.any?
        puts title
        result.each do |entry|
          format(entry)
        end
        puts
      end
    end

    private

    def format(entry)
      printf "%-20s %s %s\n", entry[0], entry[1], info
    end

  end
end