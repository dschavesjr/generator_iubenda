# A Ruby App to Generate a Document
# based on a template using datasets

require 'json'

class FileParser
    def parse
        raise "NotImplemented"
    end
end

class SectionFileParser < FileParser
    def parse
        file = File.read('./datasets/sections.json')
        data_hash = JSON.parse(file)
        return data_hash
    end
end

class ClauseFileParser < FileParser
    def parse
        file = File.read('./datasets/clauses.json')
        data_hash = JSON.parse(file)
        return data_hash
    end
end

class TemplateFileParser < FileParser
    def initialize(filename)
        @filename = filename
    end

    def parse
        file = File.read('./templates/'+@filename)
        return file
    end
end

class DatasetLoader
    def initialize(datasetparser)
        @datasetparser = datasetparser
    end

    def load_dataset
        @datasetparser.parse()
    end
end

class TemplateLoader
    def self.load(templatekey)
        TemplateFileParser.new(templatekey).parse()
    end
end

class Section
    attr_reader :id, :clauses_ids

    def initialize(id, *clauses_ids)
        @id = id
        @clauses_ids = clauses_ids
    end

    def self.find(id)
        DatasetLoader.new(SectionFileParser.new).load_dataset().each do |attributes|
            if attributes['id'] == id
                @section = new(attributes['id'], attributes['clauses_ids'])
            end
        end
        return @section
    end
end

class Clause
    attr_reader :id, :text

    def initialize(id, text)
        @id = id
        @clauses_ids = clauses_ids
    end

    def self.find(id)
        DatasetLoader.new(ClauseFileParser.new).load_dataset().each do |attributes|
            if attributes['id'] == id
                @clause = new(attributes['id'], attributes['text'])
            end
        end
        return @clause
    end
end

class Template
    attr_reader :text

    def initialize (template)
        @text = TemplateLoader.load(template)
    end
end

class Generator

end

puts 'Enter with template file name (example.txt):'
template = Template.new(gets.chomp)
#puts Generator.create_document(template)