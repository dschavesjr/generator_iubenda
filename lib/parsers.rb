require 'json'

class JsonFileParser
    def parse
        raise "NotImplemented"
    end
end

class SectionFileParser < JsonFileParser
    def parse
        file = File.read('./datasets/sections.json')
        data_hash = JSON.parse(file)
        return data_hash
    end
end

class ClauseFileParser < JsonFileParser
    def parse
        file = File.read('./datasets/clauses.json')
        data_hash = JSON.parse(file)
        return data_hash
    end
end

class TemplateFileParser
    attr_accessor :filename

    def parse
        return nil unless File.file?('./templates/'+@filename)

        file = File.read('./templates/'+@filename)
        return file
    end
end