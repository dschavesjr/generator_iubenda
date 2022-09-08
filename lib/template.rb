require_relative './loaders'
require_relative './parsers'

class Template
    attr_reader :text

    def initialize (name, loader: TemplateLoader.new(TemplateFileParser.new))
        @text = loader.load(name)
    end

    def valid?
        @text.nil? ? false : true
    end
end