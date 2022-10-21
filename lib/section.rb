require_relative './loaders'
require_relative './parsers'

class Section
    attr_reader :id, :clauses_ids

    def initialize(id, clauses_ids)
        @id = id
        @clauses_ids = clauses_ids
    end

    def self.find_all(ids, loader: DatasetLoader.new(SectionFileParser.new))
        @sections = []
        loader.load_dataset().each do |attributes|
            if ids.include? attributes['id']
                @sections << new(attributes['id'], attributes['clauses_ids'])
            end
        end
        return @sections
    end
end