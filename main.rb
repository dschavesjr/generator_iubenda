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
    attr_accessor :filename

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
    def initialize(templateparser)
        @templateparser = templateparser
    end
    
    def load(templatekey)
        @templateparser.filename = templatekey
        @templateparser.parse()
    end
end

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

class Template
    attr_reader :text

    def initialize (name, loader: TemplateLoader.new(TemplateFileParser.new))
        @text = loader.load(name)
    end

    def all_clauses_ids
        clauses_ids = @text.enum_for(:scan, /\[CLAUSE\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0]
        end.uniq
    end

    def all_sections_ids
        section_ids = @text.enum_for(:scan, /\[SECTION\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0]
        end.uniq
    end
end

class Generator
    def generate_document(template)
        return nil unless template.is_a? Template
        @document = template.text
        replace_clauses_tags(template.all_clauses_ids) 
        replace_sections_tags(template.all_sections_ids)
        @document
    end

    private

    def replace_clauses_tags(clauses_ids)
        clauses_ids.each do |id|
            clause = Clause.find(id.to_i)
            @document = @document.gsub!('[CLAUSE-'+id+']',  clause.text) unless clause.nil?
        end
    end

    def replace_sections_tags(section_ids)
        section_ids.each do |id|
            section = Section.find(id.to_i)
            unless section.nil?
                text = ''
                section.clauses_ids.each do |id|
                    clause = Clause.find(id)
                    text = text + clause.text + ';'
                end 
                @document = @document.gsub!('[SECTION-'+id+']',  text.chop)
            end
        end
    end
end

puts 'Enter with template file name (example.txt):'
template = Template.new('example.txt')
puts Generator.new.generate_document(template)