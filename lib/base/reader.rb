module Base
  class Reader
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def perform
      raise FileNotFound unless File.exist?(file)

      File.foreach(file) do |entry|
        yield(entry)
      end
    end

  end
end