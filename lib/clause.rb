require_relative './loaders'
require_relative './parsers'

class Clause
    attr_reader :id, :text

    def initialize(id, text)
        @id = id
        @text = text
    end

    def self.find_all(id, loader: DatasetLoader.new(ClauseFileParser.new))
        @clauses = []
        loader.load_dataset().each do |attributes|
            if id.include? attributes['id']
                @clauses << new(attributes['id'], attributes['text'])
            end
        end
        return @clauses
    end
end