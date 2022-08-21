require_relative './parsers'

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