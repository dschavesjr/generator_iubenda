require_relative './loaders'
require_relative './parsers'

class Section
    attr_reader :id, :clauses_ids

    def initialize(id, clauses_ids)
        @id = id
        @clauses_ids = clauses_ids
    end

    def self.find(id, loader: DatasetLoader.new(SectionFileParser.new))
        loader.load_dataset().each do |attributes|
            if attributes['id'] == id
                @section = new(attributes['id'], attributes['clauses_ids'])
                return @section
            end
        end
        return nil
    end
end