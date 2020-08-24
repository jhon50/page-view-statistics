require_relative 'base'

class Builder
  attr_reader :aggregated_hash
  attr_reader :file_path

  def initialize
    @file_path = Base.configuration.file_path
    raise ParameterNotProvided if @file_path.nil?

    @aggregated_hash = Hash.new { |hash, key| hash[key] = [] }
  end

  def perform
    build_aggregated_page_hits
  end

  private

  def build_aggregated_page_hits
    Base::Reader.new(file_path).perform do |line|
      parsed_entry = Base::Parser.new(line).perform
      aggregated_hash[parsed_entry[:ip]] << parsed_entry[:url]
    end

    aggregated_hash
  end

end