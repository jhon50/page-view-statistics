module Base
  class << self
    attr_accessor :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configuration_reset
      @configuration = Configuration.new
    end
  end

  class Configuration
    attr_accessor :file_path
    attr_accessor :presenters

    def initialize
      @file_path  = nil
      @presenters = nil
    end
  end
end
