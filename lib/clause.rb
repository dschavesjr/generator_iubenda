require_relative './loaders'
require_relative './parsers'

class Clause
    attr_reader :id, :text

    def initialize(id, text)
        @id = id
        @text = text
    end

    def self.find(id, loader: DatasetLoader.new(ClauseFileParser.new))
        loader.load_dataset().each do |attributes|
            if attributes['id'] == id
                @clause = new(attributes['id'], attributes['text'])
                return @clause
            end
        end
        return nil
    end
end