module Base
  class Parser
    def initialize(line)
      @line = line
    end

    def perform
      parse
    end

    private

    def parse
      elements = @line.split(' ')

      if elements.count > 2 || elements.empty?
        raise LineFormatError
      end

      { url: elements[0], ip: elements[1] }
    end
  end

end